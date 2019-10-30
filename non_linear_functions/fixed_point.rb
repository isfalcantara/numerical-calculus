def fixed_point(x0, tol, maxiter)
  x0 = x0.to_f
  iter = 0
  error = Float::INFINITY
  x = 0.0

  until error < tol || iter > maxiter do
    iter += 1
    x = yield(x0)
    error = (x - x0).abs
    x0 = x
    puts "iter = #{iter}, x = %0.14f, error = %0.14f" % [x, error]
  end
  fx = yield(x)
  puts "%0.14f %0.14f %d" % [x, fx, iter]
end
