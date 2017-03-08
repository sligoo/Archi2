<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2(1:0)" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_11" />
        <signal name="mclk" />
        <signal name="btn" />
        <signal name="reset" />
        <signal name="XLXN_25" />
        <signal name="LED" />
        <port polarity="Input" name="mclk" />
        <port polarity="Input" name="btn" />
        <port polarity="Input" name="reset" />
        <port polarity="Output" name="LED" />
        <blockdef name="mux4to1">
            <timestamp>2017-3-6T16:42:37</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
        </blockdef>
        <blockdef name="diviseurClk1Hz">
            <timestamp>2017-3-6T16:29:30</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="diviseurClk2Hz">
            <timestamp>2017-3-6T16:29:34</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="diviseurClk5Hz">
            <timestamp>2017-3-6T16:29:39</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="diviseurClk10Hz">
            <timestamp>2017-3-6T16:29:25</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="debounce">
            <timestamp>2017-3-6T16:29:15</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="compteur">
            <timestamp>2017-3-6T16:49:43</timestamp>
            <rect width="512" x="32" y="32" height="384" />
            <line x2="32" y1="208" y2="208" x1="0" />
            <line x2="32" y1="304" y2="304" x1="0" />
            <line x2="544" y1="144" y2="144" style="linewidth:W" x1="576" />
        </blockdef>
        <blockdef name="led_driver">
            <timestamp>2017-3-6T16:29:43</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="mux4to1" name="XLXI_1">
            <blockpin signalname="XLXN_7" name="e0" />
            <blockpin signalname="XLXN_6" name="e1" />
            <blockpin signalname="XLXN_5" name="e2" />
            <blockpin signalname="XLXN_4" name="e3" />
            <blockpin signalname="XLXN_2(1:0)" name="sel(1:0)" />
            <blockpin signalname="XLXN_25" name="s" />
        </block>
        <block symbolname="diviseurClk1Hz" name="XLXI_2">
            <blockpin signalname="mclk" name="clk" />
            <blockpin signalname="XLXN_11" name="reset" />
            <blockpin signalname="XLXN_7" name="nclk" />
        </block>
        <block symbolname="diviseurClk2Hz" name="XLXI_3">
            <blockpin signalname="mclk" name="clk" />
            <blockpin signalname="XLXN_11" name="reset" />
            <blockpin signalname="XLXN_6" name="nclk" />
        </block>
        <block symbolname="diviseurClk5Hz" name="XLXI_4">
            <blockpin signalname="mclk" name="clk" />
            <blockpin signalname="XLXN_11" name="reset" />
            <blockpin signalname="XLXN_5" name="nclk" />
        </block>
        <block symbolname="diviseurClk10Hz" name="XLXI_5">
            <blockpin signalname="mclk" name="clk" />
            <blockpin signalname="XLXN_11" name="reset" />
            <blockpin signalname="XLXN_4" name="nclk" />
        </block>
        <block symbolname="debounce" name="XLXI_6">
            <blockpin signalname="btn" name="si" />
            <blockpin signalname="mclk" name="clk" />
            <blockpin signalname="XLXN_3" name="so" />
        </block>
        <block symbolname="compteur" name="XLXI_7">
            <blockpin signalname="XLXN_3" name="clk" />
            <blockpin signalname="reset" name="sclr" />
            <blockpin signalname="XLXN_2(1:0)" name="q(1:0)" />
        </block>
        <block symbolname="led_driver" name="XLXI_8">
            <blockpin signalname="XLXN_25" name="clk" />
            <blockpin signalname="XLXN_11" name="reset" />
            <blockpin signalname="LED" name="led" />
        </block>
        <block symbolname="inv" name="XLXI_9">
            <blockpin signalname="reset" name="I" />
            <blockpin signalname="XLXN_11" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="896" y="336" name="XLXI_2" orien="R0">
        </instance>
        <instance x="896" y="608" name="XLXI_3" orien="R0">
        </instance>
        <instance x="896" y="864" name="XLXI_4" orien="R0">
        </instance>
        <instance x="896" y="1104" name="XLXI_5" orien="R0">
        </instance>
        <instance x="2880" y="1040" name="XLXI_8" orien="R0">
        </instance>
        <instance x="2288" y="976" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1376" y="1360" name="XLXI_7" orien="R0">
        </instance>
        <branch name="XLXN_2(1:0)">
            <wire x2="2112" y1="1504" y2="1504" x1="1952" />
            <wire x2="2112" y1="944" y2="1504" x1="2112" />
            <wire x2="2272" y1="944" y2="944" x1="2112" />
            <wire x2="2288" y1="944" y2="944" x1="2272" />
        </branch>
        <instance x="896" y="1424" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_3">
            <wire x2="1296" y1="1328" y2="1328" x1="1280" />
            <wire x2="1328" y1="1328" y2="1328" x1="1296" />
            <wire x2="1328" y1="1328" y2="1568" x1="1328" />
            <wire x2="1376" y1="1568" y2="1568" x1="1328" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1776" y1="1008" y2="1008" x1="1280" />
            <wire x2="1776" y1="880" y2="1008" x1="1776" />
            <wire x2="2288" y1="880" y2="880" x1="1776" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1776" y1="768" y2="768" x1="1280" />
            <wire x2="1776" y1="768" y2="816" x1="1776" />
            <wire x2="2288" y1="816" y2="816" x1="1776" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="1776" y1="512" y2="512" x1="1280" />
            <wire x2="1776" y1="512" y2="752" x1="1776" />
            <wire x2="2288" y1="752" y2="752" x1="1776" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1792" y1="240" y2="240" x1="1280" />
            <wire x2="1792" y1="240" y2="688" x1="1792" />
            <wire x2="2288" y1="688" y2="688" x1="1792" />
        </branch>
        <instance x="528" y="1728" name="XLXI_9" orien="R0" />
        <branch name="XLXN_11">
            <wire x2="816" y1="1696" y2="1696" x1="752" />
            <wire x2="896" y1="304" y2="304" x1="816" />
            <wire x2="816" y1="304" y2="576" x1="816" />
            <wire x2="896" y1="576" y2="576" x1="816" />
            <wire x2="816" y1="576" y2="832" x1="816" />
            <wire x2="896" y1="832" y2="832" x1="816" />
            <wire x2="816" y1="832" y2="1072" x1="816" />
            <wire x2="896" y1="1072" y2="1072" x1="816" />
            <wire x2="816" y1="1072" y2="1184" x1="816" />
            <wire x2="816" y1="1184" y2="1696" x1="816" />
            <wire x2="1840" y1="1184" y2="1184" x1="816" />
            <wire x2="1840" y1="1008" y2="1184" x1="1840" />
            <wire x2="2880" y1="1008" y2="1008" x1="1840" />
        </branch>
        <iomarker fontsize="28" x="464" y="240" name="mclk" orien="R180" />
        <branch name="mclk">
            <wire x2="576" y1="240" y2="240" x1="464" />
            <wire x2="624" y1="240" y2="240" x1="576" />
            <wire x2="880" y1="240" y2="240" x1="624" />
            <wire x2="896" y1="240" y2="240" x1="880" />
            <wire x2="624" y1="240" y2="512" x1="624" />
            <wire x2="896" y1="512" y2="512" x1="624" />
            <wire x2="624" y1="512" y2="768" x1="624" />
            <wire x2="896" y1="768" y2="768" x1="624" />
            <wire x2="624" y1="768" y2="1008" x1="624" />
            <wire x2="896" y1="1008" y2="1008" x1="624" />
            <wire x2="624" y1="1008" y2="1392" x1="624" />
            <wire x2="896" y1="1392" y2="1392" x1="624" />
        </branch>
        <branch name="btn">
            <wire x2="880" y1="1328" y2="1328" x1="608" />
            <wire x2="896" y1="1328" y2="1328" x1="880" />
        </branch>
        <iomarker fontsize="28" x="608" y="1328" name="btn" orien="R180" />
        <branch name="reset">
            <wire x2="496" y1="1696" y2="1696" x1="320" />
            <wire x2="512" y1="1696" y2="1696" x1="496" />
            <wire x2="528" y1="1696" y2="1696" x1="512" />
            <wire x2="496" y1="1600" y2="1696" x1="496" />
            <wire x2="928" y1="1600" y2="1600" x1="496" />
            <wire x2="928" y1="1600" y2="1664" x1="928" />
            <wire x2="1376" y1="1664" y2="1664" x1="928" />
        </branch>
        <iomarker fontsize="28" x="320" y="1696" name="reset" orien="R180" />
        <branch name="XLXN_25">
            <wire x2="2768" y1="688" y2="688" x1="2672" />
            <wire x2="2768" y1="688" y2="944" x1="2768" />
            <wire x2="2880" y1="944" y2="944" x1="2768" />
        </branch>
        <branch name="LED">
            <wire x2="3296" y1="944" y2="944" x1="3264" />
        </branch>
        <iomarker fontsize="28" x="3296" y="944" name="LED" orien="R0" />
    </sheet>
</drawing>