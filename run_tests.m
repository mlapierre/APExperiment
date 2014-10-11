%% response key
class_indexes = [3, 8, 4, 11, 5, 2];
pitch_classes = {'C','D','Db','E','Eb','F','G','Gb','A','Ab','B','Bb'};
  for i = 1:6
    config.set_classes{i} = pitch_classes{class_indexes(i)}; % 'Db'    'Gb'    'E'    'B'    'Eb'    'D'
  end
config.response_keys = {'1!', '2@', '3#', '4$', '5%', '6^'};
  
note_indexes = [2 4 3 1 5 6]; % Gb B E Db Eb D
config.key_indexes = [4 5 2 1 3 6]; % B Eb Gb Db E D
trial = 1; % Gb
%correct_key = config.response_keys{config.key_indexes(note_indexes(trial))};
%correct_key = config.response_keys{note_indexes(config.key_indexes(trial))};
%correct_key = config.response_keys{config.key_indexes(trial)};
%correct_key_index = find(config.key_indexes == note_indexes(trial));
correct_key = config.response_keys{config.key_indexes == note_indexes(trial)}; % Should be 3#

response_key = '2@'; % Eb
correct = is_response_correct(correct_key, response_key);
assert(correct == false);

response_key = '3#'; % Gb
correct = is_response_correct(correct_key, response_key);
assert(correct == true);

trial = 4; % Db
correct_key = config.response_keys{config.key_indexes(note_indexes(trial))};

response_key = '3#'; % E
correct = is_response_correct(correct_key, response_key);
assert(correct == false);

response_key = '4$'; % Db
correct = is_response_correct(correct_key, response_key);
assert(correct == true);
fprintf('Done\n');
