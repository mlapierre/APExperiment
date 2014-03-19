function play_notes(config, pitch_class, blind)
    wavedata = cell(3,1);
    j = Shuffle(1:3);
    for i = 1:3
        [y, ~] = wavread([config.samples_dir filesep 'Piano.ff.' pitch_class num2str(j(i)+2) '.wav']);
        wavedata{j(i)} = y';
        if blind
          fprintf('Playing note %d of 3...\n', i);
        else
          fprintf('Playing %s%d...\n', pitch_class, j(i)+2);
        end
        play_note(wavedata{j(i)}, config.pahandle, config.note_length);
        WaitSecs(config.inter_octave_interval);
    end
end

function play_note(wavedata, pahandle, note_length)
PsychPortAudio('FillBuffer', pahandle, wavedata);
PsychPortAudio('Start', pahandle, 0, 0, 1);
WaitSecs(note_length);
PsychPortAudio('Stop', pahandle);
end