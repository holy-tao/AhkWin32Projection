#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\Color.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI
 * @version WindowsRuntime 1.4
 */
class IColorsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IColorsStatics
     * @type {Guid}
     */
    static IID => Guid("{cff52e04-cca6-4614-a17e-754910c84a99}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AliceBlue", "get_AntiqueWhite", "get_Aqua", "get_Aquamarine", "get_Azure", "get_Beige", "get_Bisque", "get_Black", "get_BlanchedAlmond", "get_Blue", "get_BlueViolet", "get_Brown", "get_BurlyWood", "get_CadetBlue", "get_Chartreuse", "get_Chocolate", "get_Coral", "get_CornflowerBlue", "get_Cornsilk", "get_Crimson", "get_Cyan", "get_DarkBlue", "get_DarkCyan", "get_DarkGoldenrod", "get_DarkGray", "get_DarkGreen", "get_DarkKhaki", "get_DarkMagenta", "get_DarkOliveGreen", "get_DarkOrange", "get_DarkOrchid", "get_DarkRed", "get_DarkSalmon", "get_DarkSeaGreen", "get_DarkSlateBlue", "get_DarkSlateGray", "get_DarkTurquoise", "get_DarkViolet", "get_DeepPink", "get_DeepSkyBlue", "get_DimGray", "get_DodgerBlue", "get_Firebrick", "get_FloralWhite", "get_ForestGreen", "get_Fuchsia", "get_Gainsboro", "get_GhostWhite", "get_Gold", "get_Goldenrod", "get_Gray", "get_Green", "get_GreenYellow", "get_Honeydew", "get_HotPink", "get_IndianRed", "get_Indigo", "get_Ivory", "get_Khaki", "get_Lavender", "get_LavenderBlush", "get_LawnGreen", "get_LemonChiffon", "get_LightBlue", "get_LightCoral", "get_LightCyan", "get_LightGoldenrodYellow", "get_LightGreen", "get_LightGray", "get_LightPink", "get_LightSalmon", "get_LightSeaGreen", "get_LightSkyBlue", "get_LightSlateGray", "get_LightSteelBlue", "get_LightYellow", "get_Lime", "get_LimeGreen", "get_Linen", "get_Magenta", "get_Maroon", "get_MediumAquamarine", "get_MediumBlue", "get_MediumOrchid", "get_MediumPurple", "get_MediumSeaGreen", "get_MediumSlateBlue", "get_MediumSpringGreen", "get_MediumTurquoise", "get_MediumVioletRed", "get_MidnightBlue", "get_MintCream", "get_MistyRose", "get_Moccasin", "get_NavajoWhite", "get_Navy", "get_OldLace", "get_Olive", "get_OliveDrab", "get_Orange", "get_OrangeRed", "get_Orchid", "get_PaleGoldenrod", "get_PaleGreen", "get_PaleTurquoise", "get_PaleVioletRed", "get_PapayaWhip", "get_PeachPuff", "get_Peru", "get_Pink", "get_Plum", "get_PowderBlue", "get_Purple", "get_Red", "get_RosyBrown", "get_RoyalBlue", "get_SaddleBrown", "get_Salmon", "get_SandyBrown", "get_SeaGreen", "get_SeaShell", "get_Sienna", "get_Silver", "get_SkyBlue", "get_SlateBlue", "get_SlateGray", "get_Snow", "get_SpringGreen", "get_SteelBlue", "get_Tan", "get_Teal", "get_Thistle", "get_Tomato", "get_Transparent", "get_Turquoise", "get_Violet", "get_Wheat", "get_White", "get_WhiteSmoke", "get_Yellow", "get_YellowGreen"]

    /**
     * @type {Color} 
     */
    AliceBlue {
        get => this.get_AliceBlue()
    }

    /**
     * @type {Color} 
     */
    AntiqueWhite {
        get => this.get_AntiqueWhite()
    }

    /**
     * @type {Color} 
     */
    Aqua {
        get => this.get_Aqua()
    }

    /**
     * @type {Color} 
     */
    Aquamarine {
        get => this.get_Aquamarine()
    }

    /**
     * @type {Color} 
     */
    Azure {
        get => this.get_Azure()
    }

    /**
     * @type {Color} 
     */
    Beige {
        get => this.get_Beige()
    }

    /**
     * @type {Color} 
     */
    Bisque {
        get => this.get_Bisque()
    }

    /**
     * @type {Color} 
     */
    Black {
        get => this.get_Black()
    }

    /**
     * @type {Color} 
     */
    BlanchedAlmond {
        get => this.get_BlanchedAlmond()
    }

    /**
     * @type {Color} 
     */
    Blue {
        get => this.get_Blue()
    }

    /**
     * @type {Color} 
     */
    BlueViolet {
        get => this.get_BlueViolet()
    }

    /**
     * @type {Color} 
     */
    Brown {
        get => this.get_Brown()
    }

    /**
     * @type {Color} 
     */
    BurlyWood {
        get => this.get_BurlyWood()
    }

    /**
     * @type {Color} 
     */
    CadetBlue {
        get => this.get_CadetBlue()
    }

    /**
     * @type {Color} 
     */
    Chartreuse {
        get => this.get_Chartreuse()
    }

    /**
     * @type {Color} 
     */
    Chocolate {
        get => this.get_Chocolate()
    }

    /**
     * @type {Color} 
     */
    Coral {
        get => this.get_Coral()
    }

    /**
     * @type {Color} 
     */
    CornflowerBlue {
        get => this.get_CornflowerBlue()
    }

    /**
     * @type {Color} 
     */
    Cornsilk {
        get => this.get_Cornsilk()
    }

    /**
     * @type {Color} 
     */
    Crimson {
        get => this.get_Crimson()
    }

    /**
     * @type {Color} 
     */
    Cyan {
        get => this.get_Cyan()
    }

    /**
     * @type {Color} 
     */
    DarkBlue {
        get => this.get_DarkBlue()
    }

    /**
     * @type {Color} 
     */
    DarkCyan {
        get => this.get_DarkCyan()
    }

    /**
     * @type {Color} 
     */
    DarkGoldenrod {
        get => this.get_DarkGoldenrod()
    }

    /**
     * @type {Color} 
     */
    DarkGray {
        get => this.get_DarkGray()
    }

    /**
     * @type {Color} 
     */
    DarkGreen {
        get => this.get_DarkGreen()
    }

    /**
     * @type {Color} 
     */
    DarkKhaki {
        get => this.get_DarkKhaki()
    }

    /**
     * @type {Color} 
     */
    DarkMagenta {
        get => this.get_DarkMagenta()
    }

    /**
     * @type {Color} 
     */
    DarkOliveGreen {
        get => this.get_DarkOliveGreen()
    }

    /**
     * @type {Color} 
     */
    DarkOrange {
        get => this.get_DarkOrange()
    }

    /**
     * @type {Color} 
     */
    DarkOrchid {
        get => this.get_DarkOrchid()
    }

    /**
     * @type {Color} 
     */
    DarkRed {
        get => this.get_DarkRed()
    }

    /**
     * @type {Color} 
     */
    DarkSalmon {
        get => this.get_DarkSalmon()
    }

    /**
     * @type {Color} 
     */
    DarkSeaGreen {
        get => this.get_DarkSeaGreen()
    }

    /**
     * @type {Color} 
     */
    DarkSlateBlue {
        get => this.get_DarkSlateBlue()
    }

    /**
     * @type {Color} 
     */
    DarkSlateGray {
        get => this.get_DarkSlateGray()
    }

    /**
     * @type {Color} 
     */
    DarkTurquoise {
        get => this.get_DarkTurquoise()
    }

    /**
     * @type {Color} 
     */
    DarkViolet {
        get => this.get_DarkViolet()
    }

    /**
     * @type {Color} 
     */
    DeepPink {
        get => this.get_DeepPink()
    }

    /**
     * @type {Color} 
     */
    DeepSkyBlue {
        get => this.get_DeepSkyBlue()
    }

    /**
     * @type {Color} 
     */
    DimGray {
        get => this.get_DimGray()
    }

    /**
     * @type {Color} 
     */
    DodgerBlue {
        get => this.get_DodgerBlue()
    }

    /**
     * @type {Color} 
     */
    Firebrick {
        get => this.get_Firebrick()
    }

    /**
     * @type {Color} 
     */
    FloralWhite {
        get => this.get_FloralWhite()
    }

    /**
     * @type {Color} 
     */
    ForestGreen {
        get => this.get_ForestGreen()
    }

    /**
     * @type {Color} 
     */
    Fuchsia {
        get => this.get_Fuchsia()
    }

    /**
     * @type {Color} 
     */
    Gainsboro {
        get => this.get_Gainsboro()
    }

    /**
     * @type {Color} 
     */
    GhostWhite {
        get => this.get_GhostWhite()
    }

    /**
     * @type {Color} 
     */
    Gold {
        get => this.get_Gold()
    }

    /**
     * @type {Color} 
     */
    Goldenrod {
        get => this.get_Goldenrod()
    }

    /**
     * @type {Color} 
     */
    Gray {
        get => this.get_Gray()
    }

    /**
     * @type {Color} 
     */
    Green {
        get => this.get_Green()
    }

    /**
     * @type {Color} 
     */
    GreenYellow {
        get => this.get_GreenYellow()
    }

    /**
     * @type {Color} 
     */
    Honeydew {
        get => this.get_Honeydew()
    }

    /**
     * @type {Color} 
     */
    HotPink {
        get => this.get_HotPink()
    }

    /**
     * @type {Color} 
     */
    IndianRed {
        get => this.get_IndianRed()
    }

    /**
     * @type {Color} 
     */
    Indigo {
        get => this.get_Indigo()
    }

    /**
     * @type {Color} 
     */
    Ivory {
        get => this.get_Ivory()
    }

    /**
     * @type {Color} 
     */
    Khaki {
        get => this.get_Khaki()
    }

    /**
     * @type {Color} 
     */
    Lavender {
        get => this.get_Lavender()
    }

    /**
     * @type {Color} 
     */
    LavenderBlush {
        get => this.get_LavenderBlush()
    }

    /**
     * @type {Color} 
     */
    LawnGreen {
        get => this.get_LawnGreen()
    }

    /**
     * @type {Color} 
     */
    LemonChiffon {
        get => this.get_LemonChiffon()
    }

    /**
     * @type {Color} 
     */
    LightBlue {
        get => this.get_LightBlue()
    }

    /**
     * @type {Color} 
     */
    LightCoral {
        get => this.get_LightCoral()
    }

    /**
     * @type {Color} 
     */
    LightCyan {
        get => this.get_LightCyan()
    }

    /**
     * @type {Color} 
     */
    LightGoldenrodYellow {
        get => this.get_LightGoldenrodYellow()
    }

    /**
     * @type {Color} 
     */
    LightGreen {
        get => this.get_LightGreen()
    }

    /**
     * @type {Color} 
     */
    LightGray {
        get => this.get_LightGray()
    }

    /**
     * @type {Color} 
     */
    LightPink {
        get => this.get_LightPink()
    }

    /**
     * @type {Color} 
     */
    LightSalmon {
        get => this.get_LightSalmon()
    }

    /**
     * @type {Color} 
     */
    LightSeaGreen {
        get => this.get_LightSeaGreen()
    }

    /**
     * @type {Color} 
     */
    LightSkyBlue {
        get => this.get_LightSkyBlue()
    }

    /**
     * @type {Color} 
     */
    LightSlateGray {
        get => this.get_LightSlateGray()
    }

    /**
     * @type {Color} 
     */
    LightSteelBlue {
        get => this.get_LightSteelBlue()
    }

    /**
     * @type {Color} 
     */
    LightYellow {
        get => this.get_LightYellow()
    }

    /**
     * @type {Color} 
     */
    Lime {
        get => this.get_Lime()
    }

    /**
     * @type {Color} 
     */
    LimeGreen {
        get => this.get_LimeGreen()
    }

    /**
     * @type {Color} 
     */
    Linen {
        get => this.get_Linen()
    }

    /**
     * @type {Color} 
     */
    Magenta {
        get => this.get_Magenta()
    }

    /**
     * @type {Color} 
     */
    Maroon {
        get => this.get_Maroon()
    }

    /**
     * @type {Color} 
     */
    MediumAquamarine {
        get => this.get_MediumAquamarine()
    }

    /**
     * @type {Color} 
     */
    MediumBlue {
        get => this.get_MediumBlue()
    }

    /**
     * @type {Color} 
     */
    MediumOrchid {
        get => this.get_MediumOrchid()
    }

    /**
     * @type {Color} 
     */
    MediumPurple {
        get => this.get_MediumPurple()
    }

    /**
     * @type {Color} 
     */
    MediumSeaGreen {
        get => this.get_MediumSeaGreen()
    }

    /**
     * @type {Color} 
     */
    MediumSlateBlue {
        get => this.get_MediumSlateBlue()
    }

    /**
     * @type {Color} 
     */
    MediumSpringGreen {
        get => this.get_MediumSpringGreen()
    }

    /**
     * @type {Color} 
     */
    MediumTurquoise {
        get => this.get_MediumTurquoise()
    }

    /**
     * @type {Color} 
     */
    MediumVioletRed {
        get => this.get_MediumVioletRed()
    }

    /**
     * @type {Color} 
     */
    MidnightBlue {
        get => this.get_MidnightBlue()
    }

    /**
     * @type {Color} 
     */
    MintCream {
        get => this.get_MintCream()
    }

    /**
     * @type {Color} 
     */
    MistyRose {
        get => this.get_MistyRose()
    }

    /**
     * @type {Color} 
     */
    Moccasin {
        get => this.get_Moccasin()
    }

    /**
     * @type {Color} 
     */
    NavajoWhite {
        get => this.get_NavajoWhite()
    }

    /**
     * @type {Color} 
     */
    Navy {
        get => this.get_Navy()
    }

    /**
     * @type {Color} 
     */
    OldLace {
        get => this.get_OldLace()
    }

    /**
     * @type {Color} 
     */
    Olive {
        get => this.get_Olive()
    }

    /**
     * @type {Color} 
     */
    OliveDrab {
        get => this.get_OliveDrab()
    }

    /**
     * @type {Color} 
     */
    Orange {
        get => this.get_Orange()
    }

    /**
     * @type {Color} 
     */
    OrangeRed {
        get => this.get_OrangeRed()
    }

    /**
     * @type {Color} 
     */
    Orchid {
        get => this.get_Orchid()
    }

    /**
     * @type {Color} 
     */
    PaleGoldenrod {
        get => this.get_PaleGoldenrod()
    }

    /**
     * @type {Color} 
     */
    PaleGreen {
        get => this.get_PaleGreen()
    }

    /**
     * @type {Color} 
     */
    PaleTurquoise {
        get => this.get_PaleTurquoise()
    }

    /**
     * @type {Color} 
     */
    PaleVioletRed {
        get => this.get_PaleVioletRed()
    }

    /**
     * @type {Color} 
     */
    PapayaWhip {
        get => this.get_PapayaWhip()
    }

    /**
     * @type {Color} 
     */
    PeachPuff {
        get => this.get_PeachPuff()
    }

    /**
     * @type {Color} 
     */
    Peru {
        get => this.get_Peru()
    }

    /**
     * @type {Color} 
     */
    Pink {
        get => this.get_Pink()
    }

    /**
     * @type {Color} 
     */
    Plum {
        get => this.get_Plum()
    }

    /**
     * @type {Color} 
     */
    PowderBlue {
        get => this.get_PowderBlue()
    }

    /**
     * @type {Color} 
     */
    Purple {
        get => this.get_Purple()
    }

    /**
     * @type {Color} 
     */
    Red {
        get => this.get_Red()
    }

    /**
     * @type {Color} 
     */
    RosyBrown {
        get => this.get_RosyBrown()
    }

    /**
     * @type {Color} 
     */
    RoyalBlue {
        get => this.get_RoyalBlue()
    }

    /**
     * @type {Color} 
     */
    SaddleBrown {
        get => this.get_SaddleBrown()
    }

    /**
     * @type {Color} 
     */
    Salmon {
        get => this.get_Salmon()
    }

    /**
     * @type {Color} 
     */
    SandyBrown {
        get => this.get_SandyBrown()
    }

    /**
     * @type {Color} 
     */
    SeaGreen {
        get => this.get_SeaGreen()
    }

    /**
     * @type {Color} 
     */
    SeaShell {
        get => this.get_SeaShell()
    }

    /**
     * @type {Color} 
     */
    Sienna {
        get => this.get_Sienna()
    }

    /**
     * @type {Color} 
     */
    Silver {
        get => this.get_Silver()
    }

    /**
     * @type {Color} 
     */
    SkyBlue {
        get => this.get_SkyBlue()
    }

    /**
     * @type {Color} 
     */
    SlateBlue {
        get => this.get_SlateBlue()
    }

    /**
     * @type {Color} 
     */
    SlateGray {
        get => this.get_SlateGray()
    }

    /**
     * @type {Color} 
     */
    Snow {
        get => this.get_Snow()
    }

    /**
     * @type {Color} 
     */
    SpringGreen {
        get => this.get_SpringGreen()
    }

    /**
     * @type {Color} 
     */
    SteelBlue {
        get => this.get_SteelBlue()
    }

    /**
     * @type {Color} 
     */
    Tan {
        get => this.get_Tan()
    }

    /**
     * @type {Color} 
     */
    Teal {
        get => this.get_Teal()
    }

    /**
     * @type {Color} 
     */
    Thistle {
        get => this.get_Thistle()
    }

    /**
     * @type {Color} 
     */
    Tomato {
        get => this.get_Tomato()
    }

    /**
     * @type {Color} 
     */
    Transparent {
        get => this.get_Transparent()
    }

    /**
     * @type {Color} 
     */
    Turquoise {
        get => this.get_Turquoise()
    }

    /**
     * @type {Color} 
     */
    Violet {
        get => this.get_Violet()
    }

    /**
     * @type {Color} 
     */
    Wheat {
        get => this.get_Wheat()
    }

    /**
     * @type {Color} 
     */
    White {
        get => this.get_White()
    }

    /**
     * @type {Color} 
     */
    WhiteSmoke {
        get => this.get_WhiteSmoke()
    }

    /**
     * @type {Color} 
     */
    Yellow {
        get => this.get_Yellow()
    }

    /**
     * @type {Color} 
     */
    YellowGreen {
        get => this.get_YellowGreen()
    }

    /**
     * 
     * @returns {Color} 
     */
    get_AliceBlue() {
        value := Color()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_AntiqueWhite() {
        value := Color()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Aqua() {
        value := Color()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Aquamarine() {
        value := Color()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Azure() {
        value := Color()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Beige() {
        value := Color()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Bisque() {
        value := Color()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Black() {
        value := Color()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BlanchedAlmond() {
        value := Color()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Blue() {
        value := Color()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BlueViolet() {
        value := Color()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Brown() {
        value := Color()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BurlyWood() {
        value := Color()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_CadetBlue() {
        value := Color()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Chartreuse() {
        value := Color()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Chocolate() {
        value := Color()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Coral() {
        value := Color()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_CornflowerBlue() {
        value := Color()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Cornsilk() {
        value := Color()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Crimson() {
        value := Color()
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Cyan() {
        value := Color()
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkBlue() {
        value := Color()
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkCyan() {
        value := Color()
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkGoldenrod() {
        value := Color()
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkGray() {
        value := Color()
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkGreen() {
        value := Color()
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkKhaki() {
        value := Color()
        result := ComCall(32, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkMagenta() {
        value := Color()
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkOliveGreen() {
        value := Color()
        result := ComCall(34, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkOrange() {
        value := Color()
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkOrchid() {
        value := Color()
        result := ComCall(36, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkRed() {
        value := Color()
        result := ComCall(37, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkSalmon() {
        value := Color()
        result := ComCall(38, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkSeaGreen() {
        value := Color()
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkSlateBlue() {
        value := Color()
        result := ComCall(40, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkSlateGray() {
        value := Color()
        result := ComCall(41, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkTurquoise() {
        value := Color()
        result := ComCall(42, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DarkViolet() {
        value := Color()
        result := ComCall(43, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DeepPink() {
        value := Color()
        result := ComCall(44, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DeepSkyBlue() {
        value := Color()
        result := ComCall(45, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DimGray() {
        value := Color()
        result := ComCall(46, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_DodgerBlue() {
        value := Color()
        result := ComCall(47, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Firebrick() {
        value := Color()
        result := ComCall(48, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_FloralWhite() {
        value := Color()
        result := ComCall(49, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_ForestGreen() {
        value := Color()
        result := ComCall(50, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Fuchsia() {
        value := Color()
        result := ComCall(51, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Gainsboro() {
        value := Color()
        result := ComCall(52, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_GhostWhite() {
        value := Color()
        result := ComCall(53, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Gold() {
        value := Color()
        result := ComCall(54, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Goldenrod() {
        value := Color()
        result := ComCall(55, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Gray() {
        value := Color()
        result := ComCall(56, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Green() {
        value := Color()
        result := ComCall(57, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_GreenYellow() {
        value := Color()
        result := ComCall(58, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Honeydew() {
        value := Color()
        result := ComCall(59, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_HotPink() {
        value := Color()
        result := ComCall(60, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_IndianRed() {
        value := Color()
        result := ComCall(61, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Indigo() {
        value := Color()
        result := ComCall(62, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Ivory() {
        value := Color()
        result := ComCall(63, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Khaki() {
        value := Color()
        result := ComCall(64, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Lavender() {
        value := Color()
        result := ComCall(65, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LavenderBlush() {
        value := Color()
        result := ComCall(66, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LawnGreen() {
        value := Color()
        result := ComCall(67, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LemonChiffon() {
        value := Color()
        result := ComCall(68, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LightBlue() {
        value := Color()
        result := ComCall(69, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LightCoral() {
        value := Color()
        result := ComCall(70, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LightCyan() {
        value := Color()
        result := ComCall(71, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LightGoldenrodYellow() {
        value := Color()
        result := ComCall(72, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LightGreen() {
        value := Color()
        result := ComCall(73, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LightGray() {
        value := Color()
        result := ComCall(74, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LightPink() {
        value := Color()
        result := ComCall(75, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LightSalmon() {
        value := Color()
        result := ComCall(76, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LightSeaGreen() {
        value := Color()
        result := ComCall(77, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LightSkyBlue() {
        value := Color()
        result := ComCall(78, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LightSlateGray() {
        value := Color()
        result := ComCall(79, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LightSteelBlue() {
        value := Color()
        result := ComCall(80, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LightYellow() {
        value := Color()
        result := ComCall(81, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Lime() {
        value := Color()
        result := ComCall(82, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_LimeGreen() {
        value := Color()
        result := ComCall(83, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Linen() {
        value := Color()
        result := ComCall(84, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Magenta() {
        value := Color()
        result := ComCall(85, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Maroon() {
        value := Color()
        result := ComCall(86, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_MediumAquamarine() {
        value := Color()
        result := ComCall(87, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_MediumBlue() {
        value := Color()
        result := ComCall(88, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_MediumOrchid() {
        value := Color()
        result := ComCall(89, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_MediumPurple() {
        value := Color()
        result := ComCall(90, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_MediumSeaGreen() {
        value := Color()
        result := ComCall(91, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_MediumSlateBlue() {
        value := Color()
        result := ComCall(92, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_MediumSpringGreen() {
        value := Color()
        result := ComCall(93, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_MediumTurquoise() {
        value := Color()
        result := ComCall(94, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_MediumVioletRed() {
        value := Color()
        result := ComCall(95, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_MidnightBlue() {
        value := Color()
        result := ComCall(96, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_MintCream() {
        value := Color()
        result := ComCall(97, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_MistyRose() {
        value := Color()
        result := ComCall(98, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Moccasin() {
        value := Color()
        result := ComCall(99, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_NavajoWhite() {
        value := Color()
        result := ComCall(100, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Navy() {
        value := Color()
        result := ComCall(101, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_OldLace() {
        value := Color()
        result := ComCall(102, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Olive() {
        value := Color()
        result := ComCall(103, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_OliveDrab() {
        value := Color()
        result := ComCall(104, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Orange() {
        value := Color()
        result := ComCall(105, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_OrangeRed() {
        value := Color()
        result := ComCall(106, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Orchid() {
        value := Color()
        result := ComCall(107, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_PaleGoldenrod() {
        value := Color()
        result := ComCall(108, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_PaleGreen() {
        value := Color()
        result := ComCall(109, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_PaleTurquoise() {
        value := Color()
        result := ComCall(110, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_PaleVioletRed() {
        value := Color()
        result := ComCall(111, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_PapayaWhip() {
        value := Color()
        result := ComCall(112, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_PeachPuff() {
        value := Color()
        result := ComCall(113, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Peru() {
        value := Color()
        result := ComCall(114, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Pink() {
        value := Color()
        result := ComCall(115, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Plum() {
        value := Color()
        result := ComCall(116, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_PowderBlue() {
        value := Color()
        result := ComCall(117, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Purple() {
        value := Color()
        result := ComCall(118, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Red() {
        value := Color()
        result := ComCall(119, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_RosyBrown() {
        value := Color()
        result := ComCall(120, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_RoyalBlue() {
        value := Color()
        result := ComCall(121, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_SaddleBrown() {
        value := Color()
        result := ComCall(122, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Salmon() {
        value := Color()
        result := ComCall(123, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_SandyBrown() {
        value := Color()
        result := ComCall(124, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_SeaGreen() {
        value := Color()
        result := ComCall(125, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_SeaShell() {
        value := Color()
        result := ComCall(126, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Sienna() {
        value := Color()
        result := ComCall(127, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Silver() {
        value := Color()
        result := ComCall(128, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_SkyBlue() {
        value := Color()
        result := ComCall(129, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_SlateBlue() {
        value := Color()
        result := ComCall(130, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_SlateGray() {
        value := Color()
        result := ComCall(131, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Snow() {
        value := Color()
        result := ComCall(132, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_SpringGreen() {
        value := Color()
        result := ComCall(133, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_SteelBlue() {
        value := Color()
        result := ComCall(134, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Tan() {
        value := Color()
        result := ComCall(135, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Teal() {
        value := Color()
        result := ComCall(136, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Thistle() {
        value := Color()
        result := ComCall(137, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Tomato() {
        value := Color()
        result := ComCall(138, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Transparent() {
        value := Color()
        result := ComCall(139, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Turquoise() {
        value := Color()
        result := ComCall(140, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Violet() {
        value := Color()
        result := ComCall(141, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Wheat() {
        value := Color()
        result := ComCall(142, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_White() {
        value := Color()
        result := ComCall(143, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_WhiteSmoke() {
        value := Color()
        result := ComCall(144, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Yellow() {
        value := Color()
        result := ComCall(145, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Color} 
     */
    get_YellowGreen() {
        value := Color()
        result := ComCall(146, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
