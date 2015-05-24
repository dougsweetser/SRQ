#!/bin/bash
cat book_to_merge.txt | mdmerge -o doing_special_relativity.0.md --book -
sed 's|\.\.\/\.\.\/\.\./images|images|g' doing_special_relativity.0.md | tee doing_special_relativity.1.md
sed 's|\.\.\/\.\./images|images|g' doing_special_relativity.1.md | tee doing_special_relativity.2.md
sed 's|\.\./images|images|g' doing_special_relativity.2.md | tee doing_special_relativity.3.md
sed 's|\.\./pdfs|pdfs|g' doing_special_relativity.3.md | tee doing_special_relativity.4.md
perl -ne 'if ($_ =~ /^[\!]/){chomp} print' doing_special_relativity.4.md | tee doing_special_relativity.5.md
perl -ne '$_ =~ s/^[\!]..*\]/\!\[\]/; print' doing_special_relativity.5.md | tee doing_special_relativity.6.md
perl -ne 'if ($_ =~ /^[\!]\[[^\]].*[^\)]/){chomp} print' doing_special_relativity.6.md | tee doing_special_relativity.7.md
perl -ne '$_ =~ s/^[\!]\[[^\]]..*\]/\!\[\]/; print' doing_special_relativity.7.md | tee doing_special_relativity.8.md
perl -ne 'if ($_ =~ /^[\!]\[[^\]].*[^\)]/){chomp} print' doing_special_relativity.8.md | tee doing_special_relativity.9.md
perl -ne '$_ =~ s/^[\!]\[[^\]]..*\]/\!\[\]/; print' doing_special_relativity.9.md | tee doing_special_relativity.10.md
sed '/./,/^$/!d' doing_special_relativity.10.md | tee doing_special_relativity.md
perl -e '@f = 0..10; for $f (@f){unlink("doing_special_relativity.$f.md");}'
