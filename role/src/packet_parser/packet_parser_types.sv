`ifndef   _PACKET_PARSER_TYPES_
`define   _PACKET_PARSER_TYPES_

typedef struct packed {
    logic [31:0]  src_ip;
    logic [31:0]  dst_ip;
    logic [15:0]  src_port;
    logic [15:0]  dst_port;
    logic [7:0]   protocol;
} five_tuples_t; // suffix of struct variable is _t

`endif 