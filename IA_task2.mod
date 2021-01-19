param totBlocks;
set Block:=1.. totBlocks;

param coverage{Block,Block} binary;
param Revenue{Block} >=0;
param fixed_cost >=0;

var tower{Block} binary;
var y{Block} binary;


maximize Profit:sum{i in Block} (Revenue[i]*y[i]-fixed_cost*tower[i]);
subject to Covering{i in Block}:sum{j in Block}coverage[i,j]*tower[j]>=y[i];

#additional constraint - coverage guaranteed to 92% of the blocks
subject to Guaranteed_service:sum{i in Block} y[i]>=23;