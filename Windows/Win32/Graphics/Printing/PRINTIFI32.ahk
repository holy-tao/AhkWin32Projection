#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Gdi\PAN_LETT_FORM.ahk" { PAN_LETT_FORM }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\Gdi\PAN_MIDLINE.ahk" { PAN_MIDLINE }
#Import "..\Gdi\PAN_PROPORTION.ahk" { PAN_PROPORTION }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\Gdi\PANOSE.ahk" { PANOSE }
#Import "..\Gdi\PAN_FAMILY_TYPE.ahk" { PAN_FAMILY_TYPE }
#Import "..\Gdi\PAN_XHEIGHT.ahk" { PAN_XHEIGHT }
#Import "..\Gdi\PAN_SERIF_STYLE.ahk" { PAN_SERIF_STYLE }
#Import "..\Gdi\PAN_CONTRAST.ahk" { PAN_CONTRAST }
#Import "..\Gdi\PAN_STROKE_VARIATION.ahk" { PAN_STROKE_VARIATION }
#Import "..\Gdi\PAN_ARM_STYLE.ahk" { PAN_ARM_STYLE }
#Import "..\Gdi\PAN_WEIGHT.ahk" { PAN_WEIGHT }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINTIFI32 {
    #StructPack 8

    cjThis : UInt32

    cjIfiExtra : UInt32

    dpwszFamilyName : Int32

    dpwszStyleName : Int32

    dpwszFaceName : Int32

    dpwszUniqueName : Int32

    dpFontSim : Int32

    lEmbedId : Int32

    lItalicAngle : Int32

    lCharBias : Int32

    dpCharSets : Int32

    jWinCharSet : Int8

    jWinPitchAndFamily : Int8

    usWinWeight : UInt16

    flInfo : UInt32

    fsSelection : UInt16

    fsType : UInt16

    fwdUnitsPerEm : Int16

    fwdLowestPPEm : Int16

    fwdWinAscender : Int16

    fwdWinDescender : Int16

    fwdMacAscender : Int16

    fwdMacDescender : Int16

    fwdMacLineGap : Int16

    fwdTypoAscender : Int16

    fwdTypoDescender : Int16

    fwdTypoLineGap : Int16

    fwdAveCharWidth : Int16

    fwdMaxCharInc : Int16

    fwdCapHeight : Int16

    fwdXHeight : Int16

    fwdSubscriptXSize : Int16

    fwdSubscriptYSize : Int16

    fwdSubscriptXOffset : Int16

    fwdSubscriptYOffset : Int16

    fwdSuperscriptXSize : Int16

    fwdSuperscriptYSize : Int16

    fwdSuperscriptXOffset : Int16

    fwdSuperscriptYOffset : Int16

    fwdUnderscoreSize : Int16

    fwdUnderscorePosition : Int16

    fwdStrikeoutSize : Int16

    fwdStrikeoutPosition : Int16

    chFirstChar : Int8

    chLastChar : Int8

    chDefaultChar : Int8

    chBreakChar : Int8

    wcFirstChar : Int8

    wcLastChar : Int8

    wcDefaultChar : Int8

    wcBreakChar : Int8

    ptlBaseline : POINTL

    ptlAspect : POINTL

    ptlCaret : POINTL

    rclFontBox : RECTL

    achVendId : Int8[4]

    cKerningPairs : UInt32

    ulPanoseCulture : UInt32

    panose : PANOSE

}
