#! /bin/bash
sed 's/^M$//' data.csv
sed 's/\//-/g' data.csv > data2.csv
sed 's/-\([0-9][0-9]\);/-20\1;/' data2.csv > data3.csv
sed 's/\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\);/\3-\2-\1;/' data3.csv > data4.csv
tr '[:lower:]' '[:upper:]' < data4.csv > data5.csv
sed 's/;N/;\\N/g' data5.csv > data6.csv
sed 's/;;/;\\N;/g' data6.csv > data7.csv
sed 's/;\r$/;\\N/g' data7.csv > data8.csv
sed 's/;/,/g' data8.csv > data9.csv
sed 's/,\([0-9][0-9][0-9]\),\([0-9]\)/,\1.\2/' data9.csv > data10.csv
sed -i'/\\N/d' data10.csv 
rm data2.csv
rm data3.csv
rm data4.csv
rm data5.csv
rm data6.csv
rm data7.csv
rm data8.csv
rm data9.csv
rm data.csv
