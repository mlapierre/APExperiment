function [ correct ] = is_response_correct( pitch_index, response )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
  correct = false;
  if pitch_index == response
    correct = true;
  end
end

