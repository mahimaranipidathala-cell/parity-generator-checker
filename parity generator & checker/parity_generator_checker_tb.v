`timescale 1ns/1ps

module parity_generator_checker_tb;

    reg  [3:0] data_in;
    reg        received_parity;

    wire       generated_parity;
    wire       error;

    // Instantiate Parity Generator and Checker
    parity_generator_checker uut (
        .data_in(data_in),
        .received_parity(received_parity),
        .generated_parity(generated_parity),
        .error(error)
    );

    initial begin

        $display("==============================================");
        $display("       4-BIT PARITY GENERATOR & CHECKER");
        $display("==============================================");
        $display("Time\tData\tGenerated\tReceived\tError");
        $display("\t\tParity\t\tParity");
        $display("----------------------------------------------");

        // Test 1
        data_in = 4'b0000;
        received_parity = 1'b0;
        #10;
        $display("%0t\t%b\t%b\t\t%b\t\t%b",
                 $time, data_in, generated_parity,
                 received_parity, error);

        // Test 2
        data_in = 4'b0001;
        received_parity = 1'b1;
        #10;
        $display("%0t\t%b\t%b\t\t%b\t\t%b",
                 $time, data_in, generated_parity,
                 received_parity, error);

        // Test 3
        data_in = 4'b0011;
        received_parity = 1'b0;
        #10;
        $display("%0t\t%b\t%b\t\t%b\t\t%b",
                 $time, data_in, generated_parity,
                 received_parity, error);

        // Test 4
        data_in = 4'b0101;
        received_parity = 1'b0;
        #10;
        $display("%0t\t%b\t%b\t\t%b\t\t%b",
                 $time, data_in, generated_parity,
                 received_parity, error);

        // Test 5
        data_in = 4'b0111;
        received_parity = 1'b1;
        #10;
        $display("%0t\t%b\t%b\t\t%b\t\t%b",
                 $time, data_in, generated_parity,
                 received_parity, error);

        // Test 6
        data_in = 4'b1001;
        received_parity = 1'b0;
        #10;
        $display("%0t\t%b\t%b\t\t%b\t\t%b",
                 $time, data_in, generated_parity,
                 received_parity, error);

        // Test 7 - Intentional error
        data_in = 4'b1010;
        received_parity = 1'b1;
        #10;
        $display("%0t\t%b\t%b\t\t%b\t\t%b",
                 $time, data_in, generated_parity,
                 received_parity, error);

        // Test 8
        data_in = 4'b1111;
        received_parity = 1'b0;
        #10;
        $display("%0t\t%b\t%b\t\t%b\t\t%b",
                 $time, data_in, generated_parity,
                 received_parity, error);

        $display("----------------------------------------------");
        $display("Error = 0 -> No parity error");
        $display("Error = 1 -> Parity error detected");
        $display("----------------------------------------------");
        $display("           SIMULATION COMPLETED");
        $display("==============================================");

        $finish;

    end

endmodule