function response = run_phase(config, blind)
    rand_indexes = Shuffle(1:6);
    for i = 1:6
        clc;
        play_notes(config,...
                   config.set_classes{rand_indexes(i)},... 
                   blind);
        trial_pitch_class = config.set_classes{rand_indexes(i)};
        fprintf('session classes: %s\n', strjoin(config.set_classes));
        %fprintf('trial: %s\n', trial_pitch_class);
        [response(i).key, response(i).time] = get_response();
        response(i).correct_key = config.response_keys{rand_indexes(i)};
        response(i).correct = is_response_correct(...
          response(i).correct_key,...
          response(i).key);
        if response(i).correct
          fprintf('Correct\n');
        %else
        %  fprintf('%s %s', response_keys{rand_indexes(i)}, response(i).key);
        end
        fprintf('\n');
        WaitSecs(config.inter_note_interval);
    end
    fprintf('%d correct\n', sum([response(:).correct]));
  
end

