// GW5AST-138 PLL: 50 MHz board clock -> 20 MHz CPU clock.
// VCO = 50 MHz * MDIV_SEL / IDIV_SEL = 800 MHz; CLKOUT0 = VCO / ODIV0_SEL.
module tang138k_pll (
    input  wire clkin,
    output wire clkout0,
    output wire lock
);

wire gw_vcc = 1'b1;
wire gw_gnd = 1'b0;

PLL PLL_inst (
    .LOCK(lock),
    .CLKOUT0(clkout0),
    .CLKOUT1(),
    .CLKOUT2(),
    .CLKOUT3(),
    .CLKOUT4(),
    .CLKOUT5(),
    .CLKOUT6(),
    .CLKFBOUT(),
    .CLKIN(clkin),
    .CLKFB(gw_gnd),
    .RESET(gw_gnd),
    .PLLPWD(gw_gnd),
    .RESET_I(gw_gnd),
    .RESET_O(gw_gnd),
    .FBDSEL(6'd0),
    .IDSEL(6'd0),
    .MDSEL(7'd0),
    .MDSEL_FRAC(3'd0),
    .ODSEL0(7'd0),
    .ODSEL0_FRAC(3'd0),
    .ODSEL1(7'd0),
    .ODSEL2(7'd0),
    .ODSEL3(7'd0),
    .ODSEL4(7'd0),
    .ODSEL5(7'd0),
    .ODSEL6(7'd0),
    .DT0(4'd0),
    .DT1(4'd0),
    .DT2(4'd0),
    .DT3(4'd0),
    .ICPSEL(6'd0),
    .LPFRES(3'd0),
    .LPFCAP(2'd0),
    .PSSEL(3'd0),
    .PSDIR(gw_gnd),
    .PSPULSE(gw_gnd),
    .ENCLK0(gw_vcc),
    .ENCLK1(gw_gnd),
    .ENCLK2(gw_gnd),
    .ENCLK3(gw_gnd),
    .ENCLK4(gw_gnd),
    .ENCLK5(gw_gnd),
    .ENCLK6(gw_gnd),
    .SSCPOL(gw_gnd),
    .SSCON(gw_gnd),
    .SSCMDSEL(7'd0),
    .SSCMDSEL_FRAC(3'd0)
);

defparam PLL_inst.FCLKIN = "50";
defparam PLL_inst.IDIV_SEL = 1;
defparam PLL_inst.FBDIV_SEL = 1;
defparam PLL_inst.MDIV_SEL = 16;
defparam PLL_inst.MDIV_FRAC_SEL = 0;
defparam PLL_inst.ODIV0_SEL = 40;
defparam PLL_inst.ODIV0_FRAC_SEL = 0;
defparam PLL_inst.CLKOUT0_EN = "TRUE";
defparam PLL_inst.CLKOUT1_EN = "FALSE";
defparam PLL_inst.CLKOUT2_EN = "FALSE";
defparam PLL_inst.CLKOUT3_EN = "FALSE";
defparam PLL_inst.CLKOUT4_EN = "FALSE";
defparam PLL_inst.CLKOUT5_EN = "FALSE";
defparam PLL_inst.CLKOUT6_EN = "FALSE";
defparam PLL_inst.CLKFB_SEL = "INTERNAL";
defparam PLL_inst.DYN_DPA_EN = "FALSE";
defparam PLL_inst.RESET_I_EN = "FALSE";
defparam PLL_inst.RESET_O_EN = "FALSE";
defparam PLL_inst.SSC_EN = "FALSE";
defparam PLL_inst.DYN_IDIV_SEL = "FALSE";
defparam PLL_inst.DYN_FBDIV_SEL = "FALSE";
defparam PLL_inst.DYN_MDIV_SEL = "FALSE";
defparam PLL_inst.DYN_ODIV0_SEL = "FALSE";
defparam PLL_inst.DYN_ICP_SEL = "FALSE";
defparam PLL_inst.DYN_LPF_SEL = "FALSE";

endmodule
