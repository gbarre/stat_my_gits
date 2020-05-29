#!/bin/sh

start=$(($(date +%s%N)/1000000))
client_id=$1
client_secret=$2

root=$(cd "${0%/*}/.."; pwd)
gits="${root}/gits"
gitstats="${root}/gitstats"
stats="${root}/stats"

get_git_repo() {
  dir="$1"
  git="$2"

  if [ ! -d "${dir}" ]; then
    git clone "${git}" "${dir}"
  else
    cd "${dir}" && git pull
  fi
}

# Get gitstats
get_git_repo "${gitstats}" git://github.com/hoxu/gitstats.git

# List of repos
repos=$(curl -s -u "${client_id}:${client_secret}" 'https://api.github.com/user/repos' | jq --raw-output '.[]["name"]')

index="## Links to stats
"

# Do the job !
for repo in $(echo ${repos});
do
  echo "=== ${repo} ===";

  if [ ! -d "${stats}/${repo}" ]; then
    echo "Create repo dir..."
    mkdir "${stats}/${repo}"
  fi

  get_git_repo "${gits}/${repo}" "https://${client_secret}@github.com/${client_id}/${repo}.git"

  ${gitstats}/gitstats "${gits}/${repo}" "${stats}/${repo}"

  index="${index}
* [${repo}](./stats/${repo}/index.html)"
done

end=$(($(date +%s%N)/1000000))
duration=$((${end}-${start}))
s=$(((${duration}/1000)%60))
m=$(((${duration}/(1000*60))%60))
index="${index}

Generated on $(date '+%m/%e/%Y at %H:%M:%S') in ${m} min, ${s} seconds."
echo "${index}" > "${root}/README.md"