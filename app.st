Object subclass: Cksum [
    | crctab |

    Cksum class >> new [
        | r |
        r := super new . r init . ^r
    ]

    init [
        crctab := #(
            16r00000000
            16r04C11DB7 16r09823B6E 16r0D4326D9 16r130476DC 16r17C56B6B
            16r1A864DB2 16r1E475005 16r2608EDB8 16r22C9F00F 16r2F8AD6D6
            16r2B4BCB61 16r350C9B64 16r31CD86D3 16r3C8EA00A 16r384FBDBD
            16r4C11DB70 16r48D0C6C7 16r4593E01E 16r4152FDA9 16r5F15ADAC
            16r5BD4B01B 16r569796C2 16r52568B75 16r6A1936C8 16r6ED82B7F
            16r639B0DA6 16r675A1011 16r791D4014 16r7DDC5DA3 16r709F7B7A
            16r745E66CD 16r9823B6E0 16r9CE2AB57 16r91A18D8E 16r95609039
            16r8B27C03C 16r8FE6DD8B 16r82A5FB52 16r8664E6E5 16rBE2B5B58
            16rBAEA46EF 16rB7A96036 16rB3687D81 16rAD2F2D84 16rA9EE3033
            16rA4AD16EA 16rA06C0B5D 16rD4326D90 16rD0F37027 16rDDB056FE
            16rD9714B49 16rC7361B4C 16rC3F706FB 16rCEB42022 16rCA753D95
            16rF23A8028 16rF6FB9D9F 16rFBB8BB46 16rFF79A6F1 16rE13EF6F4
            16rE5FFEB43 16rE8BCCD9A 16rEC7DD02D 16r34867077 16r30476DC0
            16r3D044B19 16r39C556AE 16r278206AB 16r23431B1C 16r2E003DC5
            16r2AC12072 16r128E9DCF 16r164F8078 16r1B0CA6A1 16r1FCDBB16
            16r018AEB13 16r054BF6A4 16r0808D07D 16r0CC9CDCA 16r7897AB07
            16r7C56B6B0 16r71159069 16r75D48DDE 16r6B93DDDB 16r6F52C06C
            16r6211E6B5 16r66D0FB02 16r5E9F46BF 16r5A5E5B08 16r571D7DD1
            16r53DC6066 16r4D9B3063 16r495A2DD4 16r44190B0D 16r40D816BA
            16rACA5C697 16rA864DB20 16rA527FDF9 16rA1E6E04E 16rBFA1B04B
            16rBB60ADFC 16rB6238B25 16rB2E29692 16r8AAD2B2F 16r8E6C3698
            16r832F1041 16r87EE0DF6 16r99A95DF3 16r9D684044 16r902B669D
            16r94EA7B2A 16rE0B41DE7 16rE4750050 16rE9362689 16rEDF73B3E
            16rF3B06B3B 16rF771768C 16rFA325055 16rFEF34DE2 16rC6BCF05F
            16rC27DEDE8 16rCF3ECB31 16rCBFFD686 16rD5B88683 16rD1799B34
            16rDC3ABDED 16rD8FBA05A 16r690CE0EE 16r6DCDFD59 16r608EDB80
            16r644FC637 16r7A089632 16r7EC98B85 16r738AAD5C 16r774BB0EB
            16r4F040D56 16r4BC510E1 16r46863638 16r42472B8F 16r5C007B8A
            16r58C1663D 16r558240E4 16r51435D53 16r251D3B9E 16r21DC2629
            16r2C9F00F0 16r285E1D47 16r36194D42 16r32D850F5 16r3F9B762C
            16r3B5A6B9B 16r0315D626 16r07D4CB91 16r0A97ED48 16r0E56F0FF
            16r1011A0FA 16r14D0BD4D 16r19939B94 16r1D528623 16rF12F560E
            16rF5EE4BB9 16rF8AD6D60 16rFC6C70D7 16rE22B20D2 16rE6EA3D65
            16rEBA91BBC 16rEF68060B 16rD727BBB6 16rD3E6A601 16rDEA580D8
            16rDA649D6F 16rC423CD6A 16rC0E2D0DD 16rCDA1F604 16rC960EBB3
            16rBD3E8D7E 16rB9FF90C9 16rB4BCB610 16rB07DABA7 16rAE3AFBA2
            16rAAFBE615 16rA7B8C0CC 16rA379DD7B 16r9B3660C6 16r9FF77D71
            16r92B45BA8 16r9675461F 16r8832161A 16r8CF30BAD 16r81B02D74
            16r857130C3 16r5D8A9099 16r594B8D2E 16r5408ABF7 16r50C9B640
            16r4E8EE645 16r4A4FFBF2 16r470CDD2B 16r43CDC09C 16r7B827D21
            16r7F436096 16r7200464F 16r76C15BF8 16r68860BFD 16r6C47164A
            16r61043093 16r65C52D24 16r119B4BE9 16r155A565E 16r18197087
            16r1CD86D30 16r029F3D35 16r065E2082 16r0B1D065B 16r0FDC1BEC
            16r3793A651 16r3352BBE6 16r3E119D3F 16r3AD08088 16r2497D08D
            16r2056CD3A 16r2D15EBE3 16r29D4F654 16rC5A92679 16rC1683BCE
            16rCC2B1D17 16rC8EA00A0 16rD6AD50A5 16rD26C4D12 16rDF2F6BCB
            16rDBEE767C 16rE3A1CBC1 16rE760D676 16rEA23F0AF 16rEEE2ED18
            16rF0A5BD1D 16rF464A0AA 16rF9278673 16rFDE69BC4 16r89B8FD09
            16r8D79E0BE 16r803AC667 16r84FBDBD0 16r9ABC8BD5 16r9E7D9662
            16r933EB0BB 16r97FFAD0C 16rAFB010B1 16rAB710D06 16rA6322BDF
            16rA2F33668 16rBCB4666D 16rB8757BDA 16rB5365D03 16rB1F740B4)
    ]

    crc: a x: b[
         ^((a bitShift: 8) bitXor: (crctab at: 1 + (((a bitShift: (24 negated)) bitXor: b) bitAnd: 16rFF)))
    ]

    eval: file [
        | sum length |
        sum := 0 .
        length := file size .
        length timesRepeat: [sum := (self crc: sum x: (file nextByte))] .
        [ length ~= 0] whileTrue: [sum := (self crc: sum x: length) . length := length bitShift: (8 negated)] .
        sum := (sum bitInvert) bitAnd: 16rFFFFFFFF .
        ^ sum
    ]

    checksum: args [
        | i | 
        i := 1 .
        [(args size) >= i] whileTrue: [
            | path file |
            path := (args at: i) .

            ((path copyFrom: 1 to: 2) = '--')

            ifTrue: [self handler: path ]; 

            ifFalse: [
                ((File name: path) isFile)
                ifTrue: [
                    file := FileStream open: path mode: FileStream read .
                    Transcript
                        show: (self eval: file) asString;
                        show: ' ';
                        show: (file size) asString;
                        show: ' ';
                        show: path; cr .
                ] .
            ] .

            i := i + 1
        ]
    ]

    handler: tag [
        (tag = '--version') ifTrue: [
            Transcript 
                show: 'cksum (coreutils) 8.30'; cr ; 
                show: 'Copyright (C) 2018 Free Software Foundation, Inc.'; cr ;
                show: 'License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.'; cr ;
                show: 'This is free software: you are free to change and redistribute it.'; cr ;
                show: 'There is NO WARRANTY, to the extent permitted by law.'; cr ;
                cr ;
                show: 'Written by Q. Frank Xia.'; cr .
        ];
        ifFalse: [
            (tag = '--help') ifTrue: [
                Transcript 
                    show: 'Usage: cksum [FILE]...'; cr ; 
                    show: '  or:  cksum [OPTION]'; cr ; 
                    show: 'Print CRC checksum and byte counts of each FILE.'; cr ; 
                    cr ; 
                    show: '      --help     display this help and exit'; cr ; 
                    show: '      --version  output version information and exit'; cr ; 
                    cr ; 
                    show: 'GNU coreutils online help: <https://www.gnu.org/software/coreutils/>'; cr ; 
                    show: 'Full documentation at: <https://www.gnu.org/software/coreutils/cksum>'; cr ; 
                    show: 'or available locally via: info ''(coreutils) cksum invocation'''; cr .
            ]
        ] . 
        ObjectMemory quit 
    ]

]


ObjectMemory gcMessage: false .
x := Cksum new .
x checksum: (Smalltalk arguments)
