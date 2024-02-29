module TrafficLightController_tb;

  // Inputs
  reg clk;
  reg rst;
  reg pedestrian_button;

  // Outputs
  wire [1:0] current_state;
  wire red;
  wire yellow;
  wire green;

  // Instantiate the DUT (Design Under Test)
  TrafficLightController uut (
    .clk(clk),
    .rst(rst),
    .pedestrian_button(pedestrian_button),
    .current_state(current_state),
    .red(red),
    .yellow(yellow),
    .green(green)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Generate a clock signal with a period of 10 time units
  end

  // Stimulus generation
  initial begin
    // Initialize inputs
    clk = 0;
    rst = 0;
    pedestrian_button = 0;

    // Reset and observe initial state
    rst = 1;
    #10 rst = 0;

    // Test case 1: Normal operation
    #10 pedestrian_button = 1; // Pedestrian presses button
    #10 pedestrian_button = 0; // Pedestrian releases button
    #10 pedestrian_button = 1; // Pedestrian presses button
    #10 pedestrian_button = 0; // Pedestrian releases button

    // Test case 2: Pedestrian crossing
    #10 pedestrian_button = 1; // Pedestrian presses button
    #10 pedestrian_button = 0; // Pedestrian releases button
    #10 pedestrian_button = 1; // Pedestrian presses button
    #10 pedestrian_button = 0; // Pedestrian releases button

    // Add more test cases as needed

    // Finish simulation
    $finish;
  end

  // Monitor and display
  always @(posedge clk) begin
    $display("Time = %0t, State = %b, Red = %b, Yellow = %b, Green = %b", $time, current_state, red, yellow, green);
  end

endmodule
