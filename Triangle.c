
#include <stdio.h>

//Função que calcula a area de acordo com as coordenadas transmitidas;
int area(int x1, int y1,int x2,int y2,int x3, int y3){
	int area;
	area = ((x1*y2) + (y1*x3) + (x2*y3))- ((x3*y2) + (x2*y1) + (x1*y3));
	if(area < 0)
		area = area * (-1);
	return area;
}


int main(void){
	int areat, i, j, ab, ac, bc, x1,x2,x3,y1,y2,y3, op;

		do{
			printf("\e[0m|1|   \e[92mTRIÂNGULO:\e[0m \n");
			printf("\e[0m|0|   \e[91mSAIR\e[0m ");

			scanf("%d", &op);

			switch (op){
				case 1:

						printf("QUAIS AS COORDENADAS?\n");
						printf("1º X :\t");
						scanf("%d", &x1);
						printf("1º Y :\t");
						scanf("%d", &y1);
						printf("2º X :\t");
						scanf("%d", &x2);
						printf("2º Y :\t");
						scanf("%d", &y2);
						printf("3º X :\t");
						scanf("%d", &x3);
						printf("3º Y :\t");
						scanf("%d", &x1);

					areat = area(x1,y1,x2,y2,x3,y3);

					for(i=0; i<50; i++){
						for(j=0; j<50; j++){
							

							ab = area(x1,y1,x2,y2,i,j);
							ac = area(x1,y1, x3, y3, i, j);
							bc = area(x2,y2,x3,y3,i,j);
              
              //verifica se cada ponto da matriz [i][j] está dentro da area informada. 
              //caso esteja,imprime '*' senão,imprime '.';
              
							if((ab + ac + bc) <= areat)
								printf("\e[92m*\e[0m");
							
							else printf(".");
						}
					printf("\n");
					}

				break;

				case 2:
					return 0;
				break;
			}

		}while (op!=0);
	




	
	return 0;
}
