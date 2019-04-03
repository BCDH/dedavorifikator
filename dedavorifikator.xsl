<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
    xmlns:ext="http://exslt.org/common" 
    xmlns:trans="http://transpoetika.org/ns" exclude-result-prefixes="xs trans" version="2.0" extension-element-prefixes="ext">
    
    <!--VERSION: 1.0.5-->
    
    <!--font mapping for Cyrillic, Latin and Greek-->
    <xsl:variable name="mainFont">Cambria</xsl:variable>
    <!--font mapping for Old Cyrillic-->
    <xsl:variable name="OCSFont">Bukyvede</xsl:variable>

    <!--source encoding table-->
    <xsl:variable name="s33-47"><![CDATA[!"#$%&'()*+,-./]]></xsl:variable>
    <xsl:variable name="s48-63"><![CDATA[0123456789:;<=>?]]></xsl:variable>
    <xsl:variable name="s64-79">@ABCDEFGHIJKLMNO</xsl:variable>
    <xsl:variable name="s80-95">PQRSTUVWXYZ[\]^_</xsl:variable>
    <xsl:variable name="s96-111">`abcdefghijklmno</xsl:variable>
    <xsl:variable name="s112-126">pqrstuvwxyz{|}~</xsl:variable>
    <xsl:variable name="s130-140">‚ƒ„…†‡ˆ‰Š‹Œ</xsl:variable>
    <xsl:variable name="s145-156">‘’“”•–—˜™š›œ</xsl:variable>
    <xsl:variable name="s159">Ÿ</xsl:variable>
    <xsl:variable name="s161-167">¡¢£¤¥¦§</xsl:variable>
    <xsl:variable name="s169-179">©ª«¬­®¯°±²³</xsl:variable>
    <xsl:variable name="s180-189">´µ¶·¸¹º»¼½</xsl:variable>
    <xsl:variable name="s190-207">¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏ</xsl:variable>
    <xsl:variable name="s209-220">ÑÒÓÔÕÖ×ØÙÚÛÜ</xsl:variable>
    <xsl:variable name="s221-239">ÝÞßàáâãäåæçèéêëìíîï</xsl:variable>
    <xsl:variable name="s241-253">ñòóôõö÷øùúûüý</xsl:variable>
    <xsl:variable name="s255">ÿ</xsl:variable>

    <!--extras-->
    <xsl:variable name="sextra">гвƒЊбп„‰Љ</xsl:variable>
    <xsl:variable name="lextra">ъь„“łѣ„[]</xsl:variable>
    <xsl:variable name="cextra">ъь„“ыѣ„[]</xsl:variable>

    <!--C00L Table-->
    <xsl:variable name="l33-47"><![CDATA[!“#$%&'()*+,-./]]></xsl:variable>
    <xsl:variable name="l48-63"><![CDATA[0123456789:;<=>?]]></xsl:variable>
    <xsl:variable name="l64-79">ŽABCDEFGHIJKLMNO</xsl:variable>
    <xsl:variable name="l80-95">PQRSTUVWXYZŠĐĆČ_</xsl:variable>
    <xsl:variable name="l96-111">žabcdefghijklmno</xsl:variable>
    <xsl:variable name="l112-126">pqrstuvwxyzšđćč</xsl:variable>
    <xsl:variable name="l130-140">‚ƒ„…†§ˆ[]~“</xsl:variable>
    <xsl:variable name="l145-156">‘’“”•–—˜™£×„</xsl:variable>
    <xsl:variable name="l159">ß</xsl:variable>
    <xsl:variable name="l161-167">←→↑↓{¦C</xsl:variable>
    <xsl:variable name="l169-179">¿†}¬-D⎺|‿‿ǯ</xsl:variable>
    <xsl:variable name="l180-189"><![CDATA[Ʒ'X·<>ṛṛ«»]]></xsl:variable>
    <xsl:variable name="l190-207">¾˚DŁЬЪØÆŒI?ɱ?'ðŐ?\</xsl:variable>
    <xsl:variable name="l209-220">ȚŰ＞Șʌʒ×ɔʃʔƟÇ</xsl:variable>
    <xsl:variable name="l221-239">Ý€LdłьъøæœVŋſə‚?őż‿</xsl:variable>
    <xsl:variable name="l241-253">țű＜ș?g÷ļņŗĭçý</xsl:variable>
    <xsl:variable name="l255">ÿ</xsl:variable>


    <!--C00C Table-->
    <xsl:variable name="c33-47"><![CDATA[!“#$%№'()*+,-./]]></xsl:variable>
    <xsl:variable name="c48-63"><![CDATA[0123456789:;<=>?]]></xsl:variable>
    <xsl:variable name="c64-79">ЖАБЦДЕФГХИЈКЛМНО</xsl:variable>
    <xsl:variable name="c80-95">ПЉРСТУВЊЏЏЗШЂЋЧ_</xsl:variable>
    <xsl:variable name="c96-111">жабцдефгхијклмно</xsl:variable>
    <xsl:variable name="c112-126">пљрстувњџџзшђћч</xsl:variable>
    <xsl:variable name="c130-140">‚ƒ„…†§ˆ[]~“</xsl:variable>
    <xsl:variable name="c145-156">‘’“”•–—˜™іı„</xsl:variable>
    <xsl:variable name="c159">?</xsl:variable>
    <xsl:variable name="c161-167">←→Ґґ{¦C</xsl:variable>
    <xsl:variable name="c169-179">Ѿѿ}¬-D⎺|‿‿ǯ</xsl:variable>
    <xsl:variable name="c180-189"><![CDATA[Ʒ'X·<>??«»]]></xsl:variable>
    <xsl:variable name="c190-207">.˚ЯЫЬЪЮЭЩІЙѪѦꙖѨѤѬѢ</xsl:variable>
    <xsl:variable name="c209-220">ѠЇЄꙊѲЅ×?ѰЩѺѴ</xsl:variable>
    <xsl:variable name="c221-239">Ё€Lяыьъюэщ?йѫѧꙗѩѥѭѣ</xsl:variable>
    <xsl:variable name="c241-253">ѡїєꙋѳѕ÷пѱщѻѵё</xsl:variable>
    <xsl:variable name="c255">?</xsl:variable>

    <!--C00ST Table-->
    <xsl:variable name="st33-47"><![CDATA[!“≠×%№?()*+,-./]]></xsl:variable>
    <xsl:variable name="st48-63"><![CDATA[??????єѥӡꙁ:;<=>?]]></xsl:variable>
    <xsl:variable name="st64-79">ЖАБЦДЕФГХИЇКЛМНО</xsl:variable>
    <xsl:variable name="st80-95">ПЉРСТУВЊЏЪꙀШЂЋЧ_</xsl:variable>
    <xsl:variable name="st96-111">жабцдефгхиїклмно</xsl:variable>
    <xsl:variable name="st112-126">пљрстувњџъꙁшђћч</xsl:variable>
    <xsl:variable name="st130-140">‚ꙿ„…†§ˆ[]~“</xsl:variable>
    <xsl:variable name="st145-156">‘’“”•–—˜™іı„</xsl:variable>
    <xsl:variable name="st159">Ѯ</xsl:variable>
    <xsl:variable name="st161-167">Чч???¦C</xsl:variable>
    <xsl:variable name="st169-179">Ѿѿ????⎺|???</xsl:variable>
    <xsl:variable name="st180-189"><![CDATA[???НҤҥ???ъ]]></xsl:variable>
    <xsl:variable name="st190-207">ы?ЯЫЬЪЮЭЩІЙѪѦꙖѨѤѬѢ</xsl:variable>
    <xsl:variable name="st209-220">ѠЇЄꙊѲЅ×?ѰЩѺѴ</xsl:variable>
    <xsl:variable name="st221-239">яы?яыьъюэщ?йѫѧꙗѩѥѭѣ</xsl:variable>
    <xsl:variable name="st241-253">ѡ?єꙋѻѕ?ꙃѱщ?ѵ?</xsl:variable>
    <xsl:variable name="st255">?</xsl:variable>

    <!--C00G Table-->
    <xsl:variable name="g33-47"><![CDATA[!"#$%?'()*+,-./]]></xsl:variable>
    <xsl:variable name="g48-63"><![CDATA[0123456789:;<=>?]]></xsl:variable>
    <xsl:variable name="g64-79">?ΑΒΧΔΕΦΓΗΙῳΚΛΜΝΟ</xsl:variable>
    <xsl:variable name="g80-95">ΠΘΡΣΤΥῃΩΞΨΖ[?]??</xsl:variable>
    <xsl:variable name="g96-111">?αβχδεφγηιςκλμνο</xsl:variable>
    <xsl:variable name="g112-126">πθρστυᾳωξψζ{|}?</xsl:variable>
    <!--didn't go beyond here-->
    <xsl:variable name="g130-140">‚ƒ„…†‡ˆ‰Š‹Œ</xsl:variable>
    <xsl:variable name="g145-156">‘’“”•–—˜™š›œ</xsl:variable>
    <xsl:variable name="g159">Ÿ</xsl:variable>
    <xsl:variable name="g161-167">¡¢£¤¥¦§</xsl:variable>
    <xsl:variable name="g169-179">©ª«¬­®¯°±²³</xsl:variable>
    <xsl:variable name="g180-189">´µ¶·¸¹º»¼½</xsl:variable>
    <xsl:variable name="g190-207">¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏ</xsl:variable>
    <xsl:variable name="g209-220">ÑÒÓÔÕÖ×ØÙÚÛÜ</xsl:variable>
    <xsl:variable name="g221-239">ÝÞßàáâãäåæçèéêëìíîï</xsl:variable>
    <xsl:variable name="g241-253">ñòóôõö÷øùúûüý</xsl:variable>
    <xsl:variable name="g255">ÿ</xsl:variable>

    <!--Greek Accents Table-->
    <xsl:variable name="latinica">aehiouwrAEHIOUWR</xsl:variable>
    <xsl:variable name="greeks">
        <code name="C01G">ἀἐἠἰὀὐὠῤἈἘἨἸ?ὈὨ?</code>
        <code name="C02G">ἁἑἡἱὁὑὡῥἉἙἩἹὙὉὩῬ</code>
        <code name="C03G">ἄἔἤἴὄὔὤ?ἌἜἬἼὌ?Ὤ?</code>
        <code name="C04G">ἅἕἥἵὅὕὥ?ἍἝἭἽὍὝὭ?</code>
        <code name="C05G">ἂἒἢἲὂὒὢ?ἊἚἪἺὊ?Ὢ?</code>
        <code name="C06G">ἃἓἣἳὃὓὣ?ἋἛἫἻὋὛὫ?</code>
        <code name="C09G">ἆ?ἦἶ?ὖὦ?Ἆ?ἮἾ??Ὦ?</code>
        <code name="C10G">ἇ?ἧἷ?ὗὧ?Ἇ?ἯἿ?ὟὯ?</code>
        <code name="C12G">???ΐ?ΰ??????????</code>
        <code name="C13G">???ῒ?ῢ??????????</code>
        <code name="C14G">άέήίόύώ?ΆΈΉΊΌΎΏ?</code>
        <code name="C15G">ὰὲὴὶὸὺὼ?ᾺῈῊῚῸῪῺ?</code>
        <code name="C16G">ᾶ?ῆῖ?ῦῶ????????</code>
        <code name="C17G">ᾶ?ῆῖ?ῦῶ????????</code>
        <code name="C20G">ᾱ??ῑ?ῡ??Ᾱ??Ῑ?Ῡ??</code>
    </xsl:variable>
 



    <!-- C00L Function -->
    <xsl:function name="trans:lat">
        <xsl:param name="string"/>
        <xsl:value-of select="translate($string,
            concat($sextra,$s33-47,$s48-63,$s64-79,$s80-95,$s96-111,$s112-126,$s130-140,$s145-156,$s159,$s161-167,$s169-179,$s180-189,$s190-207,$s209-220,$s221-239,$s241-253,$s255),
            concat($lextra,$l33-47,$l48-63,$l64-79,$l80-95,$l96-111,$l112-126,$l130-140,$l145-156,$l159,$l161-167,$l169-179,$l180-189,$l190-207,$l209-220,$l221-239,$l241-253,$l255))"
        />
    </xsl:function>

    <!-- C00C Function -->
    <xsl:function name="trans:cyr">
        <xsl:param name="string"/>
        <xsl:value-of select="translate($string,
            concat($sextra,$s33-47,$s48-63,$s64-79,$s80-95,$s96-111,$s112-126,$s130-140,$s145-156,$s159,$s161-167,$s169-179,$s180-189,$s190-207,$s209-220,$s221-239,$s241-253,$s255),
            concat($cextra,$c33-47,$c48-63,$c64-79,$c80-95,$c96-111,$c112-126,$c130-140,$c145-156,$c159,$c161-167,$c169-179,$c180-189,$c190-207,$c209-220,$c221-239,$c241-253,$c255))"
        />
    </xsl:function>

    <!-- C0ST Function -->
    <xsl:function name="trans:sla">
        <xsl:param name="string"/>
        <xsl:value-of select="translate($string,
            concat($sextra,$s33-47,$s48-63,$s64-79,$s80-95,$s96-111,$s112-126,$s130-140,$s145-156,$s159,$s161-167,$s169-179,$s180-189,$s190-207,$s209-220,$s221-239,$s241-253,$s255),
            concat($cextra,$st33-47,$st48-63,$st64-79,$st80-95,$st96-111,$st112-126,$st130-140,$st145-156,$st159,$st161-167,$st169-179,$st180-189,$st190-207,$st209-220,$st221-239,$st241-253,$st255))"
        />
    </xsl:function>

    <!-- C00G Function -->
    <xsl:function name="trans:gre">
        <xsl:param name="string"/>
        <xsl:value-of select="translate($string,
            concat($sextra,$s33-47,$s48-63,$s64-79,$s80-95,$s96-111,$s112-126),
            concat($cextra,$g33-47,$g48-63,$g64-79,$g80-95,$g96-111,$g112-126))"/>
    </xsl:function>

    <!-- цртице -->
    <xsl:template match="w:noBreakHyphen">
        <w:t>-</w:t>
    </xsl:template>


    <!-- default cyrillic -->
    <xsl:template match="w:t[not(preceding-sibling::w:rPr[child::w:rFonts[@w:ascii='C00L' or
        @w:ascii='C00G' or @w:ascii='C0ST' or starts-with(@w:ascii, 'C03') or starts-with(@w:ascii,
        'C02') or starts-with(@w:ascii, 'C1')]])]">
        <xsl:choose>
            <xsl:when test="./@xml:space">
                <w:t xml:space="preserve"><xsl:value-of select="trans:cyr(text())"/></w:t>
            </xsl:when>
            <xsl:otherwise>
                <w:t>
                    <xsl:value-of select="replace(trans:cyr(text()),'\n\s+',' ')"/>
                </w:t>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <!--латиница, старословенски и грчки-->

    <xsl:template match="w:t[preceding-sibling::w:rPr[child::w:rFonts[@w:ascii='C00L' or
        @w:ascii='C00ST' or @w:ascii='C00G']]]">
        <xsl:variable name="code"
            select="self::w:t/preceding-sibling::w:rPr/child::w:rFonts/@w:ascii"/>
        <xsl:element name="w:t">
            <xsl:if test="./@xml:space='preserve'">
                <xsl:attribute name="xml:space">preserve</xsl:attribute>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="$code='C00L'">
                    <xsl:value-of select="trans:lat(text())"/>
                </xsl:when>
                <xsl:when test="$code='C00ST'">
                    <xsl:value-of select="trans:sla(text())"/>
                </xsl:when>
                <xsl:when test="$code='C00G'">
                    <xsl:value-of select="trans:gre(text())"/>
                </xsl:when>
            </xsl:choose>

        </xsl:element>
    </xsl:template>

    <!--акценти-->

    <!-- Accentify Function -->
    <xsl:function name="trans:accentify">
        <xsl:param name="code"/>
        <xsl:param name="text"/>
        <xsl:param name="accent"/>
        <xsl:choose>
            <xsl:when test="ends-with($code,'L')">
                <xsl:value-of select="concat(trans:lat($text), $accent)"/>
            </xsl:when>
            <xsl:when test="ends-with($code,'C')">
                <xsl:value-of select="concat(trans:cyr($text), $accent)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat(trans:sla($text), $accent)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <!--старословенски акценти-->
    <xsl:template match="w:t[preceding-sibling::w:rPr[child::w:rFonts[matches(@w:ascii,
        'C0[1-9]ST')]]]">

        <xsl:variable name="code"
            select="self::w:t/preceding-sibling::w:rPr/child::w:rFonts/@w:ascii"/>

        <w:t>
            <xsl:choose>
                <xsl:when test="matches(text(), '^[\c]+$')">
                    <!-- tilde -->
                    <xsl:if test="starts-with($code, 'C01')">
                        <xsl:value-of select="trans:accentify($code, text(), '̃' )"/>
                    </xsl:if>
                    <!-- combining comma above -->
                    <xsl:if test="starts-with($code, 'C02')">
                        <xsl:value-of select="trans:accentify($code, text(), '̓' )"/>
                    </xsl:if>
                    <!--combining double grave -->
                    <xsl:if test="starts-with($code, 'C03')">
                        <xsl:value-of select="trans:accentify($code, text(), '̏' )"/>
                    </xsl:if>
                    <!--combining inverted breve -->
                    <xsl:if test="starts-with($code, 'C04')">
                        <xsl:value-of select="trans:accentify($code, text(), '̑' )"/>
                    </xsl:if>
                    <!--combining reversed comma above-->
                    <xsl:if test="starts-with($code, 'C05')">
                        <xsl:value-of select="trans:accentify($code, text(), '̔' )"/>
                    </xsl:if>
                    <!--combining grave-->
                    <xsl:if test="starts-with($code, 'C06')">
                        <xsl:value-of select="trans:accentify($code, text(), '̀' )"/>
                    </xsl:if>
                    <!--combining acute-->
                    <xsl:if test="starts-with($code, 'C07')">
                        <xsl:value-of select="trans:accentify($code, text(), '́' )"/>
                    </xsl:if>
                    <!--cyrillic psili and oxia -->
                    <!--these will not stack properly in unicode; write to debb anderson again-->
                    <xsl:if test="starts-with($code, 'C08')">
                        <xsl:value-of select="trans:accentify($code, text(), '̓́' )"/>
                    </xsl:if>
                    <!--combining cyrillic titlo -->
                    <xsl:if test="starts-with($code, 'C09')">
                        <xsl:value-of select="trans:accentify($code, text(), '҃' )"/>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="text()"/>
                </xsl:otherwise>
            </xsl:choose>
        </w:t>

    </xsl:template>


    <!--ћирлични и латинични акценти -->
    <xsl:template match="w:t[preceding-sibling::w:rPr[child::w:rFonts[matches(@w:ascii,
        'C0[1-9][CL]') or matches(@w:ascii, 'C[1-3][0-9][CL]')]]]">
        <xsl:variable name="code"
            select="self::w:t/preceding-sibling::w:rPr/child::w:rFonts/@w:ascii"/>
        <w:t>
            <xsl:choose>
                <xsl:when test="matches(text(), '^[\c]+$')">
                    <!-- краткoузлазни -->
                    <xsl:if test="starts-with($code, 'C01')">
                        <xsl:value-of select="trans:accentify($code, text(), '̀' )"/>
                    </xsl:if>
                    <!-- дугоузлазни -->
                    <xsl:if test="starts-with($code, 'C02')">
                        <xsl:value-of select="trans:accentify($code, text(), '́' )"/>
                    </xsl:if>
                    <!--краткосилазни -->
                    <xsl:if test="starts-with($code, 'C03')">
                        <xsl:value-of select="trans:accentify($code, text(), '̏' )"/>
                    </xsl:if>
                    <!--дугосилазни -->
                    <xsl:if test="starts-with($code, 'C04')">
                        <xsl:value-of select="trans:accentify($code, text(), '̑' )"/>
                    </xsl:if>
                    <!--акценатска дужина-->
                    <xsl:if test="starts-with($code, 'C05')">
                        <xsl:value-of select="trans:accentify($code, text(), '̄' )"/>
                    </xsl:if>
                    <!--combining caron-->
                    <xsl:if test="starts-with($code, 'C06')">
                        <xsl:value-of select="trans:accentify($code, text(), '̌' )"/>
                    </xsl:if>
                    <!--combining vertical line above-->
                    <xsl:if test="starts-with($code, 'C07')">
                        <xsl:value-of select="trans:accentify($code, text(), '̍' )"/>
                    </xsl:if>
                    <!--combining circumflex -->
                    <xsl:if test="starts-with($code, 'C08')">
                        <xsl:value-of select="trans:accentify($code, text(), '̂' )"/>
                    </xsl:if>
                    <!--combining breve -->
                    <xsl:if test="starts-with($code, 'C09')">
                        <xsl:value-of select="trans:accentify($code, text(), '̆' )"/>
                    </xsl:if>
                    <!--combining dot above -->
                    <xsl:if test="starts-with($code, 'C10')">
                        <xsl:value-of select="trans:accentify($code, text(), '̇' )"/>
                    </xsl:if>
                    <!--combining dot below -->
                    <xsl:if test="starts-with($code, 'C11')">
                        <xsl:value-of select="trans:accentify($code, text(), '̣' )"/>
                    </xsl:if>
                    <!--combining diaeresis -->
                    <xsl:if test="starts-with($code, 'C12')">
                        <xsl:value-of select="trans:accentify($code, text(), '̈' )"/>
                    </xsl:if>
                    <!--combining inverted breve below -->
                    <xsl:if test="starts-with($code, 'C13')">
                        <xsl:value-of select="trans:accentify($code, text(), '̯' )"/>
                    </xsl:if>
                    <!--combining tilde -->
                    <xsl:if test="starts-with($code, 'C14')">
                        <xsl:value-of select="trans:accentify($code, text(), '̃' )"/>
                    </xsl:if>
                    <!--combining ring below -->
                    <xsl:if test="starts-with($code, 'C15')">
                        <xsl:value-of select="trans:accentify($code, text(), '̥' )"/>
                    </xsl:if>
                    <!--combining cedilla -->
                    <xsl:if test="starts-with($code, 'C16')">
                        <xsl:value-of select="trans:accentify($code, text(), '̧' )"/>
                    </xsl:if>
                    <!--combining ogonek -->
                    <xsl:if test="starts-with($code, 'C17')">
                        <xsl:value-of select="trans:accentify($code, text(), '̨' )"/>
                    </xsl:if>
                    <!--combining ring above -->
                    <xsl:if test="starts-with($code, 'C18')">
                        <xsl:value-of select="trans:accentify($code, text(), '̊' )"/>
                    </xsl:if>
                    <!--combining macron + acute -->
                    <xsl:if test="starts-with($code, 'C19')">
                        <xsl:value-of select="trans:accentify($code, text(), '̄́' )"/>
                    </xsl:if>
                    <!--combining macron + grave -->
                    <xsl:if test="starts-with($code, 'C20')">
                        <xsl:value-of select="trans:accentify($code, text(), '̄̀' )"/>
                    </xsl:if>
                    <!--combining macron + grave -->
                    <xsl:if test="starts-with($code, 'C21')">
                        <xsl:value-of select="trans:accentify($code, text(), '̮' )"/>
                    </xsl:if>
                    <!--combining dot below + acute -->
                    <xsl:if test="starts-with($code, 'C22')">
                        <xsl:value-of select="trans:accentify($code, text(), '̣́' )"/>
                    </xsl:if>
                    <!--combining ring below + acute -->
                    <xsl:if test="starts-with($code, 'C23')">
                        <xsl:value-of select="trans:accentify($code, text(), '̥́' )"/>
                    </xsl:if>
                    <!--combining ogonek + acute -->
                    <xsl:if test="starts-with($code, 'C24')">
                        <xsl:value-of select="trans:accentify($code, text(), '̨́' )"/>
                    </xsl:if>
                    <!--combining caron below -->
                    <xsl:if test="starts-with($code, 'C25')">
                        <xsl:value-of select="trans:accentify($code, text(), '̬' )"/>
                    </xsl:if>
                    <!--combining greek dialytika tonos -->
                    <xsl:if test="starts-with($code, 'C26')">
                        <xsl:value-of select="trans:accentify($code, text(), '̈́' )"/>
                    </xsl:if>
                    <!--i have no idea what this is -->
                    <xsl:if test="starts-with($code, 'C27')">
                        <xsl:value-of select="trans:accentify($code, text(), '' )"/>
                    </xsl:if>
                    <!--combining macron + breve -->
                    <xsl:if test="starts-with($code, 'C28')">
                        <xsl:value-of select="trans:accentify($code, text(), '̄̆' )"/>
                    </xsl:if>
                    <!--combining cedilla + acute -->
                    <xsl:if test="starts-with($code, 'C29')">
                        <xsl:value-of select="trans:accentify($code, text(), '̧́' )"/>
                    </xsl:if>
                    <!--combining vertical line above + dot below -->
                    <xsl:if test="starts-with($code, 'C30')">
                        <xsl:value-of select="trans:accentify($code, text(), '̣̍' )"/>
                    </xsl:if>
                    <!--combining two macrons -->
                    <xsl:if test="starts-with($code, 'C31')">
                        <xsl:value-of select="trans:accentify($code, text(), '̄̄' )"/>
                    </xsl:if>
                    <!--combining double acute -->
                    <xsl:if test="starts-with($code, 'C32')">
                        <xsl:value-of select="trans:accentify($code, text(), '̋' )"/>
                    </xsl:if>
                    <!--cyrillic psili and oxia -->
                    <!--these will not stack properly in unicode; write to debb anderson again-->
                    <xsl:if test="starts-with($code, 'C33')">
                        <xsl:value-of select="trans:accentify($code, text(), '̓́' )"/>
                    </xsl:if>
                    <!--combining dot above + tilde -->
                    <xsl:if test="starts-with($code, 'C34')">
                        <xsl:value-of select="trans:accentify($code, text(), '̓́' )"/>
                    </xsl:if>

                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="text()"/>
                </xsl:otherwise>
            </xsl:choose>
        </w:t>
    </xsl:template>


    <!--грчки акценти-->
    <xsl:template match="w:t[preceding-sibling::w:rPr[child::w:rFonts[matches(@w:ascii,
        'C0[1-9]G') or matches(@w:ascii, 'C[1-2][0-58-9]G')]]]">
        <xsl:variable name="code"
            select="self::w:t/preceding-sibling::w:rPr/child::w:rFonts/@w:ascii"/>
        <xsl:variable name="greek">
            <xsl:value-of select="ext:node-set($greeks)/code[@name=$code]"/>
        </xsl:variable>
        <w:t>
            <xsl:choose>
                <xsl:when test="matches(text(), '^[\c]+$')">
                    <xsl:value-of select="translate(text(),$latinica,$greek)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="text()"/>
                </xsl:otherwise>
            </xsl:choose>
        </w:t>
    </xsl:template>
    
    <!--version with replace for use with combining diacritics-->
    <!--combining tilde-->
    <xsl:template match="w:t[preceding-sibling::w:rPr[child::w:rFonts[matches(@w:ascii, 'C16G')]]]">
        <xsl:variable name="code"
            select="self::w:t/preceding-sibling::w:rPr/child::w:rFonts/@w:ascii"/>
        <xsl:variable name="greek">
            <xsl:value-of select="ext:node-set($greeks)/code[@name=$code]"/>
        </xsl:variable>
        <w:t>   
            <xsl:value-of select="replace(replace(replace(replace(replace(text(), 'a', 'α̃'), 'h', 'η̃'), 'i', 'ι̃'), 'u', 'υ̃'), 'w', 'ω̃')"/> 
        </w:t>
    </xsl:template>
    
  <!--  combining inverted breve-->
    <xsl:template match="w:t[preceding-sibling::w:rPr[child::w:rFonts[matches(@w:ascii, 'C17G')]]]">
        <w:t>   
                    
            <xsl:value-of select="replace(replace(replace(replace(replace(text(), 'a', 'α̑'), 'h', 'η̑'), 'i', 'ι̑'), 'u', 'υ̑'), 'w', 'ω̑')"/> 
        </w:t>
    </xsl:template>
    

    <xsl:template match="w:rFonts[starts-with(@w:hAnsi,'C')]">
        <xsl:variable name="code">
            <xsl:value-of select="./@w:hAnsi"></xsl:value-of>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$code='C00ST'">
                <w:rFonts w:ascii='C00ST' w:hAnsi='Bukyvede'></w:rFonts>
            </xsl:when>
            <xsl:when test="$code='C00C'">
                <xsl:element name="w:rFonts">
                    <xsl:attribute name="w:ascii">
                        <xsl:value-of select="$mainFont"/>
                    </xsl:attribute>
                    <xsl:attribute name="w:hAnsi">
                        <xsl:value-of select="$mainFont"></xsl:value-of>
                    </xsl:attribute>
                </xsl:element>
                
            </xsl:when>

            <xsl:when test="$code='C00L'">
                <xsl:element name="w:rFonts">
                    <xsl:attribute name="w:ascii">
                        <xsl:value-of select="$mainFont"/>
                    </xsl:attribute>
                    <xsl:attribute name="w:hAnsi">
                        <xsl:value-of select="$mainFont"></xsl:value-of>
                    </xsl:attribute>
                </xsl:element>
            </xsl:when>       
        </xsl:choose>
    </xsl:template>
    
   <!-- this is to increase the size for Bukyvede font-->
<!--    <xsl:template match="w:sz[@w:val=18][preceding-sibling::w:rFonts[@w:ascii='C00ST']]">
        <w:sz w:val="20"></w:sz>
    </xsl:template>-->
    
    <xsl:template match="w:rFonts[@w:hAnsi='Times New Roman']">
        <xsl:element name="w:rFonts">
            <xsl:attribute name="w:ascii">
                <xsl:value-of select="$mainFont"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="w:hAnsi">
                <xsl:value-of select="$mainFont"></xsl:value-of>
            </xsl:attribute>
        </xsl:element>    </xsl:template>

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>



