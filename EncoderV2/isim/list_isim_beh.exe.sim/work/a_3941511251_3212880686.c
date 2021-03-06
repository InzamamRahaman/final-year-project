/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/school/ise_projs/final-year-project/EncoderV2/list.vhd";
extern char *WORK_P_2894111808;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3941511251_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    int t6;
    char *t7;
    int t8;
    int t9;
    char *t10;
    char *t11;
    int t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    int t18;
    char *t19;
    int t20;
    char *t21;
    char *t22;
    int t23;
    int t24;
    int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned char t29;
    int t30;

LAB0:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB10;

LAB11:
LAB3:    t1 = (t0 + 3224);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(49, ng0);
    t1 = ((WORK_P_2894111808) + 1168U);
    t5 = *((char **)t1);
    t6 = *((int *)t5);
    t1 = (t0 + 5228);
    *((int *)t1) = 1;
    t7 = (t0 + 5232);
    *((int *)t7) = t6;
    t8 = 1;
    t9 = t6;

LAB5:    if (t8 <= t9)
        goto LAB6;

LAB8:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1928U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((int *)t1) = 0;
    goto LAB3;

LAB6:    xsi_set_current_line(50, ng0);
    t10 = (t0 + 1808U);
    t11 = *((char **)t10);
    t10 = (t0 + 5228);
    t12 = *((int *)t10);
    t13 = (t12 - 1);
    t14 = (t13 * 1);
    xsi_vhdl_check_range_of_index(1, 4, 1, *((int *)t10));
    t15 = (4U * t14);
    t16 = (0 + t15);
    t17 = (t11 + t16);
    *((int *)t17) = 0;

LAB7:    t1 = (t0 + 5228);
    t8 = *((int *)t1);
    t2 = (t0 + 5232);
    t9 = *((int *)t2);
    if (t8 == t9)
        goto LAB8;

LAB9:    t6 = (t8 + 1);
    t8 = t6;
    t5 = (t0 + 5228);
    *((int *)t5) = t8;
    goto LAB5;

LAB10:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1928U);
    t5 = *((char **)t2);
    t2 = (t5 + 0);
    *((int *)t2) = 0;
    xsi_set_current_line(55, ng0);
    t1 = ((WORK_P_2894111808) + 1168U);
    t2 = *((char **)t1);
    t6 = *((int *)t2);
    t1 = (t0 + 5236);
    *((int *)t1) = 1;
    t5 = (t0 + 5240);
    *((int *)t5) = t6;
    t8 = 1;
    t9 = t6;

LAB12:    if (t8 <= t9)
        goto LAB13;

LAB15:    xsi_set_current_line(75, ng0);
    t1 = ((WORK_P_2894111808) + 1168U);
    t2 = *((char **)t1);
    t6 = *((int *)t2);
    t1 = (t0 + 5244);
    *((int *)t1) = t6;
    t5 = (t0 + 5248);
    *((int *)t5) = 2;
    t8 = t6;
    t9 = 2;

LAB20:    if (t8 >= t9)
        goto LAB21;

LAB23:    xsi_set_current_line(84, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t6 = *((int *)t2);
    t1 = (t0 + 1808U);
    t5 = *((char **)t1);
    t8 = (1 - 1);
    t14 = (t8 * 1);
    t15 = (4U * t14);
    t16 = (0 + t15);
    t1 = (t5 + t16);
    *((int *)t1) = t6;
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 1928U);
    t2 = *((char **)t1);
    t6 = *((int *)t2);
    t1 = (t0 + 3304);
    t5 = (t1 + 56U);
    t7 = *((char **)t5);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    *((int *)t11) = t6;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB13:    xsi_set_current_line(56, ng0);
    t7 = (t0 + 1808U);
    t10 = *((char **)t7);
    t7 = (t0 + 5236);
    t12 = *((int *)t7);
    t13 = (t12 - 1);
    t14 = (t13 * 1);
    xsi_vhdl_check_range_of_index(1, 4, 1, *((int *)t7));
    t15 = (4U * t14);
    t16 = (0 + t15);
    t11 = (t10 + t16);
    t18 = *((int *)t11);
    t17 = (t0 + 1352U);
    t19 = *((char **)t17);
    t20 = *((int *)t19);
    t3 = (t18 == t20);
    if (t3 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1928U);
    t2 = *((char **)t1);
    t6 = *((int *)t2);
    t1 = (t0 + 1928U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((int *)t1) = t6;

LAB17:
LAB14:    t1 = (t0 + 5236);
    t8 = *((int *)t1);
    t2 = (t0 + 5240);
    t9 = *((int *)t2);
    if (t8 == t9)
        goto LAB15;

LAB19:    t6 = (t8 + 1);
    t8 = t6;
    t5 = (t0 + 5236);
    *((int *)t5) = t8;
    goto LAB12;

LAB16:    xsi_set_current_line(57, ng0);
    t17 = (t0 + 5236);
    t21 = (t0 + 1928U);
    t22 = *((char **)t21);
    t21 = (t22 + 0);
    *((int *)t21) = *((int *)t17);
    goto LAB17;

LAB21:    xsi_set_current_line(76, ng0);
    t7 = (t0 + 1928U);
    t10 = *((char **)t7);
    t12 = *((int *)t10);
    t3 = (t12 == 0);
    if (t3 != 0)
        goto LAB24;

LAB26:    t1 = (t0 + 1928U);
    t2 = *((char **)t1);
    t6 = *((int *)t2);
    t4 = (t6 > 1);
    if (t4 == 1)
        goto LAB29;

LAB30:    t3 = (unsigned char)0;

LAB31:    if (t3 != 0)
        goto LAB27;

LAB28:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 1808U);
    t2 = *((char **)t1);
    t1 = (t0 + 5244);
    t6 = *((int *)t1);
    t12 = (t6 - 1);
    t14 = (t12 * 1);
    xsi_vhdl_check_range_of_index(1, 4, 1, *((int *)t1));
    t15 = (4U * t14);
    t16 = (0 + t15);
    t5 = (t2 + t16);
    t13 = *((int *)t5);
    t7 = (t0 + 1808U);
    t10 = *((char **)t7);
    t7 = (t0 + 5244);
    t18 = *((int *)t7);
    t20 = (t18 - 1);
    t26 = (t20 * 1);
    xsi_vhdl_check_range_of_index(1, 4, 1, *((int *)t7));
    t27 = (4U * t26);
    t28 = (0 + t27);
    t11 = (t10 + t28);
    *((int *)t11) = t13;

LAB25:
LAB22:    t1 = (t0 + 5244);
    t8 = *((int *)t1);
    t2 = (t0 + 5248);
    t9 = *((int *)t2);
    if (t8 == t9)
        goto LAB23;

LAB32:    t6 = (t8 + -1);
    t8 = t6;
    t5 = (t0 + 5244);
    *((int *)t5) = t8;
    goto LAB20;

LAB24:    xsi_set_current_line(77, ng0);
    t7 = (t0 + 1808U);
    t11 = *((char **)t7);
    t7 = (t0 + 5244);
    t13 = *((int *)t7);
    t18 = (t13 - 1);
    t20 = (t18 - 1);
    t14 = (t20 * 1);
    xsi_vhdl_check_range_of_index(1, 4, 1, t18);
    t15 = (4U * t14);
    t16 = (0 + t15);
    t17 = (t11 + t16);
    t23 = *((int *)t17);
    t19 = (t0 + 1808U);
    t21 = *((char **)t19);
    t19 = (t0 + 5244);
    t24 = *((int *)t19);
    t25 = (t24 - 1);
    t26 = (t25 * 1);
    xsi_vhdl_check_range_of_index(1, 4, 1, *((int *)t19));
    t27 = (4U * t26);
    t28 = (0 + t27);
    t22 = (t21 + t28);
    *((int *)t22) = t23;
    goto LAB25;

LAB27:    xsi_set_current_line(79, ng0);
    t7 = (t0 + 1808U);
    t10 = *((char **)t7);
    t7 = (t0 + 5244);
    t18 = *((int *)t7);
    t20 = (t18 - 1);
    t23 = (t20 - 1);
    t14 = (t23 * 1);
    xsi_vhdl_check_range_of_index(1, 4, 1, t20);
    t15 = (4U * t14);
    t16 = (0 + t15);
    t11 = (t10 + t16);
    t24 = *((int *)t11);
    t17 = (t0 + 1808U);
    t19 = *((char **)t17);
    t17 = (t0 + 5244);
    t25 = *((int *)t17);
    t30 = (t25 - 1);
    t26 = (t30 * 1);
    xsi_vhdl_check_range_of_index(1, 4, 1, *((int *)t17));
    t27 = (4U * t26);
    t28 = (0 + t27);
    t21 = (t19 + t28);
    *((int *)t21) = t24;
    goto LAB25;

LAB29:    t1 = (t0 + 1928U);
    t5 = *((char **)t1);
    t12 = *((int *)t5);
    t1 = (t0 + 5244);
    t13 = *((int *)t1);
    t29 = (t12 == t13);
    t3 = t29;
    goto LAB31;

}


extern void work_a_3941511251_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3941511251_3212880686_p_0};
	xsi_register_didat("work_a_3941511251_3212880686", "isim/list_isim_beh.exe.sim/work/a_3941511251_3212880686.didat");
	xsi_register_executes(pe);
}
