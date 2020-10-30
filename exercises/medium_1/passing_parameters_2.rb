def splat_test(arr)
  yield(arr) if block_given?
end

birds = %w(raven finch hawk eagle)
splat_test(birds) { |_, __, *raptors| p raptors }
