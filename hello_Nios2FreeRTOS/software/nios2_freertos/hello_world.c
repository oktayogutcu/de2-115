#include <stdio.h>
#include <sys/alt_irq.h>
#include "system.h"
#include <FreeRTOS.h>
#include <task.h>
//#include "altera_avalon_pio_regs.h"

void task1 (void *p);
void task2 (void *p);

int main(void){
	printf("Hello from Nios II running FreeRTOS !!!\n");

	xTaskCreate(task1, "Task 1", 512, NULL, 2, NULL);
	xTaskCreate(task2, "Task 2", 512, NULL, 2, NULL);

	vTaskStartScheduler();

	return 0;
}


void task1 (void *p){
	while(1){
		printf("TASK 1 APPLICATION DONE EVERY 3 SECONDS\n");
		vTaskDelay(3000);
	}
}


void task2 (void *p){
	while(1){
		printf("TASK 2 APPLICATION DONE EVERY 2 SECONDS\n");
		vTaskDelay(2000);
	}
}
