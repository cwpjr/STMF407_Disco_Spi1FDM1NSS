	.area vectors(rom,rel)
__vectors::
	; you must use the .paddr directive so the correct form of the
        ; function address (i.e. with the low bit ON) is used
	.paddr	_NMI_Handler	; NMI_Handler
	.paddr	_HardFault_Handler	; HardFault_Handler
	.paddr	_MemManage_Handler	; MemManage_Handler
	.paddr	_BusFault_Handler	; BusFault_Handler
	.paddr	_UsageFault_Handler	; UsageFault_Handler
	.long	0			; ARM RESERVED
	.long	0
	.long	0
	.long	0
	.paddr	_SVC_Handler	; SVC_Handler
	.paddr	_DebugMon_Handler	; DebugMon_Handler
	.long	0			;
	.paddr	_PendSV_Handler	; PendSV_Handler
	.paddr	_JSAPI_SysTick_Handler	; SysTick_Handler
	; IRQ0 to IRQ31
	.paddr	_Default_Handler    ; 0
	.paddr	_Default_Handler    ; 1
	.paddr	_Default_Handler    ; 2
	.paddr	_Default_Handler    ; 3
	.paddr	_Default_Handler    ; 4
	.paddr	_Default_Handler    ; 5
	.paddr	_JSAPI_EXTI0_Handler      ; 6
	.paddr	_JSAPI_EXTI1_Handler      ; 7
    .paddr	_JSAPI_EXTI2_Handler      ; 8
	.paddr	_JSAPI_EXTI3_Handler      ; 9
	.paddr	_JSAPI_EXTI4_Handler      ; 10
	.paddr	_Default_Handler    ; 11
	.paddr	_Default_Handler    ; 12
	.paddr	_Default_Handler    ; 13
	.paddr	_Default_Handler    ; 14
	.paddr	_Default_Handler    ; 15
	.paddr	_Default_Handler    ; 16
	.paddr	_Default_Handler    ; 17
	.paddr	_Default_Handler    ; 18
	.paddr	_Default_Handler    ; 19
	.paddr	_Default_Handler    ; 20
	.paddr	_Default_Handler    ; 21
	.paddr	_Default_Handler    ; 22
	.paddr	_JSAPI_EXTI9_5_Handler      ; 23
	.paddr	_Default_Handler    ; 24
	.paddr	_JSAPI_TIM1_UP_TIM10_Handler; 25
	.paddr	_Default_Handler    ; 26
	.paddr	_Default_Handler    ; 27
	.paddr	_Default_Handler    ; 28
	.paddr	_Default_Handler    ; 29
	.paddr	_Default_Handler    ; 30
	.paddr	_JSAPI_I2C1_EV_Handler      ; 31
	.paddr	_Default_Handler    ; 32
	.paddr	_JSAPI_I2C2_EV_Handler      ; 33
	.paddr	_Default_Handler    ; 34
	.paddr	_Default_Handler    ; 35
	.paddr	_Default_Handler    ; 36
	.paddr	_JSAPI_USART1_IntrHandler   ; 37
	.paddr	_JSAPI_USART2_IntrHandler   ; 38
	.paddr	_JSAPI_USART3_IntrHandler   ; 39
	.paddr	_JSAPI_EXTI15_10_Handler    ; 40
	.paddr	_Default_Handler    ; 41
	.paddr	_Default_Handler    ; 42
	.paddr	_Default_Handler    ; 43
	.paddr	_Default_Handler    ; 44
	.paddr	_Default_Handler    ; 45
	.paddr	_Default_Handler    ; 46
	.paddr	_Default_Handler    ; 47
	.paddr	_Default_Handler    ; 48
	.paddr	_Default_Handler    ; 49
	.paddr	_Default_Handler    ; 50
	.paddr	_Default_Handler    ; 51
	.paddr	_JSAPI_USART4_IntrHandler    ; 52
	.paddr	_JSAPI_USART5_IntrHandler    ; 53
	.paddr	_Default_Handler    ; 54
	.paddr	_Default_Handler    ; 55
	.paddr	_Default_Handler    ; 56
	.paddr	_Default_Handler    ; 57
	.paddr	_Default_Handler    ; 58
	.paddr	_Default_Handler    ; 59
	.paddr	_Default_Handler    ; 60
	.paddr	_Default_Handler    ; 61
	.paddr	_Default_Handler    ; 62
	.paddr	_Default_Handler    ; 63
	.paddr	_Default_Handler    ; 64
	.paddr	_Default_Handler    ; 65
	.paddr	_Default_Handler    ; 66
	.paddr	_Default_Handler    ; 67
	.paddr	_Default_Handler    ; 68
	.paddr	_Default_Handler    ; 69
	.paddr	_Default_Handler    ; 70
	.paddr	_JSAPI_USART6_IntrHandler   ; 71
	.paddr	_JSAPI_I2C3_EV_Handler      ; 72
	.paddr	_Default_Handler    ; 73
	.paddr	_Default_Handler    ; 74
	.paddr	_Default_Handler    ; 75
	.paddr	_Default_Handler    ; 76
	.paddr	_Default_Handler    ; 77
	.paddr	_Default_Handler    ; 78
	.paddr	_Default_Handler    ; 79
	.paddr	_Default_Handler    ; 80
	.paddr	_Default_Handler    ; 81
	.paddr  _JSAPI_USART7_IntrHandler   ; 82
	.paddr  _JSAPI_USART8_IntrHandler   ; 83

	.area text(rom,con)
_HardFault_Handler::
    mov R1,#0
    tst     LR,#4
    bne    .ne
    mrs   r12,msp
    mvn R1,#0
    b       .next
.ne:
    mrs   r12,psp
.next:
    ldr     r0,[r12,#24]    ; stacked pc
    ldr     r2,[r12,#28]    ; psr
    b       _yHardFault_Handler