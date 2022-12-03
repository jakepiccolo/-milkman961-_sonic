# i miss my gym partner




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
##| end

##|   live_loop :grain2 do
##|     s = rrand(0, 0.7)
##|     t = rrand(0.03, 0.2)
##|     e = s + t
##|     a = rrand(0.5, 1.0)
##|     sample :guit_em9, rate: 1.5, start: s, finish: e, attack: t/6.0, sustain: t/2.0, pan: rrand(-0.5, 0.5)
##|     sleep t
##|   end
##| end

live_loop :met1 do
  sleep 1
end


##| live_loop :cmout, sync: :met1 do
##|   stop
##|   sample "C:/Users/icepi/Desktop/SonicPi/Samples/cmout.wav", attack: 0.5, release: 2, pitch: 2, pan: rrand(-1,1)
##|   #sample "C:/Users/icepi/Desktop/SonicPi/Samples/cmout.wav", attack: 0.5, release: 2, pitch: 1.5, pan: rrand(-1,1)
##|   sleep 1
##| end

live_loop :lesgo, sync: :met1 do
  stop
  use_synth :mod_fm
  sample "C:/Users/icepi/Desktop/SonicPi/Samples/lets_go.wav", amp: 0.5
  sleep 1
end


##| with_fx :reverb, mix: 0.6 do
##|   with_fx :flanger do
##|     live_loop :verse1, sync: :met1 do
##|       stop
##|       a = 1
##|       c = 80
##|       v1_1 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/v1.1.wav"
##|       v1_2 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/v1.2.wav"
##|       v1_3 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/v1.3.wav"
##|       v1_4 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/v1.4.wav"
##|       v1_5 = "/Users/sarah/Desktop/dj_dave/samples/Dreams/v1.5.wav"
##|       sleep 1
##|       sample v1_1, start: 0.01, amp: a, cutoff: c
##|       sleep 8
##|       sample v1_2, amp: a, cutoff: c, start: 0.01
##|       sleep 8
##|       sample v1_3, amp: a, cutoff: c, start: 0.01
##|       sleep 16
##|       sample v1_4, amp: a, cutoff: c, start: 0.01
##|       sleep 14.6
##|       sample v1_5, amp: a, cutoff: c, start: 0.01
##|       sleep 10.4
##|       10.times do
##|         sample v1_5, start: 0.685, amp: a, cutoff: c
##|         sleep 4
##|       end
##|       sleep 100000
##|     end
##|   end
##| end




live_loop :base, sync: :met1 do
  use_synth :mod_fm
  sample :drum_bass_soft
  sleep 0.5
end



with_fx :reverb, mix: 0.6 do
  live_loop :eminor, sync: :met1 do
    #stop
    r = 1
    a= 0.3
    p1 = -1
    p2 = 1
    use_synth :piano
    32.times do
      sleep 0.25
    end
    32.times do
      play [:E3, :G3, :B3], release: r, amp: a, pan: rrand(p1,p2)
      sleep 0.25
    end
    32.times do
      play [:A3, :B3, :C3], release: r, amp: a, pan: rrand(p1,p2)
      sleep 0.25
    end
    32.times do
      play choose(chord(:e3, :minor)), release: r, amp: a, pan: rrand(p1,p2)
      sleep 0.25
    end
  end
end

with_fx :reverb, mix: 0.6 do
  live_loop :arp1, sync: :met1 do
    #stop
    a = 0.6
    r = line(0.25, 0.5, steps: 128).mirror.look
    p = line(-0.25, 0.25, steps: 128).mirror.look
    use_synth :saw
    notes = (scale :e3, :minor_pentatonic).shuffle
    tick
    play notes.look, amp: a, cutoff: 70, release: r, pan: p
    sleep 0.25
  end
end




with_fx :reverb, mix: 0.4 do
  live_loop :synth_bass_02, sync: :met1 do
    #stop
    a = 0.1
    r = 0.5
    c1 = 50
    c2 = 60
    use_synth :saw
    32.times do
      play :a1, cutoff: c1, amp: a, release: r
      play :a2, cutoff: c2, amp: a, release: r
      sleep 0.25
    end
    32.times do
      play :f1, cutoff: c1, amp: a, release: r
      play :f2, cutoff: c2, amp: a, release: r
      sleep 0.25
    end
    32.times do
      play :d1, cutoff: c1, amp: a, release: r
      play :d2, cutoff: c2, amp: a, release: r
      sleep 0.25
    end
    32.times do
      play :f1, cutoff: c1, amp: a, release: r
      play :f2, cutoff: c2, amp: a, release: r
      sleep 0.25
    end
  end
end

with_fx :reverb, mix: 0.4 do
  live_loop :synth_bass_01, sync: :met1 do
    #stop
    a = 0.7
    c = 50
    r = 0.4
    use_synth :saw
    32.times do
      play :a1, cutoff: c, amp: a, release: r
      play :a2, cutoff: c, amp: a, release: r
      sleep 0.25
    end
    32.times do
      play :g1, cutoff: c, amp: a, release: r
      play :g2, cutoff: c, amp: a, release: r
      sleep 0.25
    end
    64.times do
      play :f1, cutoff: c, amp: a, release: r
      play :f2, cutoff: c, amp: a, release: r
      sleep 0.25
    end
  end
end

live_loop :bongo, sync: :met1 do
  stop
  sample :drum_snare_soft
  12.times do
    sample :drum_snare_soft, pan: rrand(-1,1)
    sleep 0.25
  end
  sleep 1
end



live_loop :flibble, sync: :met1 do
  stop
  use_synth :dull_bell
  sample :ambi_choir, rate: 0.5,pan: rrand(-0.5, 0.5)
  sample :bd_haus, rate: 0.5,pan: rrand(-0.5, 0.5)
  sleep 2
end



