#!/usr/bin/env ruby

VC = [
  "OH!  ",
  "MY!  ",
  "WOW!  ",
  "I CAN'T BELIEVE IT!  ",
  "OH, MY GOODNESS ",
  "GOODNESS, GRACIOUS, ME: ",
  "IT'S A FACT!  ",
  "ALAS, ",
  "OH, ",
  "ASTOUNDING: "
]

NM = [
  "THIS ",
  "THAT ",
  "HER ",
  "EACH ",
  "MY ",
  "THE ",
  "YOUR ",
  "HIS ",
  "YOUR ",
  "THE "
]

N = [
  "BODY ",
  "GIRL ",
  "***** ",
  "**** ",
  "**** ",
  "*** ",
  "**** ",
  "*** ",
  "***** ",
  "LIP "
]

VI = [
  "GROWLED ",
  "TINGLED FANTASTICALY ",
  "**** ",
  "VIBRATED ",
  "BOUNCED ",
  "TWIRLS ",
  "***** ",
  "LAUGHED ",
  "EXPLODED ",
  "***** "
]

VB = [
  "IS ",
  "WAS ",
  "APPEARS ",
  "SEEMED ",
  "SOUNDS ",
  "LOOKED ",
  "APPEARED ",
  "REMAINED ",
  "STAYS ",
  "SEEMS "
]

VT = [
  "MOUNTED ",
  "SMELLS ",
  "****** ",
  "DEVOURED ",
  "DEMANDS ",
  "SHOT ",
  "WASHED ",
  "****** ",
  "PETTED ",
  "****** "
]

VG = [
  "GIVES ",
  "GIVES ",
  "SENT ",
  "BROUGHT ",
  "OFFERED ",
  "HANDS ",
  "GLUED ",
  "THREW ",
  "GAVE ",
  "SENDS "
]

AV = [
  "ALMOST ",
  "DESPERATELY ",
  "LOVINGLY ",
  "NICELY ",
  "WITH CONSUMATE GRACE AND SKILL ",
  "CHARMINGLY ",
  "SAVAGELY ",
  "WISTFULLLY ", # sic
  "DELICATELY ",
  "SERENELY "
]

AJ = [
  "SWEET ",
  "GORGEOUS ",
  "HAIRY ",
  "LOVELY ",
  "DAINTY ",
  "AWE-INSPIRING ",
  "SWEET ",
  "MAGNIFICENT ",
  "IMMACULATE ",
  "TASTEY " # sic
]

P = [
  "!",
  "?",
  "!",
  ".",
  ".",
  ".",
  ".",
  "!",
  "?"
] # sic.  looks like they needed to fill 9 ...

def fnr(x); rand(10); end

# need to simulate "get char without pressing enter"
def getqw
  # https://stackoverflow.com/a/174967/2063546
  begin
    system("stty raw -echo")
    str = STDIN.getc
  ensure
    system("stty -raw echo")
  end
  str.chr
end

loop do
  # init some variables referred to in the loop, particularly the array vars
  vc = av = vp = p = ""
  np = ["", ""] #, "", "", "", "", "", ""]
  j = [] #"", ""]
  m = [] #"", ""]
  o = [] #"", ""]
  # 1050
  for n in 0..5 do
    s = "#{vc}#{np[1]}#{av}#{vp}#{p}"
    x = fnr(x)
    # 1080
    if x <= 4
      vc = ""
    else
      x = fnr(x)
      vc = VC[x]
    end

    # 1100
    x = fnr(x)
    if x <= 4
      j[1] = ""
    else
      j[1] = AJ[x]
    end

    # 1150
    x = fnr(x)
    m[1] = NM[x]

    x = fnr(x)
    x = 8 if x == 2
    o[1] = N[x]
    np[1] = "#{m[1]}#{j[1]}#{o[1]}"

    x = fnr(x)
    if x <= 4
      av = ""
    else
      x = fnr(x)
      av= AV[x]
    end

    # 1250
    x = fnr(x)
    if
      x = fnr(x)
      vp = VI[x]
    else
      for z in [0] do
        x = fnr(x)
        if x <= 4
          vp = VB[x]
          ky = 1
        else
          x = fnr(x)
          if x <= 4
            x = fnr(x)
            vt = VT[x]
            t = 1
          else
            x = fnr(x)
            vg = VG[x]
          end

          # 1300
          x = fnr(x)
          if x <= 4
            j[2] = ""
            # goto 1350
          end
        end

        # 1320
        loop do
          x = fnr(x)
          j[2] = AJ[x]
          if j[2] == j[1]
            j2 = ""
          else
            break
          end
        end

        if ky == 1
          ky = 0
          vp = vp + j[2]
          # goto 1570
          next
        end

        # 1350
        loop do
          x = fnr(x)
          m[2] = NM[x]
          if m[2] == m[1]
            m[2] = ""
          else
            break
          end
        end

        # 1380
        loop do
          x = fnr(x)
          o[2] = N[x]
          if o[2] == o[1]
            o[2] = ""
          else
            break
          end
        end

        # 1410
        np[2] = m[2] + j[2] + o[2]
        if t == 1
          t == 0
          vp = vt + np[2]
          # GOTO 1570
          next
        end

        # 1430
        x = fnr(x)
        if x <= 4
          j[3] = ""
        else
          loop do
            x = fnr(x)
            j[3] = AJ[x]
            break if j[3] != j[1] && j[3] != j[2]
          end
        end

        # 1480
        loop do
          x = fnr(x)
          m[3] = NM[x]
          break if m[3] != m[1] && m[3] != m[2]
        end

        # 1510
        x = fnr(x)
      end
    end

    # 1570
    x = fnr(x)
    puts s
  end


  puts "SHOULD I TELL YOU MORE?"
  break unless getqw.upcase == "Y"
  puts "❤️"
end

puts "OK **** *****! "
puts "I'M AWAYS"
