#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A Color object stores a 32-bit value that represents a color.
 * @remarks
 * 
  * The alpha component, the most significant 8 bits, specifies the transparency of a color. All four component values range from 0 to 255. An alpha component value of 0 specifies that the color is transparent, and an alpha value of 255 specifies that the color is opaque. Alpha component values from 1 through 254 specify the degree to which the color is blended with the background when the color is rendered. The red, green, and blue color component values range from 0 to 255 and determine the intensity of the color. The <a href="https://docs.microsoft.com/windows/desktop/api/gdipluscolor/nf-gdipluscolor-color-makeargb">Color::MakeARGB</a> method is used to encapsulate the four color components into a single 32-bit value.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdipluscolor/nl-gdipluscolor-color
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Color extends Win32Struct
{
    static sizeof => 600

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Argb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AliceBlue {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    AntiqueWhite {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Aqua {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Aquamarine {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Azure {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Beige {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Bisque {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    Black {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    BlanchedAlmond {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    Blue {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    BlueViolet {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    Brown {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    BurlyWood {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    CadetBlue {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Chartreuse {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    Chocolate {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    Coral {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    CornflowerBlue {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    Cornsilk {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    Crimson {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    Cyan {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    DarkBlue {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    DarkCyan {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    DarkGoldenrod {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    DarkGray {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    DarkGreen {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    DarkKhaki {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    DarkMagenta {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    DarkOliveGreen {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    DarkOrange {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    DarkOrchid {
        get => NumGet(this, 124, "int")
        set => NumPut("int", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    DarkRed {
        get => NumGet(this, 128, "int")
        set => NumPut("int", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    DarkSalmon {
        get => NumGet(this, 132, "int")
        set => NumPut("int", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    DarkSeaGreen {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    DarkSlateBlue {
        get => NumGet(this, 140, "int")
        set => NumPut("int", value, this, 140)
    }

    /**
     * @type {Integer}
     */
    DarkSlateGray {
        get => NumGet(this, 144, "int")
        set => NumPut("int", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    DarkTurquoise {
        get => NumGet(this, 148, "int")
        set => NumPut("int", value, this, 148)
    }

    /**
     * @type {Integer}
     */
    DarkViolet {
        get => NumGet(this, 152, "int")
        set => NumPut("int", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    DeepPink {
        get => NumGet(this, 156, "int")
        set => NumPut("int", value, this, 156)
    }

    /**
     * @type {Integer}
     */
    DeepSkyBlue {
        get => NumGet(this, 160, "int")
        set => NumPut("int", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    DimGray {
        get => NumGet(this, 164, "int")
        set => NumPut("int", value, this, 164)
    }

    /**
     * @type {Integer}
     */
    DodgerBlue {
        get => NumGet(this, 168, "int")
        set => NumPut("int", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    Firebrick {
        get => NumGet(this, 172, "int")
        set => NumPut("int", value, this, 172)
    }

    /**
     * @type {Integer}
     */
    FloralWhite {
        get => NumGet(this, 176, "int")
        set => NumPut("int", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    ForestGreen {
        get => NumGet(this, 180, "int")
        set => NumPut("int", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    Fuchsia {
        get => NumGet(this, 184, "int")
        set => NumPut("int", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    Gainsboro {
        get => NumGet(this, 188, "int")
        set => NumPut("int", value, this, 188)
    }

    /**
     * @type {Integer}
     */
    GhostWhite {
        get => NumGet(this, 192, "int")
        set => NumPut("int", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    Gold {
        get => NumGet(this, 196, "int")
        set => NumPut("int", value, this, 196)
    }

    /**
     * @type {Integer}
     */
    Goldenrod {
        get => NumGet(this, 200, "int")
        set => NumPut("int", value, this, 200)
    }

    /**
     * @type {Integer}
     */
    Gray {
        get => NumGet(this, 204, "int")
        set => NumPut("int", value, this, 204)
    }

    /**
     * @type {Integer}
     */
    Green {
        get => NumGet(this, 208, "int")
        set => NumPut("int", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    GreenYellow {
        get => NumGet(this, 212, "int")
        set => NumPut("int", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    Honeydew {
        get => NumGet(this, 216, "int")
        set => NumPut("int", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    HotPink {
        get => NumGet(this, 220, "int")
        set => NumPut("int", value, this, 220)
    }

    /**
     * @type {Integer}
     */
    IndianRed {
        get => NumGet(this, 224, "int")
        set => NumPut("int", value, this, 224)
    }

    /**
     * @type {Integer}
     */
    Indigo {
        get => NumGet(this, 228, "int")
        set => NumPut("int", value, this, 228)
    }

    /**
     * @type {Integer}
     */
    Ivory {
        get => NumGet(this, 232, "int")
        set => NumPut("int", value, this, 232)
    }

    /**
     * @type {Integer}
     */
    Khaki {
        get => NumGet(this, 236, "int")
        set => NumPut("int", value, this, 236)
    }

    /**
     * @type {Integer}
     */
    Lavender {
        get => NumGet(this, 240, "int")
        set => NumPut("int", value, this, 240)
    }

    /**
     * @type {Integer}
     */
    LavenderBlush {
        get => NumGet(this, 244, "int")
        set => NumPut("int", value, this, 244)
    }

    /**
     * @type {Integer}
     */
    LawnGreen {
        get => NumGet(this, 248, "int")
        set => NumPut("int", value, this, 248)
    }

    /**
     * @type {Integer}
     */
    LemonChiffon {
        get => NumGet(this, 252, "int")
        set => NumPut("int", value, this, 252)
    }

    /**
     * @type {Integer}
     */
    LightBlue {
        get => NumGet(this, 256, "int")
        set => NumPut("int", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    LightCoral {
        get => NumGet(this, 260, "int")
        set => NumPut("int", value, this, 260)
    }

    /**
     * @type {Integer}
     */
    LightCyan {
        get => NumGet(this, 264, "int")
        set => NumPut("int", value, this, 264)
    }

    /**
     * @type {Integer}
     */
    LightGoldenrodYellow {
        get => NumGet(this, 268, "int")
        set => NumPut("int", value, this, 268)
    }

    /**
     * @type {Integer}
     */
    LightGray {
        get => NumGet(this, 272, "int")
        set => NumPut("int", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    LightGreen {
        get => NumGet(this, 276, "int")
        set => NumPut("int", value, this, 276)
    }

    /**
     * @type {Integer}
     */
    LightPink {
        get => NumGet(this, 280, "int")
        set => NumPut("int", value, this, 280)
    }

    /**
     * @type {Integer}
     */
    LightSalmon {
        get => NumGet(this, 284, "int")
        set => NumPut("int", value, this, 284)
    }

    /**
     * @type {Integer}
     */
    LightSeaGreen {
        get => NumGet(this, 288, "int")
        set => NumPut("int", value, this, 288)
    }

    /**
     * @type {Integer}
     */
    LightSkyBlue {
        get => NumGet(this, 292, "int")
        set => NumPut("int", value, this, 292)
    }

    /**
     * @type {Integer}
     */
    LightSlateGray {
        get => NumGet(this, 296, "int")
        set => NumPut("int", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    LightSteelBlue {
        get => NumGet(this, 300, "int")
        set => NumPut("int", value, this, 300)
    }

    /**
     * @type {Integer}
     */
    LightYellow {
        get => NumGet(this, 304, "int")
        set => NumPut("int", value, this, 304)
    }

    /**
     * @type {Integer}
     */
    Lime {
        get => NumGet(this, 308, "int")
        set => NumPut("int", value, this, 308)
    }

    /**
     * @type {Integer}
     */
    LimeGreen {
        get => NumGet(this, 312, "int")
        set => NumPut("int", value, this, 312)
    }

    /**
     * @type {Integer}
     */
    Linen {
        get => NumGet(this, 316, "int")
        set => NumPut("int", value, this, 316)
    }

    /**
     * @type {Integer}
     */
    Magenta {
        get => NumGet(this, 320, "int")
        set => NumPut("int", value, this, 320)
    }

    /**
     * @type {Integer}
     */
    Maroon {
        get => NumGet(this, 324, "int")
        set => NumPut("int", value, this, 324)
    }

    /**
     * @type {Integer}
     */
    MediumAquamarine {
        get => NumGet(this, 328, "int")
        set => NumPut("int", value, this, 328)
    }

    /**
     * @type {Integer}
     */
    MediumBlue {
        get => NumGet(this, 332, "int")
        set => NumPut("int", value, this, 332)
    }

    /**
     * @type {Integer}
     */
    MediumOrchid {
        get => NumGet(this, 336, "int")
        set => NumPut("int", value, this, 336)
    }

    /**
     * @type {Integer}
     */
    MediumPurple {
        get => NumGet(this, 340, "int")
        set => NumPut("int", value, this, 340)
    }

    /**
     * @type {Integer}
     */
    MediumSeaGreen {
        get => NumGet(this, 344, "int")
        set => NumPut("int", value, this, 344)
    }

    /**
     * @type {Integer}
     */
    MediumSlateBlue {
        get => NumGet(this, 348, "int")
        set => NumPut("int", value, this, 348)
    }

    /**
     * @type {Integer}
     */
    MediumSpringGreen {
        get => NumGet(this, 352, "int")
        set => NumPut("int", value, this, 352)
    }

    /**
     * @type {Integer}
     */
    MediumTurquoise {
        get => NumGet(this, 356, "int")
        set => NumPut("int", value, this, 356)
    }

    /**
     * @type {Integer}
     */
    MediumVioletRed {
        get => NumGet(this, 360, "int")
        set => NumPut("int", value, this, 360)
    }

    /**
     * @type {Integer}
     */
    MidnightBlue {
        get => NumGet(this, 364, "int")
        set => NumPut("int", value, this, 364)
    }

    /**
     * @type {Integer}
     */
    MintCream {
        get => NumGet(this, 368, "int")
        set => NumPut("int", value, this, 368)
    }

    /**
     * @type {Integer}
     */
    MistyRose {
        get => NumGet(this, 372, "int")
        set => NumPut("int", value, this, 372)
    }

    /**
     * @type {Integer}
     */
    Moccasin {
        get => NumGet(this, 376, "int")
        set => NumPut("int", value, this, 376)
    }

    /**
     * @type {Integer}
     */
    NavajoWhite {
        get => NumGet(this, 380, "int")
        set => NumPut("int", value, this, 380)
    }

    /**
     * @type {Integer}
     */
    Navy {
        get => NumGet(this, 384, "int")
        set => NumPut("int", value, this, 384)
    }

    /**
     * @type {Integer}
     */
    OldLace {
        get => NumGet(this, 388, "int")
        set => NumPut("int", value, this, 388)
    }

    /**
     * @type {Integer}
     */
    Olive {
        get => NumGet(this, 392, "int")
        set => NumPut("int", value, this, 392)
    }

    /**
     * @type {Integer}
     */
    OliveDrab {
        get => NumGet(this, 396, "int")
        set => NumPut("int", value, this, 396)
    }

    /**
     * @type {Integer}
     */
    Orange {
        get => NumGet(this, 400, "int")
        set => NumPut("int", value, this, 400)
    }

    /**
     * @type {Integer}
     */
    OrangeRed {
        get => NumGet(this, 404, "int")
        set => NumPut("int", value, this, 404)
    }

    /**
     * @type {Integer}
     */
    Orchid {
        get => NumGet(this, 408, "int")
        set => NumPut("int", value, this, 408)
    }

    /**
     * @type {Integer}
     */
    PaleGoldenrod {
        get => NumGet(this, 412, "int")
        set => NumPut("int", value, this, 412)
    }

    /**
     * @type {Integer}
     */
    PaleGreen {
        get => NumGet(this, 416, "int")
        set => NumPut("int", value, this, 416)
    }

    /**
     * @type {Integer}
     */
    PaleTurquoise {
        get => NumGet(this, 420, "int")
        set => NumPut("int", value, this, 420)
    }

    /**
     * @type {Integer}
     */
    PaleVioletRed {
        get => NumGet(this, 424, "int")
        set => NumPut("int", value, this, 424)
    }

    /**
     * @type {Integer}
     */
    PapayaWhip {
        get => NumGet(this, 428, "int")
        set => NumPut("int", value, this, 428)
    }

    /**
     * @type {Integer}
     */
    PeachPuff {
        get => NumGet(this, 432, "int")
        set => NumPut("int", value, this, 432)
    }

    /**
     * @type {Integer}
     */
    Peru {
        get => NumGet(this, 436, "int")
        set => NumPut("int", value, this, 436)
    }

    /**
     * @type {Integer}
     */
    Pink {
        get => NumGet(this, 440, "int")
        set => NumPut("int", value, this, 440)
    }

    /**
     * @type {Integer}
     */
    Plum {
        get => NumGet(this, 444, "int")
        set => NumPut("int", value, this, 444)
    }

    /**
     * @type {Integer}
     */
    PowderBlue {
        get => NumGet(this, 448, "int")
        set => NumPut("int", value, this, 448)
    }

    /**
     * @type {Integer}
     */
    Purple {
        get => NumGet(this, 452, "int")
        set => NumPut("int", value, this, 452)
    }

    /**
     * @type {Integer}
     */
    Red {
        get => NumGet(this, 456, "int")
        set => NumPut("int", value, this, 456)
    }

    /**
     * @type {Integer}
     */
    RosyBrown {
        get => NumGet(this, 460, "int")
        set => NumPut("int", value, this, 460)
    }

    /**
     * @type {Integer}
     */
    RoyalBlue {
        get => NumGet(this, 464, "int")
        set => NumPut("int", value, this, 464)
    }

    /**
     * @type {Integer}
     */
    SaddleBrown {
        get => NumGet(this, 468, "int")
        set => NumPut("int", value, this, 468)
    }

    /**
     * @type {Integer}
     */
    Salmon {
        get => NumGet(this, 472, "int")
        set => NumPut("int", value, this, 472)
    }

    /**
     * @type {Integer}
     */
    SandyBrown {
        get => NumGet(this, 476, "int")
        set => NumPut("int", value, this, 476)
    }

    /**
     * @type {Integer}
     */
    SeaGreen {
        get => NumGet(this, 480, "int")
        set => NumPut("int", value, this, 480)
    }

    /**
     * @type {Integer}
     */
    SeaShell {
        get => NumGet(this, 484, "int")
        set => NumPut("int", value, this, 484)
    }

    /**
     * @type {Integer}
     */
    Sienna {
        get => NumGet(this, 488, "int")
        set => NumPut("int", value, this, 488)
    }

    /**
     * @type {Integer}
     */
    Silver {
        get => NumGet(this, 492, "int")
        set => NumPut("int", value, this, 492)
    }

    /**
     * @type {Integer}
     */
    SkyBlue {
        get => NumGet(this, 496, "int")
        set => NumPut("int", value, this, 496)
    }

    /**
     * @type {Integer}
     */
    SlateBlue {
        get => NumGet(this, 500, "int")
        set => NumPut("int", value, this, 500)
    }

    /**
     * @type {Integer}
     */
    SlateGray {
        get => NumGet(this, 504, "int")
        set => NumPut("int", value, this, 504)
    }

    /**
     * @type {Integer}
     */
    Snow {
        get => NumGet(this, 508, "int")
        set => NumPut("int", value, this, 508)
    }

    /**
     * @type {Integer}
     */
    SpringGreen {
        get => NumGet(this, 512, "int")
        set => NumPut("int", value, this, 512)
    }

    /**
     * @type {Integer}
     */
    SteelBlue {
        get => NumGet(this, 516, "int")
        set => NumPut("int", value, this, 516)
    }

    /**
     * @type {Integer}
     */
    Tan {
        get => NumGet(this, 520, "int")
        set => NumPut("int", value, this, 520)
    }

    /**
     * @type {Integer}
     */
    Teal {
        get => NumGet(this, 524, "int")
        set => NumPut("int", value, this, 524)
    }

    /**
     * @type {Integer}
     */
    Thistle {
        get => NumGet(this, 528, "int")
        set => NumPut("int", value, this, 528)
    }

    /**
     * @type {Integer}
     */
    Tomato {
        get => NumGet(this, 532, "int")
        set => NumPut("int", value, this, 532)
    }

    /**
     * @type {Integer}
     */
    Transparent {
        get => NumGet(this, 536, "int")
        set => NumPut("int", value, this, 536)
    }

    /**
     * @type {Integer}
     */
    Turquoise {
        get => NumGet(this, 540, "int")
        set => NumPut("int", value, this, 540)
    }

    /**
     * @type {Integer}
     */
    Violet {
        get => NumGet(this, 544, "int")
        set => NumPut("int", value, this, 544)
    }

    /**
     * @type {Integer}
     */
    Wheat {
        get => NumGet(this, 548, "int")
        set => NumPut("int", value, this, 548)
    }

    /**
     * @type {Integer}
     */
    White {
        get => NumGet(this, 552, "int")
        set => NumPut("int", value, this, 552)
    }

    /**
     * @type {Integer}
     */
    WhiteSmoke {
        get => NumGet(this, 556, "int")
        set => NumPut("int", value, this, 556)
    }

    /**
     * @type {Integer}
     */
    Yellow {
        get => NumGet(this, 560, "int")
        set => NumPut("int", value, this, 560)
    }

    /**
     * @type {Integer}
     */
    YellowGreen {
        get => NumGet(this, 564, "int")
        set => NumPut("int", value, this, 564)
    }

    /**
     * @type {Integer}
     */
    AlphaShift {
        get => NumGet(this, 568, "int")
        set => NumPut("int", value, this, 568)
    }

    /**
     * @type {Integer}
     */
    RedShift {
        get => NumGet(this, 572, "int")
        set => NumPut("int", value, this, 572)
    }

    /**
     * @type {Integer}
     */
    GreenShift {
        get => NumGet(this, 576, "int")
        set => NumPut("int", value, this, 576)
    }

    /**
     * @type {Integer}
     */
    BlueShift {
        get => NumGet(this, 580, "int")
        set => NumPut("int", value, this, 580)
    }

    /**
     * @type {Integer}
     */
    AlphaMask {
        get => NumGet(this, 584, "int")
        set => NumPut("int", value, this, 584)
    }

    /**
     * @type {Integer}
     */
    RedMask {
        get => NumGet(this, 588, "int")
        set => NumPut("int", value, this, 588)
    }

    /**
     * @type {Integer}
     */
    GreenMask {
        get => NumGet(this, 592, "int")
        set => NumPut("int", value, this, 592)
    }

    /**
     * @type {Integer}
     */
    BlueMask {
        get => NumGet(this, 596, "int")
        set => NumPut("int", value, this, 596)
    }
}
