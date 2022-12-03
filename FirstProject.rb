# i miss my gym partner

#live_loop :flibble do
#  sample :ambi_choir, rate: 0.5
#  sample :bd_haus, rate: 0.25
#  sleep 5
#end


##| in_thread do
##|   loop do
##|     play 60, amp: 0.2, pan: -1
##|     sleep 0.5
##|     play 60.2, amp: 0.4, pan: -0.5
##|     sleep 0.5
##|     play 60.4, amp: 0.6, pan: 0
##|     sleep 0.5
##|     play 60.6, amp: 0.8, pan: 0.5
##|     sleep 0.5
##|     play 60.8, amp: 1, pan: 1
##|     sleep 0.5
##|     play 61, amp: 2, pan: 0
##|     sleep 0.5
##|   end
##| end

##| in_thread do
##|   loop do
##|     sample :ambi_dark_woosh, rate: 1
##|     sample :ambi_haunted_hum, rate: 2
##|     sample :ambi_choir, rate: 1, release: 3
##|     sleep 1
##|   end
##| end

##| define :my_sound do
##|   use_synth :tb303
##|   sample :drum_bass_hard, rate: rrand(0.5, 2)
##|   play choose(chord(:e3, :minor)), release: 0.2, cutoff: rrand(60, 130)
##|   sleep 0.25
##| end

##| in_thread(name: :looper) do
##|   loop do
##|     my_sound
##|   end
##| end





##| live_loop :notesfast do
##|   play 60, pan: rrand(-1,1), amp: rrand(0,1), release: 0.5
##|   sleep 1
##| end

##| live_loop :notesfaster do
##|   play 40, pan: rrand(-1,1), amp: 0.5, release: 1.5
##|   sample :bass_hard_c
##|   sleep 0.5
##| end

##| live_loop :piano do
##|   use_synth :chiplead
##|   sample :ambi_lunar_land
##|   sleep 0.5
##| end



##| live_loop :cs_main2 do
##|   sample "C:/Users/icepi/Desktop/SonicPi/Samples/oh_yeah.wav"
##|   sleep 1
##|   sync "/live_loop/cs_main"
##| end



##| live_loop :drums, sync: :cs_main do
##|   use_synth :blade
##|   play chord(:c3, :m6), amp: 0.5, decay: 0.5
##|   play :c1, release: 1, cutoff: rrand(70, 130), attack: 1, amp: 0.5
##|   play :f1, release: 1, cutoff: rrand(70, 130), attack: 1, amp: 0.5
##|   sleep 1
##| end

##| live_loop :main do
##|   use_synth :dark_ambience
##|   sample :ambi_soft_buzz, release: 1, amp: 3
##|   sample :ambi_choir, release: 1, amp: 3
##|   sleep 2
##|   sync "/live_loop/cs_main"
##| end


##| live_loop :multi_beat, sync: :cs_main do
##|   sample :elec_hi_snare if one_in(3)
##|   sample :bass_hit_c , amp: 2 if one_in(2)
##|   sample :drum_cymbal_pedal if one_in(4)
##|   sample :bd_haus if one_in(4)
##|   sleep 0.125
##| end




##| #use_bpm 180

##| with_fx :reverb, mix: 0.2, room: 1 do
##|   live_loop :grain1 do
##|     s = rrand(0, 0.7)
##|     t = rrand(0.03, 0.3)
##|     e = s + t
##|     a = rrand(0.5, 1.0)
##|     sample :guit_e_fifths, rate: -1.5, start: s, finish: e, attack: t/6.0, sustain: t/2.0, pan: rrand(-0.5, 0.5)
##|     sleep t
##|   end

##|   live_loop :grain2 do
##|     s = rrand(0, 0.7)
##|     t = rrand(0.03, 0.2)
##|     e = s + t
##|     a = rrand(0.5, 1.0)
##|     sample :guit_em9, rate: 1.5, start: s, finish: e, attack: t/6.0, sustain: t/2.0, pan: rrand(-0.5, 0.5)
##|     sleep t
##|   end
##| end



live_loop :cmout do
  sample "C:/Users/icepi/Desktop/SonicPi/Samples/cmout.wav", attack: rrand(0,1), release: rrand(0,1), pitch: 2
  sample "C:/Users/icepi/Desktop/SonicPi/Samples/cmout.wav", attack: rrand(0,1), release: rrand(0,1), pitch: 1
  sleep 1
end


live_loop :base, sync: :cmout do
  use_synth :mod_fm
  sample :drum_bass_soft
  sleep 0.5
end

live_loop :lesgo, sync: :cmout do
  use_synth :mod_fm
  sample "C:/Users/icepi/Desktop/SonicPi/Samples/lets_go.wav", amp: 0.5
  sleep 1
end


live_loop :double_drum, sync: :cmout do
  sample :drum_snare_soft
  3.times do
    sample :drum_snare_soft, pan: rrand(-1,1)
    sleep 0.5
  end
  sleep 1
end


