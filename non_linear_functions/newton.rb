def newton(x0, tol, maxiter, f, df)
  x0 = x0.to_f
  iter = 0
  error = Float::INFINITY
  x = 0.0
  until error <= tol || iter >= maxiter
    iter += 1
    dx = -f.(x0) / df.(x0)
    x = x0 + dx
    error = (x - x0).abs
    x0 = x
    puts "iter = #{iter}, x = %0.14f, error = %0.14f" % [x, error]
  end
  fx = f.(x)
  puts "%0.14f %0.14f %d" % [x, fx, iter]
end
