function [key, time] = get_response()
  KbName('UnifyKeyNames');
  HideCursor; ListenChar(2);
  KbReleaseWait;
  fprintf('Which pitch class was played?\n');
  start = GetSecs;

  while true
    WaitSecs(0.001);
    % Check the state of the keyboard.
    [keyIsDown, seconds, keyCode] = KbCheck;

    if keyIsDown
      if keyCode(KbName('1!')) == 1 ||...
         keyCode(KbName('2@')) == 1 ||...
         keyCode(KbName('3#')) == 1 ||...
         keyCode(KbName('4$')) == 1 ||...
         keyCode(KbName('5%')) == 1 ||...
         keyCode(KbName('6^')) == 1
        key = KbName(keyCode);
        time = seconds - start;
        break;
      end

      % If the user holds down a key, KbCheck will report multiple events.
      % To condense multiple 'keyDown' events into a single event, we wait until all
      % keys have been released.
      KbReleaseWait;
    end
  end
  ShowCursor; ListenChar(0); ShowCursor('Arrow');
end

