<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="A" />
        <signal name="B" />
        <signal name="C" />
        <signal name="Y" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="C" />
        <port polarity="Output" name="Y" />
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <block symbolname="or2" name="XLXI_3">
            <blockpin signalname="C" name="I0" />
            <blockpin signalname="XLXN_1" name="I1" />
            <blockpin signalname="Y" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="B" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1616" y="896" name="XLXI_3" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1456" y1="592" y2="592" x1="1296" />
            <wire x2="1456" y1="592" y2="768" x1="1456" />
            <wire x2="1600" y1="768" y2="768" x1="1456" />
            <wire x2="1616" y1="768" y2="768" x1="1600" />
        </branch>
        <branch name="A">
            <wire x2="1024" y1="560" y2="560" x1="1008" />
            <wire x2="1040" y1="560" y2="560" x1="1024" />
        </branch>
        <iomarker fontsize="28" x="1008" y="560" name="A" orien="R180" />
        <branch name="B">
            <wire x2="1024" y1="624" y2="624" x1="1008" />
            <wire x2="1040" y1="624" y2="624" x1="1024" />
        </branch>
        <iomarker fontsize="28" x="1008" y="624" name="B" orien="R180" />
        <branch name="C">
            <wire x2="1600" y1="832" y2="832" x1="1008" />
            <wire x2="1616" y1="832" y2="832" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1008" y="832" name="C" orien="R180" />
        <branch name="Y">
            <wire x2="1904" y1="800" y2="800" x1="1872" />
        </branch>
        <iomarker fontsize="28" x="1904" y="800" name="Y" orien="R0" />
        <instance x="1040" y="688" name="XLXI_4" orien="R0" />
    </sheet>
</drawing>