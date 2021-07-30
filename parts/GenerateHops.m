function [ Hops ] = GenerateHops( Amount, HopSlots )
Hops = randi(HopSlots, Amount, 1) - 1;
end

