FUENTE = converter
PRUEBA = ejemplo1.txt
LIB = lfl

all: compile run

compile:
	flex $(FUENTE).l
	bison -o $(FUENTE).tab.c $(FUENTE).y -yd -r all
	gcc -o $(FUENTE) lex.yy.c $(FUENTE).tab.c -$(LIB) 

run:

	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./$(FUENTE) < $(PRUEBA) 

run2:
	valgrind --leak-check=full --show-leak-kinds=all--track-origins=yes ./$(FUENTE) 

clean:
	rm $(FUENTE) lex.yy.c $(FUENTE).tab.c $(FUENTE).tab.h $(FUENTE).output