function finalise_session(config, training_results, test_results)
  fn = ['data' filesep config.participant '.mat'];
  if exist(fn, 'file') == 2
    load(fn);
    num_sessions = size(sessions.training_results, 3) + 1;
  else
    num_sessions = 1;
  end
  
  sessions.training_results(:, :, num_sessions) = training_results;
  sessions.test_results(:, :, num_sessions) = test_results;
  sessions.config(num_sessions) = config;
  
  fprintf('%d sessions completed', num_sessions);
  save(fn, 'sessions');

  PsychPortAudio('Close', config.pahandle);
end