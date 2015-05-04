#PWD:Glo-PV-DBOW\#
wget http://www.csie.ntu.edu.tw/~cjlin/liblinear/liblinear-1.96.zip
unzip liblinear-1.96.zip
cd liblinear-1.96
make
cd ../Vectors/
head sentence_vectors.txt -n 25000 | awk 'BEGIN{a=0;}{if (a<12500) printf "1 "; else printf "-1 "; for (b=1; b<NF; b++) printf b ":" $(b+1) " "; print ""; a++;}' > train-IMDB.txt
head sentence_vectors.txt -n 50000 | tail -n 25000 | awk 'BEGIN{a=0;}{if (a<12500) printf "1 "; else printf "-1 "; for (b=1; b<NF; b++) printf b ":" $(b+1) " "; print ""; a++;}' > test-IMDB.txt
../liblinear-1.96/train -s 0 train-IMDB.txt model1.96.logreg
../liblinear-1.96/predict -b 1 test-IMDB.txt model1.96.logreg out1.96.logreg
