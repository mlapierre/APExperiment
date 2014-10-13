function config = initialise_session()
  clearvars;
  AssertOpenGL;
  
  config.timestamp = datestr(now);
  config.log = log4m.getLogger(['logs' filesep datestr(now, 30) '.log']);
  config.log.setCommandWindowLevel(log4m.INFO);
  config.log.setLogLevel(log4m.DEBUG);
  config.log.info(['Started at: ' config.timestamp]);
  
  configure();
  config.log.info(['Name: ' participant]);

  load('sample_list.mat');
  config.samples_dir = 'samples/Steinway & Sons model B Grand Piano';
  [y, freq] = wavread([config.samples_dir filesep 'Piano.mf.C3.wav']);
  wavedata = y';
  nrchannels = size(wavedata,1); % Number of rows == number of channels.

  InitializePsychSound;
  config.pahandle = PsychPortAudio('Open', [], [], 0, freq, nrchannels);

  pitch_classes = {'C','D','Db','E','Eb','F','G','Gb','A','Ab','B','Bb'};
  for i = 1:6
    config.set_classes{i} = pitch_classes{class_indexes(i)};
  end
  config.response_keys = {'1!', '2@', '3#', '4$', '5%', '6^'};
  config.key_indexes = Shuffle(1:6);

  config.note_length = 4;
  config.inter_note_interval = 1.5;
  config.inter_octave_interval = 0.5;
  config.num_blocks = 3;
  config.participant = participant;
  
end