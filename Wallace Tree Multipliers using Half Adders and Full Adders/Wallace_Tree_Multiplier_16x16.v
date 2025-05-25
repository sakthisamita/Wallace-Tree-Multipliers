module Wallace_Tree_Multiplier_16x16(
    input [15:0] A,
    input [15:0] B,
    output [31:0] Product
    );
    
    wire [240:1] S, C;
    wire ab [15:0][15:0];
    
    genvar i, j;
    generate
        for (i=0; i<16; i=i+1) begin:row
            for (j=0; j<16; j=j+1) begin:col
                assign ab[i][j]=A[i]&B[j];
            end
        end
    endgenerate
    
    // Stage - 1
    Half_Adder HA1 (ab[1][14],ab[0][15],S[1],C[1]);
    Half_Adder HA2 (ab[2][14],ab[1][15],S[2],C[2]);
    
    // Stage - 2
    Half_Adder HA3 (ab[1][13],ab[0][14],S[3],C[3]);
    Full_Adder FA4 (ab[4][11],ab[3][12],ab[2][13],S[4],C[4]);
    Full_Adder FA5 (ab[5][11],ab[4][12],ab[3][13],S[5],C[5]);
    Full_Adder FA6 (ab[4][13],ab[3][14],ab[2][15],S[6],C[6]);
    
    // Stage - 3
    Half_Adder HA7 (ab[1][12],ab[0][13],S[7],C[7]);
    Full_Adder FA8 (ab[4][10],ab[3][11],ab[2][12],S[8],C[8]);
    Full_Adder FA9 (ab[7][8],ab[6][9],ab[5][10],S[9],C[9]);
    Full_Adder FA10 (ab[8][8],ab[7][9],ab[6][10],S[10],C[10]);
    Full_Adder FA11 (ab[7][10],ab[6][11],ab[5][12],S[11],C[11]);
    Full_Adder FA12 (ab[5][13],ab[4][14],ab[3][15],S[12],C[12]);
    
    // Stage - 4
    Half_Adder HA13 (ab[1][11],ab[0][12],S[13],C[13]);
    Full_Adder FA14 (ab[4][9],ab[3][10],ab[2][11],S[14],C[14]);
    Full_Adder FA15 (ab[7][7],ab[6][8],ab[5][9],S[15],C[15]);
    Full_Adder FA16 (ab[10][5],ab[9][6],ab[8][7],S[16],C[16]);
    Full_Adder FA17 (ab[11][5],ab[10][6],ab[9][7],S[17],C[17]);
    Full_Adder FA18 (ab[10][7],ab[9][8],ab[8][9],S[18],C[18]);
    Full_Adder FA19 (ab[8][10],ab[7][11],ab[6][12],S[19],C[19]);
    Full_Adder FA20 (ab[6][13],ab[5][14],ab[4][15],S[20],C[20]);
    
    // Stage - 5
    Half_Adder HA21 (ab[1][10],ab[0][11],S[21],C[21]);
    Full_Adder FA22 (ab[4][8],ab[3][9],ab[2][10],S[22],C[22]);
    Full_Adder FA23 (ab[7][6],ab[6][7],ab[5][8],S[23],C[23]);
    Full_Adder FA24 (ab[10][4],ab[9][5],ab[8][6],S[24],C[24]);
    Full_Adder FA25 (ab[13][2],ab[12][3],ab[11][4],S[25],C[25]);
    Full_Adder FA26 (ab[14][2],ab[13][3],ab[12][4],S[26],C[26]);
    Full_Adder FA27 (ab[13][4],ab[12][5],ab[11][6],S[27],C[27]);
    Full_Adder FA28 (ab[11][7],ab[10][8],ab[9][9],S[28],C[28]);
    Full_Adder FA29 (ab[9][10],ab[8][11],ab[7][12],S[29],C[29]);
    Full_Adder FA30 (ab[7][13],ab[6][14],ab[5][15],S[30],C[30]);
    
    // Stage - 6
    Half_Adder HA31 (ab[1][9],ab[0][10],S[31],C[31]);
    Full_Adder FA32 (ab[4][7],ab[3][8],ab[2][9],S[32],C[32]);
    Full_Adder FA33 (ab[7][5],ab[6][6],ab[5][7],S[33],C[33]);
    Full_Adder FA34 (ab[10][3],ab[9][4],ab[8][5],S[34],C[34]);
    Full_Adder FA35 (ab[13][1],ab[12][2],ab[11][3],S[35],C[35]);
    Full_Adder FA36 (S[1],ab[15][0],ab[14][1],S[36],C[36]);
    Full_Adder FA37 (C[1],S[2],ab[15][1],S[37],C[37]);
    Full_Adder FA38 (C[2],ab[15][2],ab[14][3],S[38],C[38]);
    Full_Adder FA39 (ab[14][4],ab[13][5],ab[12][6],S[39],C[39]);
    Full_Adder FA40 (ab[12][7],ab[11][8],ab[10][9],S[40],C[40]);
    Full_Adder FA41 (ab[10][10],ab[9][11],ab[8][12],S[41],C[41]);
    Full_Adder FA42 (ab[8][13],ab[7][14],ab[6][15],S[42],C[42]);
    
    // Stage - 7
    Half_Adder HA43 (ab[1][8],ab[0][9],S[43],C[43]);
    Full_Adder FA44 (ab[4][6],ab[3][7],ab[2][8],S[44],C[44]);
    Full_Adder FA45 (ab[7][4],ab[6][5],ab[5][6],S[45],C[45]);
    Full_Adder FA46 (ab[10][2],ab[9][3],ab[8][4],S[46],C[46]);
    Full_Adder FA47 (ab[13][0],ab[12][1],ab[11][2],S[47],C[47]);
    Full_Adder FA48 (S[8],S[3],ab[14][0],S[48],C[48]);
    Full_Adder FA49 (S[9],C[3],S[4],S[49],C[49]);
    Full_Adder FA50 (S[10],C[4],S[5],S[50],C[50]);
    Full_Adder FA51 (S[11],C[5],S[6],S[51],C[51]);
    Full_Adder FA52 (S[12],C[6],ab[15][3],S[52],C[52]);
    Full_Adder FA53 (ab[15][4],ab[14][5],ab[13][6],S[53],C[53]);
    Full_Adder FA54 (ab[13][7],ab[12][8],ab[11][9],S[54],C[54]);
    Full_Adder FA55 (ab[11][10],ab[10][11],ab[9][12],S[55],C[55]);
    Full_Adder FA56 (ab[9][13],ab[8][14],ab[7][15],S[56],C[56]);
    
    // Stage - 8
    Half_Adder HA57 (ab[1][7],ab[0][8],S[57],C[57]);
    Full_Adder FA58 (ab[4][5],ab[3][6],ab[2][7],S[58],C[58]);
    Full_Adder FA59 (ab[7][3],ab[6][4],ab[5][5],S[59],C[59]);
    Full_Adder FA60 (ab[10][1],ab[9][2],ab[8][3],S[60],C[60]);
    Full_Adder FA61 (S[13],ab[12][0],ab[11][1],S[61],C[61]);
    Full_Adder FA62 (C[13],S[14],S[7],S[62],C[62]);
    Full_Adder FA63 (C[14],S[15],C[7],S[63],C[63]);
    Full_Adder FA64 (C[15],S[16],C[8],S[64],C[64]);
    Full_Adder FA65 (C[16],S[17],C[9],S[65],C[65]);
    Full_Adder FA66 (C[17],S[18],C[10],S[66],C[66]);
    Full_Adder FA67 (C[18],S[19],C[11],S[67],C[67]);
    Full_Adder FA68 (C[19],S[20],C[12],S[68],C[68]);
    Full_Adder FA69 (C[20],ab[15][5],ab[14][6],S[69],C[69]);
    Full_Adder FA70 (ab[14][7],ab[13][8],ab[12][9],S[70],C[70]);
    Full_Adder FA71 (ab[12][10],ab[11][11],ab[10][12],S[71],C[71]);
    Full_Adder FA72 (ab[10][13],ab[9][14],ab[8][15],S[72],C[72]);    
    
    // Stage - 9
    Half_Adder HA73 (ab[1][6],ab[0][7],S[73],C[73]);
    Full_Adder FA74 (ab[4][4],ab[3][5],ab[2][6],S[74],C[74]);
    Full_Adder FA75 (ab[7][2],ab[6][3],ab[5][4],S[75],C[75]);
    Full_Adder FA76 (ab[10][0],ab[9][1],ab[8][2],S[76],C[76]);
    Full_Adder FA77 (S[32],S[21],ab[11][0],S[77],C[77]);
    Full_Adder FA78 (S[33],C[21],S[22],S[78],C[78]);
    Full_Adder FA79 (S[34],C[22],S[23],S[79],C[79]);
    Full_Adder FA80 (S[35],C[23],S[24],S[80],C[80]);
    Full_Adder FA81 (S[36],C[24],S[25],S[81],C[81]);
    Full_Adder FA82 (S[37],C[25],S[26],S[82],C[82]);
    Full_Adder FA83 (S[38],C[26],S[27],S[83],C[83]);
    Full_Adder FA84 (S[39],C[27],S[28],S[84],C[84]);
    Full_Adder FA85 (S[40],C[28],S[29],S[85],C[85]);
    Full_Adder FA86 (S[41],C[29],S[30],S[86],C[86]);
    Full_Adder FA87 (S[42],C[30],ab[15][6],S[87],C[87]);
    Full_Adder FA88 (ab[15][7],ab[14][8],ab[13][9],S[88],C[88]);
    Full_Adder FA89 (ab[13][10],ab[12][11],ab[11][12],S[89],C[89]);
    Full_Adder FA90 (ab[11][13],ab[10][14],ab[9][15],S[90],C[90]);  
    
    // Stage - 10
    Half_Adder HA91 (ab[1][5],ab[0][6],S[91],C[91]);
    Full_Adder FA92 (ab[4][3],ab[3][4],ab[2][5],S[92],C[92]);
    Full_Adder FA93 (ab[7][1],ab[6][2],ab[5][3],S[93],C[93]);
    Full_Adder FA94 (S[43],ab[9][0],ab[8][1],S[94],C[94]);
    Full_Adder FA95 (C[43],S[44],S[31],S[95],C[95]);
    Full_Adder FA96 (C[44],S[45],C[31],S[96],C[96]);
    Full_Adder FA97 (C[45],S[46],C[32],S[97],C[97]);
    Full_Adder FA98 (C[46],S[47],C[33],S[98],C[98]);
    Full_Adder FA99 (C[47],S[48],C[34],S[99],C[99]);
    Full_Adder FA100 (C[48],S[49],C[35],S[100],C[100]);
    Full_Adder FA101 (C[49],S[50],C[36],S[101],C[101]);
    Full_Adder FA102 (C[50],S[51],C[37],S[102],C[102]);
    Full_Adder FA103 (C[51],S[52],C[38],S[103],C[103]);
    Full_Adder FA104 (C[52],S[53],C[39],S[104],C[104]);
    Full_Adder FA105 (C[53],S[54],C[40],S[105],C[105]);
    Full_Adder FA106 (C[54],S[55],C[41],S[106],C[106]);
    Full_Adder FA107 (C[55],S[56],C[42],S[107],C[107]);
    Full_Adder FA108 (C[56],ab[15][8],ab[14][9],S[108],C[108]);
    Full_Adder FA109 (ab[14][10],ab[13][11],ab[12][12],S[109],C[109]);
    Full_Adder FA110 (ab[12][13],ab[11][14],ab[10][15],S[110],C[110]);  
    
    // Stage - 11
    Half_Adder HA111 (ab[1][4],ab[0][5],S[111],C[111]);
    Full_Adder FA112 (ab[4][2],ab[3][3],ab[2][4],S[112],C[112]);
    Full_Adder FA113 (ab[7][0],ab[6][1],ab[5][2],S[113],C[113]);
    Full_Adder FA114 (S[74],S[57],ab[8][0],S[114],C[114]);
    Full_Adder FA115 (S[75],C[57],S[58],S[115],C[115]);
    Full_Adder FA116 (S[76],C[58],S[59],S[116],C[116]);
    Full_Adder FA117 (S[77],C[59],S[60],S[117],C[117]);
    Full_Adder FA118 (S[78],C[60],S[61],S[118],C[118]);
    Full_Adder FA119 (S[79],C[61],S[62],S[119],C[119]);
    Full_Adder FA120 (S[80],C[62],S[63],S[120],C[120]);
    Full_Adder FA121 (S[81],C[63],S[64],S[121],C[121]);
    Full_Adder FA122 (S[82],C[64],S[65],S[122],C[122]);
    Full_Adder FA123 (S[83],C[65],S[66],S[123],C[123]);
    Full_Adder FA124 (S[84],C[66],S[67],S[124],C[124]);
    Full_Adder FA125 (S[85],C[67],S[68],S[125],C[125]);
    Full_Adder FA126 (S[86],C[68],S[69],S[126],C[126]);
    Full_Adder FA127 (S[87],C[69],S[70],S[127],C[127]);
    Full_Adder FA128 (S[88],C[70],S[71],S[128],C[128]);
    Full_Adder FA129 (S[89],C[71],S[72],S[129],C[129]);
    Full_Adder FA130 (S[90],C[72],ab[15][9],S[130],C[130]);
    Full_Adder FA131 (ab[15][10],ab[14][11],ab[13][12],S[131],C[131]);
    Full_Adder FA132 (ab[13][13],ab[12][14],ab[11][15],S[132],C[132]);
    
    // Stage - 12
    Half_Adder HA133 (ab[1][3],ab[0][4],S[133],C[133]);
    Full_Adder FA134 (ab[4][1],ab[3][2],ab[2][3],S[134],C[134]);
    Full_Adder FA135 (S[91],ab[6][0],ab[5][1],S[135],C[135]);
    Full_Adder FA136 (C[91],S[92],S[73],S[136],C[136]);
    Full_Adder FA137 (C[92],S[93],C[73],S[137],C[137]);
    Full_Adder FA138 (C[93],S[94],C[74],S[138],C[138]);
    Full_Adder FA139 (C[94],S[95],C[75],S[139],C[139]);
    Full_Adder FA140 (C[95],S[96],C[76],S[140],C[140]);
    Full_Adder FA141 (C[96],S[97],C[77],S[141],C[141]);
    Full_Adder FA142 (C[97],S[98],C[78],S[142],C[142]);
    Full_Adder FA143 (C[98],S[99],C[79],S[143],C[143]);
    Full_Adder FA144 (C[99],S[100],C[80],S[144],C[144]);
    Full_Adder FA145 (C[100],S[101],C[81],S[145],C[145]);
    Full_Adder FA146 (C[101],S[102],C[82],S[146],C[146]);
    Full_Adder FA147 (C[102],S[103],C[83],S[147],C[147]);
    Full_Adder FA148 (C[103],S[104],C[84],S[148],C[148]);
    Full_Adder FA149 (C[104],S[105],C[85],S[149],C[149]);
    Full_Adder FA150 (C[105],S[106],C[86],S[150],C[150]);
    Full_Adder FA151 (C[106],S[107],C[87],S[151],C[151]);
    Full_Adder FA152 (C[107],S[108],C[88],S[152],C[152]);
    Full_Adder FA153 (C[108],S[109],C[89],S[153],C[153]);
    Full_Adder FA154 (C[109],S[110],C[90],S[154],C[154]);
    Full_Adder FA155 (C[110],ab[15][11],ab[14][12],S[155],C[155]);
    Full_Adder FA156 (ab[14][13],ab[13][14],ab[12][15],S[156],C[156]);
    
    // Stage -13
    Half_Adder HA157 (ab[1][2],ab[0][3],S[157],C[157]);
    Full_Adder FA158 (ab[4][0],ab[3][1],ab[2][2],S[158],C[158]);
    Full_Adder FA159 (S[134],S[111],ab[5][0],S[159],C[159]);
    Full_Adder FA160 (S[135],C[111],C[112],S[160],C[160]);
    Full_Adder FA161 (S[136],C[112],C[113],S[161],C[161]);
    Full_Adder FA162 (S[137],C[113],C[114],S[162],C[162]);
    Full_Adder FA163 (S[138],C[114],C[115],S[163],C[163]);
    Full_Adder FA164 (S[139],C[115],C[116],S[164],C[164]);
    Full_Adder FA165 (S[140],C[116],C[117],S[165],C[165]);
    Full_Adder FA166 (S[141],C[117],C[118],S[166],C[166]);
    Full_Adder FA167 (S[142],C[118],C[119],S[167],C[167]);
    Full_Adder FA168 (S[143],C[119],C[120],S[168],C[168]);
    Full_Adder FA169 (S[144],C[120],C[121],S[169],C[169]);
    Full_Adder FA170 (S[145],C[121],C[122],S[170],C[170]);
    Full_Adder FA171 (S[146],C[122],C[123],S[171],C[171]);
    Full_Adder FA172 (S[147],C[123],C[124],S[172],C[172]);
    Full_Adder FA173 (S[148],C[124],C[125],S[173],C[173]);
    Full_Adder FA174 (S[149],C[125],C[126],S[174],C[174]);
    Full_Adder FA175 (S[150],C[126],C[127],S[175],C[175]);
    Full_Adder FA176 (S[151],C[127],C[128],S[176],C[176]);
    Full_Adder FA177 (S[152],C[128],C[129],S[177],C[177]);
    Full_Adder FA178 (S[153],C[129],C[130],S[178],C[178]);
    Full_Adder FA179 (S[154],C[130],C[131],S[179],C[179]);
    Full_Adder FA180 (S[155],C[131],C[132],S[180],C[180]);
    Full_Adder FA181 (S[156],C[132],ab[15][12],S[181],C[181]);
    Full_Adder FA182 (ab[15][13],ab[14][14],ab[13][15],S[182],C[182]);
    
    // Stage - 14
    Half_Adder HA183 (ab[1][1],ab[0][2],S[183],C[183]);
    Full_Adder FA184 (S[157],ab[3][0],ab[2][1],S[184],C[184]);
    Full_Adder FA185 (C[157],S[158],S[133],S[185],C[185]);
    Full_Adder FA186 (C[158],S[159],C[133],S[186],C[186]);
    Full_Adder FA187 (C[159],S[160],C[134],S[187],C[187]);
    Full_Adder FA188 (C[160],S[161],C[135],S[188],C[188]);
    Full_Adder FA189 (C[161],S[162],C[136],S[189],C[189]);
    Full_Adder FA190 (C[162],S[163],C[137],S[190],C[190]);
    Full_Adder FA191 (C[163],S[164],C[138],S[191],C[191]);
    Full_Adder FA192 (C[164],S[165],C[139],S[192],C[192]);
    Full_Adder FA193 (C[165],S[166],C[140],S[193],C[193]);
    Full_Adder FA194 (C[166],S[167],C[141],S[194],C[194]);
    Full_Adder FA195 (C[167],S[168],C[142],S[195],C[195]);
    Full_Adder FA196 (C[168],S[169],C[143],S[196],C[196]);
    Full_Adder FA197 (C[169],S[170],C[144],S[197],C[197]);
    Full_Adder FA198 (C[170],S[171],C[145],S[198],C[198]);
    Full_Adder FA199 (C[171],S[172],C[146],S[199],C[199]);
    Full_Adder FA200 (C[172],S[173],C[147],S[200],C[200]);
    Full_Adder FA201 (C[173],S[174],C[148],S[201],C[201]);
    Full_Adder FA202 (C[174],S[175],C[149],S[202],C[202]);
    Full_Adder FA203 (C[175],S[176],C[150],S[203],C[203]);
    Full_Adder FA204 (C[176],S[177],C[151],S[204],C[204]);
    Full_Adder FA205 (C[177],S[178],C[152],S[205],C[205]);
    Full_Adder FA206 (C[178],S[179],C[153],S[206],C[206]);
    Full_Adder FA207 (C[179],S[180],C[154],S[207],C[207]);
    Full_Adder FA208 (C[180],S[181],C[155],S[208],C[208]);
    Full_Adder FA209 (C[181],S[182],C[156],S[209],C[209]);
    Full_Adder FA210 (C[182],ab[15][14],ab[14][15],S[210],C[210]);
   
    // Stage - 15
    Half_Adder HA211 (ab[1][0],ab[0][1],S[211],C[211]);
    Full_Adder FA212 (S[183],ab[2][0],C[211],S[212],C[212]);
    Full_Adder FA213 (C[183],S[184],C[212],S[213],C[213]);
    Full_Adder FA214 (C[184],S[185],C[213],S[214],C[214]);
    Full_Adder FA215 (C[185],S[186],C[214],S[215],C[215]);
    Full_Adder FA216 (C[186],S[187],C[215],S[216],C[216]);
    Full_Adder FA217 (C[187],S[188],C[216],S[217],C[217]);
    Full_Adder FA218 (C[188],S[189],C[217],S[218],C[218]);
    Full_Adder FA219 (C[189],S[190],C[218],S[219],C[219]);
    Full_Adder FA220 (C[190],S[191],C[219],S[220],C[220]);
    Full_Adder FA221 (C[191],S[192],C[220],S[221],C[221]);
    Full_Adder FA222 (C[192],S[193],C[221],S[222],C[222]);
    Full_Adder FA223 (C[193],S[194],C[222],S[223],C[223]);
    Full_Adder FA224 (C[194],S[195],C[223],S[224],C[224]);
    Full_Adder FA225 (C[195],S[196],C[224],S[225],C[225]);
    Full_Adder FA226 (C[196],S[197],C[225],S[226],C[226]);
    Full_Adder FA227 (C[197],S[198],C[226],S[227],C[227]);
    Full_Adder FA228 (C[198],S[199],C[227],S[228],C[228]);
    Full_Adder FA229 (C[199],S[200],C[228],S[229],C[229]);
    Full_Adder FA230 (C[200],S[201],C[229],S[230],C[230]);
    Full_Adder FA231 (C[201],S[202],C[230],S[231],C[231]);
    Full_Adder FA232 (C[202],S[203],C[231],S[232],C[232]);
    Full_Adder FA233 (C[203],S[204],C[232],S[233],C[233]);
    Full_Adder FA234 (C[204],S[205],C[233],S[234],C[234]);
    Full_Adder FA235 (C[205],S[206],C[234],S[235],C[235]);
    Full_Adder FA236 (C[206],S[207],C[235],S[236],C[236]);
    Full_Adder FA237 (C[207],S[208],C[236],S[237],C[237]);
    Full_Adder FA238 (C[208],S[209],C[237],S[238],C[238]);
    Full_Adder FA239 (C[209],S[210],C[238],S[239],C[239]);
    Full_Adder FA240 (C[210],ab[15][15],C[239],S[240],C[240]);
   
    assign Product = {C[240], S[240], S[239], S[238], S[237], S[236], S[235], S[234], S[233], S[232], S[231], S[230], S[229], S[228], S[227], S[226], S[225], S[224], S[223], S[222], S[221], S[220], S[219], S[218], S[217], S[216], S[215], S[214], S[213], S[212], S[211], ab[0][0]};

endmodule