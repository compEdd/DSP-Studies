(
(
SynthDef("defDeath", {arg freq = 30,amp = 0.01, gate = 1, defDeathrelease = 3;
	var chorus, source, filtermod, env, snd;
	chorus = MouseX.kr([freq], *10)* MouseY.kr(10, 100).range (1, 1.5);
	source = LFSaw.ar(chorus)*0.5;
	filtermod = SinOsc.kr(1/12).range(1, 10);
	env = Env.asr(1, amp, defDeathrelease).kr(2, gate);
	snd = LPF.ar(in: source, freq: freq * filtermod, mul: env);
Out.ar(0, Splay.ar(snd))
}).add;
);

(
SynthDef("dDeath", {arg freq = 25, amp = 0.09, gate = 1, dDeathrelease = 2;
	var chorus, source, filtermod, env, snd;
	chorus = MouseY.kr([10,20],80)* MouseX.kr(1, 300).range(1,1.2);
	source = LFSaw.ar(chorus);
	filtermod = SinTone.ar(442,0).range(0,1.2);
	env = Env.adsr(1, 2, 1, 1).kr(1, gate);
	snd = LPF.ar(in: source, freq: freq * filtermod, mul: env);
	Out.ar(0, Splay.ar(snd))
}).add;
);

(
SynthDef("wowA", {arg freq = 30, amp = 0.1, gate = 1, wowArelease = 10;
	var chorus, source, filtermod, env, snd;
	chorus = Lag.kr(freq, 2) * LFNoise0.kr([1.3, 1.5, 2, 2.3, 5, 10, 13]).range (1, 1.02);
	source = LFSaw.ar(chorus) * 0.3;
	filtermod = SinOsc.kr(1/24).range(1, 10);
	env = Env.asr(1, amp, wowArelease).kr(2, gate);
	snd = LPF.ar(in: source, freq: freq * filtermod, mul: env);
Out.ar(0, Splay.ar(snd))
}).add;
)
)
