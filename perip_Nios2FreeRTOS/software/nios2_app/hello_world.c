#include <stdio.h>
#include <sys/alt_irq.h>
#include "system.h"
#include <FreeRTOS.h>
#include <task.h>
#include "altera_avalon_pio_regs.h"

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
	uint32_t led_counter = 0;
	while(1){
		if(led_counter < 28){
			led_counter++;
		}
		else{
			led_counter = 0;
		}
		IOWR_ALTERA_AVALON_PIO_DATA(0x10001040, (uint32_t)1<<led_counter);
		printf("TASK 1: LIGTHENED LED IS LED%u \n", led_counter);
		vTaskDelay(200);
	}
}


void task2 (void *p){
	uint32_t switch_val = 0;
	while(1){
		switch_val = IORD_ALTERA_AVALON_PIO_DATA(0x10001030);
		printf("TASK 2: SWITCH VALUE IS %u \n", switch_val);
		vTaskDelay(2000);
	}
}
