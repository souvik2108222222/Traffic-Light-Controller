module TrafficLightController(
  input clk,
  input rst,
  input pedestrian_button,
  output reg [1:0] current_state,
  output reg red,
  output reg green,
  output reg yellow
);

  always @(posedge clk) begin
    if (rst) begin
      current_state <= 0;
    end else begin
      case (current_state)
        0: begin // Red
          if (pedestrian_button) begin
            current_state <= 1;
          end else begin
            current_state <= 2;
          end
        end
        1: begin // Yellow
          if (pedestrian_button) begin
            current_state <= 1;
          end else begin
            current_state <= 2;
          end
        end
        2: begin // Green
          if (pedestrian_button) begin
            current_state <= 0;
          end else begin
            current_state <= 2;
          end
        end
      endcase
    end
  end

  always @(posedge clk) begin
    if (current_state == 0) begin
      red <= 1;
      green <= 0;
      yellow <= 0;
    end else if (current_state == 1) begin
      red <= 1;
      green <= 0;
      yellow <= 1;
    end else if (current_state == 2) begin
      red <= 0;
      green <= 1;
      yellow <= 0;
    end
  end

endmodule
