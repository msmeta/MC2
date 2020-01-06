% star discrepancy
clear
n=1000;
i=10000;
d=3;
S=rand(n,d);
B=rand(i,d);

localdiscrepancy(S,B(1,:))
approxstardisc(S,B)
%%
function D = approxstardisc(S,B)
% handle multiple rows in B
[i,d]=size(B);
% create a vector of local discrepancies
discrepancies=[];
for j=1:i
    discrepancies=[discrepancies;localdiscrepancy(S,B(j,:))];
end
% find the maximum abs value among local discrepancies
D=max(abs(discrepancies));
end
%%
function l = localdiscrepancy(S,B)
% S is n x d, B is 1 x d -dimensional
% for B being the corners of a d-dimensional cube
% (only considering the sets B as cubes)
[n,d]=size(S);
% find the elements of S inside the cube B
ind=find(sum(S<B,2)==d);
% the number of elements of S inside B
r=length(ind);

% find the volume of the cube B
vol=prod(B);

% the local discrepancy by definition
l = r/n -vol;
end