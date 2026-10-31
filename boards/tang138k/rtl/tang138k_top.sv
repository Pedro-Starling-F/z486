module tang138k_top #(
    parameter LED_ACTIVE_LOW = 1'b1,
    parameter ENABLE_X87 = 1'b1
) (
    input  logic       sys_clk,
    input  logic       rst_n,
    output logic [5:0] led
);

logic cpu_clk;
logic pll_lock;
logic cpu_reset_n;
logic [7:0] logical_led;

// GW5A fabric closes about 23 MHz for the full CPU, so run it at 20 MHz.
tang138k_pll cpu_clock (
    .clkin(sys_clk),
    .clkout0(cpu_clk),
    .lock(pll_lock)
);

reset_sync reset_release (
    .clk(cpu_clk),
    .arst_n(rst_n && pll_lock),
    .reset_n(cpu_reset_n)
);

z486_led_demo_soc #(
    .CLOCK_RATE_MHZ(7'd20),
    .ENABLE_X87(ENABLE_X87),
    .FIRMWARE_HEX("blink.hex")
) demo (
    .clk(cpu_clk),
    .reset_n(cpu_reset_n),
    .led(logical_led),
    .firmware_seen(),
    .led_write_pulse(),
    .led_write_data(),
    .triple_fault(),
    .dbg_cs(),
    .dbg_eip()
);

// The dock has six user LEDs; show the low six bits of port 0x80.
always_comb
    led = LED_ACTIVE_LOW ? ~logical_led[5:0] : logical_led[5:0];

endmodule
