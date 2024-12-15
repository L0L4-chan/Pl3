FUENTE = converter
PRUEBA = ejemplo1.txt
LIB = lfl

all: compile run

compile:
	flex $(FUENTE).l
	bison -o $(FUENTE).tab.c $(FUENTE).y -yd -r all
	gcc -o $(FUENTE) lex.yy.c $(FUENTE).tab.c -$(LIB) 

run:
	./$(FUENTE) < $(PRUEBA) 

run2:
	./$(FUENTE) 

clean:
	rm $(FUENTE) lex.yy.c $(FUENTE).tab.c $(FUENTE).tab.h $(FUENTE).output