# $Id: Makefile,v 1.1 2001/11/09 18:27:44 zigg Exp $ 
#
# Recursive make.

.DEFAULT:
	for dir in `pwd`/*; \
	do \
		if [ -f $$dir/Makefile ]; \
		then \
			cd $$dir && make $@ ; \
		fi; \
	done

