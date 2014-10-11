function response = run_phase(config, blind)
    note_indexes = Shuffle(1:6);
    config.log.debug(sprintf('session classes: %s', strjoin(config.set_classes(config.key_indexes))));
    for i = 1:6
        clc;
        trial_pitch_class = config.set_classes{note_indexes(i)};
        play_notes(config, trial_pitch_class, blind);
        fprintf('session classes: %s\n', strjoin(config.set_classes(config.key_indexes)));
        config.log.debug(sprintf('trial: %s', trial_pitch_class));
        [response(i).key, response(i).time] = get_response();
        
        config.log.debug(['Response key: ' response(i).key]);
        %config.log.debug(['Response time: ' response(i).time]);
        
        response(i).correct_key = config.response_keys{config.key_indexes == note_indexes(i)};
        response(i).correct = is_response_correct(...
          response(i).correct_key,...
          response(i).key);
        if response(i).correct
          %fprintf('Correct\n');
          config.log.debug('Response was correct');
        else
          %fprintf('%s %s', response(i).correct_key, response(i).key);
          config.log.debug('Response was incorrect');
          config.log.debug(['Correct response: ' response(i).correct_key]);
        end
        fprintf('\n');
        WaitSecs(config.inter_note_interval);
    end
    fprintf('%d correct\n', sum([response(:).correct]));
end

