set terminal png transparent size 640,240
set size 1.0,1.0

set terminal png transparent size 640,480
set output 'commits_by_author.png'
set key left top
set yrange [0:]
set xdata time
set timefmt "%s"
set format x "%Y-%m-%d"
set grid y
set ylabel "Commits"
set xtics rotate
set bmargin 6
plot 'commits_by_author.dat' using 1:2 title "Pascal Fautrero" w lines, 'commits_by_author.dat' using 1:3 title "Michaël Nourry" w lines, 'commits_by_author.dat' using 1:4 title "lafont" w lines, 'commits_by_author.dat' using 1:5 title "pascal fautrero" w lines, 'commits_by_author.dat' using 1:6 title "geoffrey.gekiere" w lines, 'commits_by_author.dat' using 1:7 title "Louis-Maurice De Sousa" w lines, 'commits_by_author.dat' using 1:8 title "pfautrero" w lines, 'commits_by_author.dat' using 1:9 title "geoffrey" w lines, 'commits_by_author.dat' using 1:10 title "flaf" w lines, 'commits_by_author.dat' using 1:11 title "ggekiere" w lines, 'commits_by_author.dat' using 1:12 title "root" w lines, 'commits_by_author.dat' using 1:13 title "Serge Raynaud" w lines, 'commits_by_author.dat' using 1:14 title "Louis De Sousa" w lines, 'commits_by_author.dat' using 1:15 title "Nourry Michael" w lines, 'commits_by_author.dat' using 1:16 title "Lafont François" w lines, 'commits_by_author.dat' using 1:17 title "Free Educational Software for Mobile Devices - Translations to Brazilian Portuguese" w lines
