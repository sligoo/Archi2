<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="Y" />
        <signal name="A" />
        <signal name="B" />
        <signal name="C" />
        <signal name="D" />
        <port polarity="Output" name="Y" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="C" />
        <port polarity="Input" name="D" />
        <blockdef name="circuit1">
            <timestamp>2017-3-6T16:7:36</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
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
        <block symbolname="circuit1" name="XLXI_1">
            <blockpin signalname="A" name="A" />
            <blockpin signalname="B" name="B" />
            <blockpin signalname="XLXN_1" name="C" />
            <blockpin signalname="Y" name="Y" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="D" name="I0" />
            <blockpin signalname="C" name="I1" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1920" y="752" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1904" y1="720" y2="720" x1="1776" />
            <wire x2="1920" y1="720" y2="720" x1="1904" />
        </branch>
        <branch name="Y">
            <wire x2="2336" y1="592" y2="592" x1="2304" />
        </branch>
        <iomarker fontsize="28" x="2336" y="592" name="Y" orien="R0" />
        <branch name="A">
            <wire x2="1904" y1="560" y2="560" x1="1424" />
            <wire x2="1904" y1="560" y2="592" x1="1904" />
            <wire x2="1920" y1="592" y2="592" x1="1904" />
        </branch>
        <branch name="B">
            <wire x2="1904" y1="608" y2="608" x1="1424" />
            <wire x2="1904" y1="608" y2="656" x1="1904" />
            <wire x2="1920" y1="656" y2="656" x1="1904" />
        </branch>
        <branch name="C">
            <wire x2="1440" y1="688" y2="688" x1="1424" />
            <wire x2="1520" y1="688" y2="688" x1="1440" />
        </branch>
        <iomarker fontsize="28" x="1424" y="688" name="C" orien="R180" />
        <branch name="D">
            <wire x2="1440" y1="752" y2="752" x1="1424" />
            <wire x2="1520" y1="752" y2="752" x1="1440" />
        </branch>
        <iomarker fontsize="28" x="1424" y="752" name="D" orien="R180" />
        <iomarker fontsize="28" x="1424" y="608" name="B" orien="R180" />
        <iomarker fontsize="28" x="1424" y="560" name="A" orien="R180" />
        <instance x="1520" y="816" name="XLXI_2" orien="R0" />
    </sheet>
</drawing>