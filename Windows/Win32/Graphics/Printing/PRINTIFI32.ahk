#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\Gdi\PANOSE.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PRINTIFI32 extends Win32Struct
{
    static sizeof => 184

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cjThis {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cjIfiExtra {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dpwszFamilyName {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dpwszStyleName {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dpwszFaceName {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dpwszUniqueName {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dpFontSim {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    lEmbedId {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    lItalicAngle {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    lCharBias {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dpCharSets {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    jWinCharSet {
        get => NumGet(this, 44, "char")
        set => NumPut("char", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    jWinPitchAndFamily {
        get => NumGet(this, 45, "char")
        set => NumPut("char", value, this, 45)
    }

    /**
     * @type {Integer}
     */
    usWinWeight {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }

    /**
     * @type {Integer}
     */
    flInfo {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    fsSelection {
        get => NumGet(this, 52, "ushort")
        set => NumPut("ushort", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    fsType {
        get => NumGet(this, 54, "ushort")
        set => NumPut("ushort", value, this, 54)
    }

    /**
     * @type {Integer}
     */
    fwdUnitsPerEm {
        get => NumGet(this, 56, "short")
        set => NumPut("short", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    fwdLowestPPEm {
        get => NumGet(this, 58, "short")
        set => NumPut("short", value, this, 58)
    }

    /**
     * @type {Integer}
     */
    fwdWinAscender {
        get => NumGet(this, 60, "short")
        set => NumPut("short", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    fwdWinDescender {
        get => NumGet(this, 62, "short")
        set => NumPut("short", value, this, 62)
    }

    /**
     * @type {Integer}
     */
    fwdMacAscender {
        get => NumGet(this, 64, "short")
        set => NumPut("short", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    fwdMacDescender {
        get => NumGet(this, 66, "short")
        set => NumPut("short", value, this, 66)
    }

    /**
     * @type {Integer}
     */
    fwdMacLineGap {
        get => NumGet(this, 68, "short")
        set => NumPut("short", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    fwdTypoAscender {
        get => NumGet(this, 70, "short")
        set => NumPut("short", value, this, 70)
    }

    /**
     * @type {Integer}
     */
    fwdTypoDescender {
        get => NumGet(this, 72, "short")
        set => NumPut("short", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    fwdTypoLineGap {
        get => NumGet(this, 74, "short")
        set => NumPut("short", value, this, 74)
    }

    /**
     * @type {Integer}
     */
    fwdAveCharWidth {
        get => NumGet(this, 76, "short")
        set => NumPut("short", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    fwdMaxCharInc {
        get => NumGet(this, 78, "short")
        set => NumPut("short", value, this, 78)
    }

    /**
     * @type {Integer}
     */
    fwdCapHeight {
        get => NumGet(this, 80, "short")
        set => NumPut("short", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    fwdXHeight {
        get => NumGet(this, 82, "short")
        set => NumPut("short", value, this, 82)
    }

    /**
     * @type {Integer}
     */
    fwdSubscriptXSize {
        get => NumGet(this, 84, "short")
        set => NumPut("short", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    fwdSubscriptYSize {
        get => NumGet(this, 86, "short")
        set => NumPut("short", value, this, 86)
    }

    /**
     * @type {Integer}
     */
    fwdSubscriptXOffset {
        get => NumGet(this, 88, "short")
        set => NumPut("short", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    fwdSubscriptYOffset {
        get => NumGet(this, 90, "short")
        set => NumPut("short", value, this, 90)
    }

    /**
     * @type {Integer}
     */
    fwdSuperscriptXSize {
        get => NumGet(this, 92, "short")
        set => NumPut("short", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    fwdSuperscriptYSize {
        get => NumGet(this, 94, "short")
        set => NumPut("short", value, this, 94)
    }

    /**
     * @type {Integer}
     */
    fwdSuperscriptXOffset {
        get => NumGet(this, 96, "short")
        set => NumPut("short", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    fwdSuperscriptYOffset {
        get => NumGet(this, 98, "short")
        set => NumPut("short", value, this, 98)
    }

    /**
     * @type {Integer}
     */
    fwdUnderscoreSize {
        get => NumGet(this, 100, "short")
        set => NumPut("short", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    fwdUnderscorePosition {
        get => NumGet(this, 102, "short")
        set => NumPut("short", value, this, 102)
    }

    /**
     * @type {Integer}
     */
    fwdStrikeoutSize {
        get => NumGet(this, 104, "short")
        set => NumPut("short", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    fwdStrikeoutPosition {
        get => NumGet(this, 106, "short")
        set => NumPut("short", value, this, 106)
    }

    /**
     * @type {Integer}
     */
    chFirstChar {
        get => NumGet(this, 108, "char")
        set => NumPut("char", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    chLastChar {
        get => NumGet(this, 109, "char")
        set => NumPut("char", value, this, 109)
    }

    /**
     * @type {Integer}
     */
    chDefaultChar {
        get => NumGet(this, 110, "char")
        set => NumPut("char", value, this, 110)
    }

    /**
     * @type {Integer}
     */
    chBreakChar {
        get => NumGet(this, 111, "char")
        set => NumPut("char", value, this, 111)
    }

    /**
     * @type {Integer}
     */
    wcFirstChar {
        get => NumGet(this, 112, "char")
        set => NumPut("char", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    wcLastChar {
        get => NumGet(this, 114, "char")
        set => NumPut("char", value, this, 114)
    }

    /**
     * @type {Integer}
     */
    wcDefaultChar {
        get => NumGet(this, 116, "char")
        set => NumPut("char", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    wcBreakChar {
        get => NumGet(this, 118, "char")
        set => NumPut("char", value, this, 118)
    }

    /**
     * @type {POINTL}
     */
    ptlBaseline{
        get {
            if(!this.HasProp("__ptlBaseline"))
                this.__ptlBaseline := POINTL(120, this)
            return this.__ptlBaseline
        }
    }

    /**
     * @type {POINTL}
     */
    ptlAspect{
        get {
            if(!this.HasProp("__ptlAspect"))
                this.__ptlAspect := POINTL(128, this)
            return this.__ptlAspect
        }
    }

    /**
     * @type {POINTL}
     */
    ptlCaret{
        get {
            if(!this.HasProp("__ptlCaret"))
                this.__ptlCaret := POINTL(136, this)
            return this.__ptlCaret
        }
    }

    /**
     * @type {RECTL}
     */
    rclFontBox{
        get {
            if(!this.HasProp("__rclFontBox"))
                this.__rclFontBox := RECTL(144, this)
            return this.__rclFontBox
        }
    }

    /**
     * @type {Array<Byte>}
     */
    achVendId{
        get {
            if(!this.HasProp("__achVendIdProxyArray"))
                this.__achVendIdProxyArray := Win32FixedArray(this.ptr + 160, 4, Primitive, "char")
            return this.__achVendIdProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    cKerningPairs {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * @type {Integer}
     */
    ulPanoseCulture {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {PANOSE}
     */
    panose{
        get {
            if(!this.HasProp("__panose"))
                this.__panose := PANOSE(172, this)
            return this.__panose
        }
    }
}
