`timescale 1ps/1ps
`include "packet_parser_types.sv"

module packet_parser #(
    parameter PACKET_LEN        = 256;
    parameter PACKET_RESULT_LEN = 104;
)(
    input  wire                             clk,
    input  wire                             rst,

    // data receive from mac(rx)
    input  logic                            rx_valid,
    input  logic [PACKET_LEN-1:0]           rx_data,
    output logic                            rx_ready,

    // data send to next module(tx)
    output  logic                           tx_valid,
    output  logic [PACKET_RESULT_LEN-1:0]   tx_data,
    input   logic                           tx_ready
);
    // define structure for store info from header
    five_tuples_t       flow_tuples;
    always_ff @( posedge clk ) begin  // the same to always @(posedge clk)
        if (rst) begin
            flow_tuples <= {$bits(five_tuples_t){1'b0}}; // $bits(five_tuples_t) similar to sizeof(a), we can get structure width
        end else if (rx_valid & rx_ready) begin  // data is available only valid & ready
            // set your logic
            flow_tuples.src_ip      <=    ...;
            flow_tuples.dst_ip      <=    ...;
            flow_tuples.src_port    <=    ...;
            flow_tuples.dst_port    <=    ...;
            flow_tuples.protocol    <=    ...;
        end 
    end  

    assign rx_ready = 1'b1;  // set your logic(for example after 3 clock, ready = 1, means data is available delay 3 clk)

    always_comb begin // the same to always @(*)
        if (tx_valid & tx_ready) begin
            tx_data = flow_tuples;
        end
    end
    
endmodule

思考以下问题：
1、always_ff和always_comb的区别，什么时候用前者，什么时候用后者，示例代码中使用有问题吗？
2、握手信号的使用规则
3、流数据的处理方式（pipeline的处理方式的实现）