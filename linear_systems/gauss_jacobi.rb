def gauss_jacobi(coefficients, constants, x0, tol)
  coefficients.map! { |i| i.map(&:to_r) }
  constants.map!(&:to_r)
  n = coefficients.size
  old_approximation = x0.map(&:to_f)
  new_approximation = Array.new(old_approximation.length, 0.0)

  loop do
    new_approximation = Array.new(old_approximation.length, 0.0)
    
    for i in 0...n do
      sigma = 0.0
      for j in 0...n do
        sigma += coefficients[i][j] * old_approximation[j] if i != j
      end
      new_approximation[i] = (constants[i] - sigma) / coefficients[i][i]
    end
    break if [new_approximation, old_approximation].transpose.map { |x| x.reduce(:-).abs }.all? { |x| x < tol }
    old_approximation = new_approximation
  end
  
  new_approximation
end

# coefficients = [[10, 2, 1], [1, 5, 1], [2, 3, 10]]
# constants = [7, -8, 6]
# x0 = [0.7, -1.6, 0.6]
# tol = 0.05
