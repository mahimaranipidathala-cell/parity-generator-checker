module parity_generator_checker (
    input  wire [3:0] data_in,
    input  wire       received_parity,

    output wire       generated_parity,
    output wire       error
);

    // Even parity generation
    assign generated_parity = ^data_in;

    // Error detection
    // XOR of data and received parity should be 0
    // for correct even parity.
    assign error = ^{data_in, received_parity};

endmodule