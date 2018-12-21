(
q = SerialPort(
	"COM5",
	baudrate: 9600,
	crtscts: true);
)

(
r= Routine({
    var byte, str, res;
    99999.do{|i|
        if(q.read==10, {
            str = "";
            while({byte = q.read; byte !=13 }, {
                str= str++byte.asAscii;
			});
            res= str.asInteger;
           (res).postln;
//			d = {SinOsc.ar(res, amp: 0.1, 0.1)}.play;
        });
    };
}).play;
)

