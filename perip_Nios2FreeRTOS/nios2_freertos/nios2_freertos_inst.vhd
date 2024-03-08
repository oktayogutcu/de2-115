	component nios2_freertos is
		port (
			clk_clk          : in    std_logic                     := 'X';             -- clk
			sdram_wire_addr  : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba    : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n : out   std_logic;                                        -- cas_n
			sdram_wire_cke   : out   std_logic;                                        -- cke
			sdram_wire_cs_n  : out   std_logic;                                        -- cs_n
			sdram_wire_dq    : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm   : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_wire_ras_n : out   std_logic;                                        -- ras_n
			sdram_wire_we_n  : out   std_logic;                                        -- we_n
			sdram_clk_clk    : out   std_logic;                                        -- clk
			led_export       : out   std_logic_vector(26 downto 0);                    -- export
			sw_export        : in    std_logic_vector(17 downto 0) := (others => 'X'); -- export
			btn_export       : in    std_logic_vector(3 downto 0)  := (others => 'X')  -- export
		);
	end component nios2_freertos;

	u0 : component nios2_freertos
		port map (
			clk_clk          => CONNECTED_TO_clk_clk,          --        clk.clk
			sdram_wire_addr  => CONNECTED_TO_sdram_wire_addr,  -- sdram_wire.addr
			sdram_wire_ba    => CONNECTED_TO_sdram_wire_ba,    --           .ba
			sdram_wire_cas_n => CONNECTED_TO_sdram_wire_cas_n, --           .cas_n
			sdram_wire_cke   => CONNECTED_TO_sdram_wire_cke,   --           .cke
			sdram_wire_cs_n  => CONNECTED_TO_sdram_wire_cs_n,  --           .cs_n
			sdram_wire_dq    => CONNECTED_TO_sdram_wire_dq,    --           .dq
			sdram_wire_dqm   => CONNECTED_TO_sdram_wire_dqm,   --           .dqm
			sdram_wire_ras_n => CONNECTED_TO_sdram_wire_ras_n, --           .ras_n
			sdram_wire_we_n  => CONNECTED_TO_sdram_wire_we_n,  --           .we_n
			sdram_clk_clk    => CONNECTED_TO_sdram_clk_clk,    --  sdram_clk.clk
			led_export       => CONNECTED_TO_led_export,       --        led.export
			sw_export        => CONNECTED_TO_sw_export,        --         sw.export
			btn_export       => CONNECTED_TO_btn_export        --        btn.export
		);

