%This is a simulation of when someone plays the door game, where there is a prize
% behind one of the doors, but something silly behind the other two doors.
%  After the first guess, the host of the game reveals one of the other doors,
% which does not have a prize behind it.  Then, he asks if the player wants 
% to change his guess. 

z = 900;
firstpercent = zeros(z,1);
secondpercent = zeros(z,1);
for k = 1:z
m = 100;
rand ("seed", rand);
prize= 1+round(2*rand(m,1));
firstguess= 1+round(2*rand(m,1));
p1 = [(prize ==1), (prize==2), (prize == 3)];
g1= [(firstguess ==1),(firstguess ==2),(firstguess ==3)];
%doors = [p1 g1]
firstguessright = (prize == firstguess);
		
revealed = prize + 1 * (round(rand)* 2 -1);
revealed = ifelse(revealed==4, 1, revealed);
revealed = ifelse(revealed==0, 3, revealed);

r1= [revealed ==1 revealed ==2 revealed ==3] & [firstguessright firstguessright firstguessright];
r2 = (!p1 & !g1) & ! [firstguessright firstguessright firstguessright];
r3 = r1 | r2;
g2 = !r3  & !g1;

secondright  = g2 & p1;
secondpercent(k) = (sum(sum(secondright)'))/m
end
hist(secondpercent)


