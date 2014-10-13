config = initialise_session();

for block = 1:config.num_blocks
  fprintf('Block %d of %d\n', block, config.num_blocks);
  fprintf('Training phase\n');
  pause;
  res = run_phase(config, false);
  training_results(:, block) = res;

  fprintf('Test phase\n');
  pause;
  test_results(:, block) = run_phase(config, true);
end

finalise_session(config, training_results, test_results);
