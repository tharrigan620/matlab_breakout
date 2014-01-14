function count = CountLetters(s)
  count = 0;
  n     = length(s);

  for k = 1 : 1 : n
    if (s(k) >= 'a' && s(k) <= 'z') || ...
       (s(k) >= 'A' && s(k) <= 'Z')
         count = count + 1;
    end
  end
 
end
