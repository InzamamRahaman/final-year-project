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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *WORK_P_1416099703;
char *STD_TEXTIO;
char *IEEE_P_2592010699;
char *STD_STANDARD;
char *WORK_P_2894111808;
char *WORK_P_2286664192;
char *IEEE_P_1242562249;
char *IEEE_P_3564397177;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    work_p_2894111808_init();
    work_p_2286664192_init();
    work_p_1416099703_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_a_1104041532_3212880686_init();
    work_a_2254993674_3212880686_init();
    work_a_2053059872_3212880686_init();


    xsi_register_tops("work_a_2053059872_3212880686");

    WORK_P_1416099703 = xsi_get_engine_memory("work_p_1416099703");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    WORK_P_2894111808 = xsi_get_engine_memory("work_p_2894111808");
    WORK_P_2286664192 = xsi_get_engine_memory("work_p_2286664192");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");

    return xsi_run_simulation(argc, argv);

}
