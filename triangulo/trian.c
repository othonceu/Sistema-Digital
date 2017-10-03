#include <stdio.h>
#include <stdlib.h>
#include <math.h>



/*
 1Exemplo de pontos que forma uma triangulo: 
 a(23,2),b(3,23),c(12,1)

 2Exemplo de pontos que forma uma triangulo: 
 a(23,3),b(1,25),c(2,33)

 3Exemplo de pontos que forma uma triangulo: 
 a(2,15),b(16,3),c(29,4)
 
*/

typedef struct ponto{
	int x, y;
}Ponto;


int calculaArea(Ponto a, Ponto b, Ponto c){
	int area;
	area = ((a.x * b.y) + (a.y * c.x) + (b.x * c.y)) - ((c.x * b.y) + (b.x * a.y) + (a.x * c.y));
	return area;
}

int main(){
	Ponto q;
	Ponto a;
	Ponto b;
	Ponto c;
	int i;
	int j;
     
     printf("Digite o valor do primeiro ponto\n");
     printf("X: ");
     scanf("%d",&a.x);
	printf("Y: ");
     scanf("%d",&a.y);

	printf("Digite o valor do segundo ponto\n");
     printf("X: ");
     scanf("%d",&b.x);
	printf("Y: ");
     scanf("%d",&b.y);

	printf("Digite o valor do terceiro ponto\n");
     printf("X: ");
     scanf("%d",&c.x);
	printf("Y: ");
     scanf("%d",&c.y);
	
	
	int area = calculaArea(a, b, c);
	
	if(area < 0)
		area = -area;
	printf(" Area e' : %d\n", area);
	
	int AB, AC, BC;
	
	for(i = 0; i < 50; i++){

		for(j = 0; j < 50; j++){

		q.x = i;
		q.y = j;

		AB = calculaArea(a, b, q);
		if(AB < 0)
			AB = -AB;
	
		AC = calculaArea(a, c, q);
		if(AC < 0)
			AC = -AC;
		
		BC = calculaArea(b, c, q);
		if(BC < 0)
			BC = -BC;


		if(AB + AC + BC <= area)
			printf("* ");
		else
			printf("  ");
		}
		printf("\n");
	}
	return 0;
}
