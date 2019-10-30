def triangulate(expanded)
  expanded = expanded.map { |i| i.map(&:to_r) }
  n = expanded.size
  for j in 0..n - 1 do
    for i in j + 1..n - 1 do
      multiplier = expanded[i][j] / expanded[j][j]
      expanded[i] = expanded[i].zip(expanded[j]).map { |x| x[0] - x[1] * multiplier }
    end
  end
  expanded
end

def backward_substitution(expanded)
  n = expanded.size
  result = Array.new(n, 0r)

  result[-1] = expanded[n - 1][n] / expanded[n - 1][n - 1]
  for i in [*0..n - 2].reverse do
    sum = [*i + 1..n - 1].reduce(0r) do |s, j|
      s + expanded[i][j] * result[j]
    end
    result[i] = (expanded[i][n] - sum) / expanded[i][i]
  end
  result
end

def gauss_elimination(expanded)
  t = triangulate(expanded)
  s = backward_substitution(t)
  puts "The solution for the system is #{s}"
end

#expanded = [[5, 2, 1, 0], [3, 1, 4, 7], [1, 1, 3, 5]]
#solution = [0, -1, 2]
