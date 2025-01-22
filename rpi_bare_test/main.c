


#include "BCM2837.h"


int main(void)

{

	(*(volatile unsigned int*)BCM2837_GPFSEL2) |= 1<<3;

	int i = 0 ;

	while (1)
	{
		(*(volatile unsigned int*)BCM2837_GPSET0) = (1<<21);
		for (i = 0; i < 1000000; i++);
		(*(volatile unsigned int*)BCM2837_GPCLR0) = (1<<21);
		for (i = 0; i < 1000000; i++);
	}
	



	return 0; 
}
