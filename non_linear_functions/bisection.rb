def bisection(a, b, tol, maxiter)
  iter = 0
  a = a.to_f
  b = b.to_f
  x = (a + b) / 2.0
  error = Float::INFINITY

  until error <= tol || iter > maxiter do
    if yield(a) * yield(x) > 0
      a = x
    else
      b = x
    end
    x0 = x
    x = (a + b) / 2.0
    error = (x - x0).abs
    iter += 1
    puts "iter = #{iter}, x = %0.4f, a = %0.4f, b = %0.4f, error = %0.4f" % [x, a, b, error]
  end
  fx = yield(x)
  puts "%0.14f %0.14f %d" % [x, fx, iter]
end
