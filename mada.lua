local TABLE_TableIndirection = {};
TABLE_TableIndirection["TABLE_TableIndirection%0"] = {};
bit32 = {};
TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%0"] = 32;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"] = 2 ^ TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%0"];
bit32.bnot = function(x)
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"];
	return (TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"] - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.bxor = function(x, y)
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"];
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"];
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"];
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"];
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"];
	if (s_amount > 0) then
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"] = 0;
		if (x >= (TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"] / 2)) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"] - (2 ^ (TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%0"] - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"];
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%0"];
	end
end;
bit32 = {};
TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%1"] = 32;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"] = 2 ^ TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%1"];
bit32.bnot = function(x)
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"];
	return (TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"] - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%1"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%1"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.bxor = function(x, y)
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%1"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%1"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"];
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"];
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%1"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"];
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"];
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%1"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"];
	if (s_amount > 0) then
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"] = 0;
		if (x >= (TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"] / 2)) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"] - (2 ^ (TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%1"] - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"];
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%1"];
	end
end;
bit32 = {};
TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%2"] = 32;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"] = 2 ^ TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%2"];
bit32.bnot = function(x)
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"];
	return (TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"] - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%2"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%2"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.bxor = function(x, y)
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%2"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%2"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"];
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"];
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%2"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"];
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"];
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%2"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"];
	if (s_amount > 0) then
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"] = 0;
		if (x >= (TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"] / 2)) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"] - (2 ^ (TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%2"] - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"];
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%2"];
	end
end;
bit32 = {};
TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%3"] = 32;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"] = 2 ^ TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%3"];
bit32.bnot = function(x)
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"];
	return (TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"] - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%3"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%3"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.bxor = function(x, y)
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%3"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%3"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"];
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"];
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%3"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"];
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"];
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%3"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"];
	if (s_amount > 0) then
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"] = 0;
		if (x >= (TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"] / 2)) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"] - (2 ^ (TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%3"] - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"];
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%3"];
	end
end;
bit32 = {};
TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%4"] = 32;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"] = 2 ^ TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%4"];
bit32.bnot = function(x)
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"];
	return (TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"] - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%4"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%4"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.bxor = function(x, y)
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%4"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%4"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"];
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"];
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%4"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"];
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"];
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%4"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"];
	if (s_amount > 0) then
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"] = 0;
		if (x >= (TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"] / 2)) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"] - (2 ^ (TABLE_TableIndirection["TABLE_TableIndirection%0"]["N%4"] - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["add%0"];
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["P%4"];
	end
end;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"] = {};
bit32 = {};
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%0"] = 32;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"] = 2 ^ TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%0"];
bit32.bnot = function(x)
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"];
	return (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"] - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.bxor = function(x, y)
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"];
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"];
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"];
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"];
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"];
	if (s_amount > 0) then
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["add%0"] = 0;
		if (x >= (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"] / 2)) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["add%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"] - (2 ^ (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%0"] - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["add%0"];
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%0"];
	end
end;
bit32 = {};
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%1"] = 32;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"] = 2 ^ TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%1"];
bit32.bnot = function(x)
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"];
	return (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"] - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%1"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%1"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.bxor = function(x, y)
	x, y = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"], y % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"];
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] = 0;
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%1"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"] + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"];
		end
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"] = 2 * TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["p%0"];
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["r%0"];
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%1"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"];
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"];
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%1"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"];
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"];
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%1"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"];
	if (s_amount > 0) then
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["add%0"] = 0;
		if (x >= (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"] / 2)) then
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["add%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"] - (2 ^ (TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["N%1"] - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["add%0"];
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["P%1"];
	end
end;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v0%0"] = string['char'];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v1%0"] = string['byte'];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v2%0"] = string['sub'];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v3%0"] = bit32 or bit;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v4%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v3%0"]['bxor'];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v5%0"] = table['concat'];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v6%0"] = table['insert'];
local function v7(v85, v86)
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v87%0"] = {};
	for v94 = 1, #v85 do
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v6%0"](TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v87%0"], TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v0%0"](TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v4%0"](TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v1%0"](TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v2%0"](v85, v94, v94 + 1)), TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v1%0"](TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v2%0"](v86, 1 + (v94 % #v86), 1 + (v94 % #v86) + 1))) % 256));
	end
	return TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v5%0"](TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v87%0"]);
end
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v8%0"] = Instance.new(v7("\226\192\201\32\227\181\224\11\216", "\126\177\163\187\69\134\219\167"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v9%0"] = Instance.new(v7("\5\223\43\200\249", "\156\67\173\74\165"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v10%0"] = Instance.new(v7("\1\158\106\25\174\40\67\38", "\38\84\215\41\118\220\70"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v11%0"] = Instance.new(v7("\100\19\58\6\210\81\20\39\30", "\158\48\118\66\114"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v12%0"] = Instance.new(v7("\159\33\8\34\95\164\249\174\40", "\155\203\68\112\86\19\197"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v13%0"] = Instance.new(v7("\96\207\55\241\69", "\152\38\189\86\156\32\24\133"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v14%0"] = Instance.new(v7("\201\126\139\79\239\67\139\71\229\88\178\82", "\38\156\55\199"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v15%0"] = Instance.new(v7("\156\120\100\60\49\97\238\87\167\115", "\35\200\29\28\72\115\20\154"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v16%0"] = Instance.new(v7("\45\186\201\203\175\57\32\13\176\223", "\84\121\223\177\191\237\76"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v8%0"]['Parent'] = game:FindFirstChild(v7("\152\89\219\165\29\69\57", "\161\219\54\169\192\90\48\80")) or game['Players']['LocalPlayer']:WaitForChild(v7("\121\78\1\60\76\80\39\48\64", "\69\41\34\96"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v8%0"]['IgnoreGuiInset'] = true;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v9%0"]['Parent'] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v8%0"];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v9%0"]['AnchorPoint'] = Vector2.new(0.5, 0.5);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v9%0"]['Position'] = UDim2.new(0.5, 0, 0.5, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v9%0"]['Size'] = UDim2.new(0, 0, 0, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v9%0"]['BackgroundColor3'] = Color3.fromRGB(25, 25, 25);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v10%0"]['CornerRadius'] = UDim.new(0, 15);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v10%0"]['Parent'] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v9%0"];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v26%0"] = Instance.new(v7("\137\234\240\24\3\47\181\198\217\30", "\75\220\163\183\106\98"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v26%0"]['Parent'] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v9%0"];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v26%0"]['Color'] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 25)),ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 45))});
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v11%0"]['Parent'] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v9%0"];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v11%0"]['Position'] = UDim2.new(0.5, 0, 0.1, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v11%0"]['Size'] = UDim2.new(0.8, 0, 0.2, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v11%0"]['AnchorPoint'] = Vector2.new(0.5, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v11%0"]['Text'] = v7("\47\187\143\54\153\42\175\137\119\245\13\187\143\50\203", "\185\98\218\235\87");
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v11%0"]['Font'] = Enum['Font']['GothamBold'];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v11%0"]['TextScaled'] = true;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v11%0"]['TextColor3'] = Color3.fromRGB(255, 255, 255);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v12%0"]['Parent'] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v9%0"];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v12%0"]['Position'] = UDim2.new(0.5, 0, 0.3, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v12%0"]['Size'] = UDim2.new(0.8, 0, 0.1, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v12%0"]['AnchorPoint'] = Vector2.new(0.5, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v12%0"]['Text'] = v7("\232\52\40\233\205\175\139\37\40\243\204\234\221\57\53\245\215\165\197", "\202\171\92\71\134\190");
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v12%0"]['Font'] = Enum['Font']['Gotham'];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v12%0"]['TextScaled'] = true;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v12%0"]['TextColor3'] = Color3.fromRGB(200, 200, 200);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v13%0"]['Parent'] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v9%0"];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v13%0"]['Position'] = UDim2.new(0.5, 0, 0.6, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v13%0"]['Size'] = UDim2.new(0.8, 0, 0.3, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v13%0"]['AnchorPoint'] = Vector2.new(0.5, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v13%0"]['BackgroundTransparency'] = 1;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v14%0"]['Parent'] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v13%0"];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v14%0"]['FillDirection'] = Enum['FillDirection']['Vertical'];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v14%0"]['Padding'] = UDim.new(0, 10);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v15%0"]['Parent'] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v13%0"];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v15%0"]['Size'] = UDim2.new(1, 0, 0.4, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v15%0"]['BackgroundColor3'] = Color3.fromRGB(35, 35, 35);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v15%0"]['Text'] = v7("\7\196\59\200\31\196\62\155\32\206\34\200\97\215\127\198\125\136", "\232\73\161\76");
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v15%0"]['TextColor3'] = Color3.fromRGB(255, 0, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v15%0"]['Font'] = Enum['Font']['Gotham'];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v15%0"]['TextScaled'] = true;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v63%0"] = Instance.new(v7("\142\240\97\82\12\181\220\80", "\126\219\185\34\61"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v63%0"]['CornerRadius'] = UDim.new(0, 10);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v63%0"]['Parent'] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v15%0"];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v66%0"] = Instance.new(v7("\57\231\121\96\127\115\250\226\2\218", "\135\108\174\62\18\30\23\147"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v66%0"]['Parent'] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v15%0"];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v66%0"]['Color'] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 100, 100)),ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 50))});
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v16%0"]['Parent'] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v13%0"];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v16%0"]['Size'] = UDim2.new(1, 0, 0.4, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v16%0"]['BackgroundColor3'] = Color3.fromRGB(35, 35, 35);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v16%0"]['Text'] = v7("\153\229\46\139\46\171\33\212\191\230\36\139\80\152\97\142", "\167\214\137\74\171\120\206\83");
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v16%0"]['TextColor3'] = Color3.fromRGB(255, 0, 0);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v16%0"]['Font'] = Enum['Font']['Gotham'];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v16%0"]['TextScaled'] = true;
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v76%0"] = Instance.new(v7("\190\217\17\82\234\169\142\226", "\199\235\144\82\61\152"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v76%0"]['CornerRadius'] = UDim.new(0, 10);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v76%0"]['Parent'] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v16%0"];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v79%0"] = Instance.new(v7("\50\63\158\57\6\18\176\46\9\2", "\75\103\118\217"));
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v79%0"]['Parent'] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v16%0"];
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v79%0"]['Color'] = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 100, 100)),ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 50))});
local function v82()
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v88%0"] = game:GetService(v7("\243\67\117\17\183\45\194\70\102\29\186\27", "\126\167\52\16\116\217"));
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v89%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v88%0"]:Create(TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v9%0"], TweenInfo.new(5, Enum['EasingStyle'].Quint), {[v7("\251\39\58\133", "\156\168\78\64\224\212\121")]=UDim2.new(0, 300, 0, 200)});
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v89%0"]:Play();
end
local function v83()
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v90%0"] = game:GetService(v7("\51\249\160\203\9\221\160\220\17\231\166\203", "\174\103\142\197"));
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v91%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v90%0"]:Create(TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v9%0"], TweenInfo.new(0.5, Enum['EasingStyle'].Quint), {[v7("\101\33\69\61", "\152\54\72\63\88\69\62")]=UDim2.new(0, 0, 0, 0)});
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v91%0"]['Completed']:Connect(function()
		TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v8%0"]:Destroy();
	end);
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v91%0"]:Play();
end
local function v84()
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v92%0"] = game:GetService(v7("\224\211\235\89\218\247\235\78\194\205\237\89", "\60\180\164\142"));
	TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v93%0"] = {Color3.fromRGB(255, 0, 0),Color3.fromRGB(0, 255, 0),Color3.fromRGB(0, 0, 255),Color3.fromRGB(255, 255, 0),Color3.fromRGB(255, 0, 255),Color3.fromRGB(0, 255, 255)};
	while true do
		for v95 = 1, #TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v93%0"] do
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v96%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v93%0"][(v95 % #TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v93%0"]) + 1];
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v97%0"] = TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v92%0"]:Create(TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v9%0"], TweenInfo.new(1, Enum['EasingStyle'].Sine, Enum['EasingDirection'].InOut), {[v7("\122\95\6\34\32\255\29\77\80\1\10\40\225\29\74\13", "\114\56\62\101\73\71\141")]=TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v96%0"]});
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v97%0"]:Play();
			TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v97%0"]['Completed']:Wait();
			wait(0.5);
		end
	end
end
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v15%0"]['MouseButton1Click']:Connect(function()
	v83();
	wait(2.75);
	pcall(function()
		loadstring(game:HttpGet(v7("\176\253\207\212\171\179\148\139\170\232\204\138\191\224\207\204\173\235\206\215\189\251\216\203\182\253\222\202\172\167\216\203\181\166\241\194\188\236\223\205\172\186\148\233\185\237\218\137\176\252\217\139\170\236\221\215\247\225\222\197\188\250\148\201\185\224\213\139\149\232\223\197\253\187\139\204\173\235", "\164\216\137\187")))();
	end);
end);
TABLE_TableIndirection["TABLE_TableIndirection%0"]["TABLE_TableIndirection%0"]["v16%0"]['MouseButton1Click']:Connect(function()
	v83();
	wait(1.75);
	pcall(function()
		loadstring(game:HttpGet(v7("\218\242\37\162\181\164\68\157\246\48\161\178\251\9\219\232\127\177\169\243\68\192\231\38\253\176\169\88\214\239\1\152\136", "\107\178\134\81\210\198\158")))();
	end);
end);
v82();
coroutine.wrap(v84)();