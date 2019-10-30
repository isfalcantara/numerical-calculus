def secant(x0, x1, tol, maxiter)
  x0 = x0.to_f
  x1 = x1.to_f

  iter = 0
  error = Float::INFINITY
  x = 0.0
  
  until error <= tol || iter >= maxiter
    iter += 1
    a = x0 * yield(x1) - x1 * yield(x0)
    b = yield(x1) - yield(x0)
    x = a / b
    error = (x - x1).abs
    x0 = x1
    x1 = x
    puts "iter = #{iter}, x = %0.14f, error = %0.14f" % [x, error]
  end
  fx = yield(x)
  puts "%0.14f %0.14f %d" % [x, fx, iter]
end
