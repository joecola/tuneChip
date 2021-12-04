local function tunechip()

  local ss = renoise.song().selected_sample_index
  local si = renoise.song().selected_instrument_index
  local sr = renoise.song().instruments[si].samples[ss].sample_buffer.sample_rate
  local ls = renoise.song().instruments[si].samples[ss].loop_start
  local le = renoise.song().instruments[si].samples[ss].loop_end
  local ll = le-ls
  local tl = sr / 130.815
  local tv = (12/math.log(2)) * math.log((1/ll) / (1/tl))
  local ntp = tv 
  
  local nft = (ntp-math.floor(ntp)) * 127 * (math.abs(ntp)/ntp)
  local ntp = math.floor(ntp) 
  
  renoise.song().instruments[si].samples[ss].transpose = ntp * -1
  renoise.song().instruments[si].samples[ss].fine_tune = nft 

end

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:tuneChip",
  invoke = function()
    tunechip()
  end
}

