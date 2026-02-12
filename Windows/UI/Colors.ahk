#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IColors.ahk
#Include .\IColorsStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Implements a set of predefined colors. See [Color](color.md) for usage information.
 * @remarks
 * The following image shows each predefined color, its name, and its hexadecimal value.
 * 
 * <img alt="Named colors table" src="images/color-table.png" />
 * @see https://learn.microsoft.com/uwp/api/windows.ui.colors
 * @namespace Windows.UI
 * @version WindowsRuntime 1.4
 */
class Colors extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColors

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColors.IID

    /**
     * Gets the system-defined color that has an ARGB value of #FFF0F8FF.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.aliceblue
     * @type {Color} 
     */
    static AliceBlue {
        get => Colors.get_AliceBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFAEBD7.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.antiquewhite
     * @type {Color} 
     */
    static AntiqueWhite {
        get => Colors.get_AntiqueWhite()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF00FFFF.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.aqua
     * @type {Color} 
     */
    static Aqua {
        get => Colors.get_Aqua()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF7FFFD4.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.aquamarine
     * @type {Color} 
     */
    static Aquamarine {
        get => Colors.get_Aquamarine()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFF0FFFF.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.azure
     * @type {Color} 
     */
    static Azure {
        get => Colors.get_Azure()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFF5F5DC.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.beige
     * @type {Color} 
     */
    static Beige {
        get => Colors.get_Beige()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFE4C4.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.bisque
     * @type {Color} 
     */
    static Bisque {
        get => Colors.get_Bisque()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #FF000000.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.black
     * @type {Color} 
     */
    static Black {
        get => Colors.get_Black()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFEBCD.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.blanchedalmond
     * @type {Color} 
     */
    static BlanchedAlmond {
        get => Colors.get_BlanchedAlmond()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #FF0000FF.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.blue
     * @type {Color} 
     */
    static Blue {
        get => Colors.get_Blue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF8A2BE2.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.blueviolet
     * @type {Color} 
     */
    static BlueViolet {
        get => Colors.get_BlueViolet()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #FFA52A2A.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.brown
     * @type {Color} 
     */
    static Brown {
        get => Colors.get_Brown()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFDEB887.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.burlywood
     * @type {Color} 
     */
    static BurlyWood {
        get => Colors.get_BurlyWood()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF5F9EA0.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.cadetblue
     * @type {Color} 
     */
    static CadetBlue {
        get => Colors.get_CadetBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF7FFF00.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.chartreuse
     * @type {Color} 
     */
    static Chartreuse {
        get => Colors.get_Chartreuse()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFD2691E.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.chocolate
     * @type {Color} 
     */
    static Chocolate {
        get => Colors.get_Chocolate()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFF7F50.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.coral
     * @type {Color} 
     */
    static Coral {
        get => Colors.get_Coral()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF6495ED.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.cornflowerblue
     * @type {Color} 
     */
    static CornflowerBlue {
        get => Colors.get_CornflowerBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFF8DC.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.cornsilk
     * @type {Color} 
     */
    static Cornsilk {
        get => Colors.get_Cornsilk()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFDC143C.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.crimson
     * @type {Color} 
     */
    static Crimson {
        get => Colors.get_Crimson()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #FF00FFFF.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.cyan
     * @type {Color} 
     */
    static Cyan {
        get => Colors.get_Cyan()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF00008B.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkblue
     * @type {Color} 
     */
    static DarkBlue {
        get => Colors.get_DarkBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF008B8B.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkcyan
     * @type {Color} 
     */
    static DarkCyan {
        get => Colors.get_DarkCyan()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFB8860B.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkgoldenrod
     * @type {Color} 
     */
    static DarkGoldenrod {
        get => Colors.get_DarkGoldenrod()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #FFA9A9A9.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkgray
     * @type {Color} 
     */
    static DarkGray {
        get => Colors.get_DarkGray()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF006400.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkgreen
     * @type {Color} 
     */
    static DarkGreen {
        get => Colors.get_DarkGreen()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFBDB76B.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkkhaki
     * @type {Color} 
     */
    static DarkKhaki {
        get => Colors.get_DarkKhaki()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF8B008B.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkmagenta
     * @type {Color} 
     */
    static DarkMagenta {
        get => Colors.get_DarkMagenta()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF556B2F.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkolivegreen
     * @type {Color} 
     */
    static DarkOliveGreen {
        get => Colors.get_DarkOliveGreen()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFF8C00.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkorange
     * @type {Color} 
     */
    static DarkOrange {
        get => Colors.get_DarkOrange()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF9932CC.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkorchid
     * @type {Color} 
     */
    static DarkOrchid {
        get => Colors.get_DarkOrchid()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF8B0000.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkred
     * @type {Color} 
     */
    static DarkRed {
        get => Colors.get_DarkRed()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFE9967A.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darksalmon
     * @type {Color} 
     */
    static DarkSalmon {
        get => Colors.get_DarkSalmon()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF8FBC8F.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkseagreen
     * @type {Color} 
     */
    static DarkSeaGreen {
        get => Colors.get_DarkSeaGreen()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF483D8B.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkslateblue
     * @type {Color} 
     */
    static DarkSlateBlue {
        get => Colors.get_DarkSlateBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF2F4F4F.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkslategray
     * @type {Color} 
     */
    static DarkSlateGray {
        get => Colors.get_DarkSlateGray()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF00CED1.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkturquoise
     * @type {Color} 
     */
    static DarkTurquoise {
        get => Colors.get_DarkTurquoise()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF9400D3.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.darkviolet
     * @type {Color} 
     */
    static DarkViolet {
        get => Colors.get_DarkViolet()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFF1493.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.deeppink
     * @type {Color} 
     */
    static DeepPink {
        get => Colors.get_DeepPink()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF00BFFF.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.deepskyblue
     * @type {Color} 
     */
    static DeepSkyBlue {
        get => Colors.get_DeepSkyBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF696969.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.dimgray
     * @type {Color} 
     */
    static DimGray {
        get => Colors.get_DimGray()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF1E90FF.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.dodgerblue
     * @type {Color} 
     */
    static DodgerBlue {
        get => Colors.get_DodgerBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFB22222.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.firebrick
     * @type {Color} 
     */
    static Firebrick {
        get => Colors.get_Firebrick()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFFAF0.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.floralwhite
     * @type {Color} 
     */
    static FloralWhite {
        get => Colors.get_FloralWhite()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF228B22.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.forestgreen
     * @type {Color} 
     */
    static ForestGreen {
        get => Colors.get_ForestGreen()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFF00FF.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.fuchsia
     * @type {Color} 
     */
    static Fuchsia {
        get => Colors.get_Fuchsia()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFDCDCDC.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.gainsboro
     * @type {Color} 
     */
    static Gainsboro {
        get => Colors.get_Gainsboro()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFF8F8FF.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.ghostwhite
     * @type {Color} 
     */
    static GhostWhite {
        get => Colors.get_GhostWhite()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFD700.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.gold
     * @type {Color} 
     */
    static Gold {
        get => Colors.get_Gold()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFDAA520.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.goldenrod
     * @type {Color} 
     */
    static Goldenrod {
        get => Colors.get_Goldenrod()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #FF808080.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.gray
     * @type {Color} 
     */
    static Gray {
        get => Colors.get_Gray()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #FF008000.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.green
     * @type {Color} 
     */
    static Green {
        get => Colors.get_Green()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFADFF2F.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.greenyellow
     * @type {Color} 
     */
    static GreenYellow {
        get => Colors.get_GreenYellow()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFF0FFF0.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.honeydew
     * @type {Color} 
     */
    static Honeydew {
        get => Colors.get_Honeydew()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFF69B4.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.hotpink
     * @type {Color} 
     */
    static HotPink {
        get => Colors.get_HotPink()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFCD5C5C.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.indianred
     * @type {Color} 
     */
    static IndianRed {
        get => Colors.get_IndianRed()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF4B0082.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.indigo
     * @type {Color} 
     */
    static Indigo {
        get => Colors.get_Indigo()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFFFF0.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.ivory
     * @type {Color} 
     */
    static Ivory {
        get => Colors.get_Ivory()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFF0E68C.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.khaki
     * @type {Color} 
     */
    static Khaki {
        get => Colors.get_Khaki()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFE6E6FA.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lavender
     * @type {Color} 
     */
    static Lavender {
        get => Colors.get_Lavender()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFF0F5.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lavenderblush
     * @type {Color} 
     */
    static LavenderBlush {
        get => Colors.get_LavenderBlush()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF7CFC00.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lawngreen
     * @type {Color} 
     */
    static LawnGreen {
        get => Colors.get_LawnGreen()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFFACD.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lemonchiffon
     * @type {Color} 
     */
    static LemonChiffon {
        get => Colors.get_LemonChiffon()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFADD8E6.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lightblue
     * @type {Color} 
     */
    static LightBlue {
        get => Colors.get_LightBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFF08080.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lightcoral
     * @type {Color} 
     */
    static LightCoral {
        get => Colors.get_LightCoral()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFE0FFFF.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lightcyan
     * @type {Color} 
     */
    static LightCyan {
        get => Colors.get_LightCyan()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFAFAD2.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lightgoldenrodyellow
     * @type {Color} 
     */
    static LightGoldenrodYellow {
        get => Colors.get_LightGoldenrodYellow()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF90EE90.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lightgreen
     * @type {Color} 
     */
    static LightGreen {
        get => Colors.get_LightGreen()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #FFD3D3D3.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lightgray
     * @type {Color} 
     */
    static LightGray {
        get => Colors.get_LightGray()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFB6C1.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lightpink
     * @type {Color} 
     */
    static LightPink {
        get => Colors.get_LightPink()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFA07A.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lightsalmon
     * @type {Color} 
     */
    static LightSalmon {
        get => Colors.get_LightSalmon()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF20B2AA.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lightseagreen
     * @type {Color} 
     */
    static LightSeaGreen {
        get => Colors.get_LightSeaGreen()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF87CEFA.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lightskyblue
     * @type {Color} 
     */
    static LightSkyBlue {
        get => Colors.get_LightSkyBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF778899.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lightslategray
     * @type {Color} 
     */
    static LightSlateGray {
        get => Colors.get_LightSlateGray()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFB0C4DE.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lightsteelblue
     * @type {Color} 
     */
    static LightSteelBlue {
        get => Colors.get_LightSteelBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFFFE0.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lightyellow
     * @type {Color} 
     */
    static LightYellow {
        get => Colors.get_LightYellow()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF00FF00.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.lime
     * @type {Color} 
     */
    static Lime {
        get => Colors.get_Lime()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF32CD32.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.limegreen
     * @type {Color} 
     */
    static LimeGreen {
        get => Colors.get_LimeGreen()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFAF0E6.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.linen
     * @type {Color} 
     */
    static Linen {
        get => Colors.get_Linen()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #FFFF00FF.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.magenta
     * @type {Color} 
     */
    static Magenta {
        get => Colors.get_Magenta()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF800000.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.maroon
     * @type {Color} 
     */
    static Maroon {
        get => Colors.get_Maroon()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF66CDAA.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.mediumaquamarine
     * @type {Color} 
     */
    static MediumAquamarine {
        get => Colors.get_MediumAquamarine()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF0000CD.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.mediumblue
     * @type {Color} 
     */
    static MediumBlue {
        get => Colors.get_MediumBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFBA55D3.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.mediumorchid
     * @type {Color} 
     */
    static MediumOrchid {
        get => Colors.get_MediumOrchid()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF9370DB.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.mediumpurple
     * @type {Color} 
     */
    static MediumPurple {
        get => Colors.get_MediumPurple()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF3CB371.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.mediumseagreen
     * @type {Color} 
     */
    static MediumSeaGreen {
        get => Colors.get_MediumSeaGreen()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF7B68EE.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.mediumslateblue
     * @type {Color} 
     */
    static MediumSlateBlue {
        get => Colors.get_MediumSlateBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF00FA9A.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.mediumspringgreen
     * @type {Color} 
     */
    static MediumSpringGreen {
        get => Colors.get_MediumSpringGreen()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF48D1CC.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.mediumturquoise
     * @type {Color} 
     */
    static MediumTurquoise {
        get => Colors.get_MediumTurquoise()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFC71585.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.mediumvioletred
     * @type {Color} 
     */
    static MediumVioletRed {
        get => Colors.get_MediumVioletRed()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF191970.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.midnightblue
     * @type {Color} 
     */
    static MidnightBlue {
        get => Colors.get_MidnightBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFF5FFFA.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.mintcream
     * @type {Color} 
     */
    static MintCream {
        get => Colors.get_MintCream()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFE4E1.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.mistyrose
     * @type {Color} 
     */
    static MistyRose {
        get => Colors.get_MistyRose()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFE4B5.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.moccasin
     * @type {Color} 
     */
    static Moccasin {
        get => Colors.get_Moccasin()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFDEAD.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.navajowhite
     * @type {Color} 
     */
    static NavajoWhite {
        get => Colors.get_NavajoWhite()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF000080.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.navy
     * @type {Color} 
     */
    static Navy {
        get => Colors.get_Navy()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFDF5E6.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.oldlace
     * @type {Color} 
     */
    static OldLace {
        get => Colors.get_OldLace()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF808000.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.olive
     * @type {Color} 
     */
    static Olive {
        get => Colors.get_Olive()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF6B8E23.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.olivedrab
     * @type {Color} 
     */
    static OliveDrab {
        get => Colors.get_OliveDrab()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #FFFFA500.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.orange
     * @type {Color} 
     */
    static Orange {
        get => Colors.get_Orange()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFF4500.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.orangered
     * @type {Color} 
     */
    static OrangeRed {
        get => Colors.get_OrangeRed()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFDA70D6.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.orchid
     * @type {Color} 
     */
    static Orchid {
        get => Colors.get_Orchid()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFEEE8AA.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.palegoldenrod
     * @type {Color} 
     */
    static PaleGoldenrod {
        get => Colors.get_PaleGoldenrod()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF98FB98.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.palegreen
     * @type {Color} 
     */
    static PaleGreen {
        get => Colors.get_PaleGreen()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFAFEEEE.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.paleturquoise
     * @type {Color} 
     */
    static PaleTurquoise {
        get => Colors.get_PaleTurquoise()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFDB7093.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.palevioletred
     * @type {Color} 
     */
    static PaleVioletRed {
        get => Colors.get_PaleVioletRed()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFEFD5.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.papayawhip
     * @type {Color} 
     */
    static PapayaWhip {
        get => Colors.get_PapayaWhip()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFDAB9.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.peachpuff
     * @type {Color} 
     */
    static PeachPuff {
        get => Colors.get_PeachPuff()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFCD853F.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.peru
     * @type {Color} 
     */
    static Peru {
        get => Colors.get_Peru()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFC0CB.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.pink
     * @type {Color} 
     */
    static Pink {
        get => Colors.get_Pink()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFDDA0DD.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.plum
     * @type {Color} 
     */
    static Plum {
        get => Colors.get_Plum()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFB0E0E6.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.powderblue
     * @type {Color} 
     */
    static PowderBlue {
        get => Colors.get_PowderBlue()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #FF800080.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.purple
     * @type {Color} 
     */
    static Purple {
        get => Colors.get_Purple()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #FFFF0000.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.red
     * @type {Color} 
     */
    static Red {
        get => Colors.get_Red()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFBC8F8F.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.rosybrown
     * @type {Color} 
     */
    static RosyBrown {
        get => Colors.get_RosyBrown()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF4169E1.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.royalblue
     * @type {Color} 
     */
    static RoyalBlue {
        get => Colors.get_RoyalBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF8B4513.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.saddlebrown
     * @type {Color} 
     */
    static SaddleBrown {
        get => Colors.get_SaddleBrown()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFA8072.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.salmon
     * @type {Color} 
     */
    static Salmon {
        get => Colors.get_Salmon()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFF4A460.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.sandybrown
     * @type {Color} 
     */
    static SandyBrown {
        get => Colors.get_SandyBrown()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF2E8B57.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.seagreen
     * @type {Color} 
     */
    static SeaGreen {
        get => Colors.get_SeaGreen()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFF5EE.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.seashell
     * @type {Color} 
     */
    static SeaShell {
        get => Colors.get_SeaShell()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFA0522D.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.sienna
     * @type {Color} 
     */
    static Sienna {
        get => Colors.get_Sienna()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFC0C0C0.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.silver
     * @type {Color} 
     */
    static Silver {
        get => Colors.get_Silver()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF87CEEB.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.skyblue
     * @type {Color} 
     */
    static SkyBlue {
        get => Colors.get_SkyBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF6A5ACD.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.slateblue
     * @type {Color} 
     */
    static SlateBlue {
        get => Colors.get_SlateBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF708090.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.slategray
     * @type {Color} 
     */
    static SlateGray {
        get => Colors.get_SlateGray()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFFFAFA.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.snow
     * @type {Color} 
     */
    static Snow {
        get => Colors.get_Snow()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF00FF7F.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.springgreen
     * @type {Color} 
     */
    static SpringGreen {
        get => Colors.get_SpringGreen()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF4682B4.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.steelblue
     * @type {Color} 
     */
    static SteelBlue {
        get => Colors.get_SteelBlue()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFD2B48C.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.tan
     * @type {Color} 
     */
    static Tan {
        get => Colors.get_Tan()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF008080.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.teal
     * @type {Color} 
     */
    static Teal {
        get => Colors.get_Teal()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFD8BFD8.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.thistle
     * @type {Color} 
     */
    static Thistle {
        get => Colors.get_Thistle()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFFF6347.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.tomato
     * @type {Color} 
     */
    static Tomato {
        get => Colors.get_Tomato()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #00FFFFFF.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.transparent
     * @type {Color} 
     */
    static Transparent {
        get => Colors.get_Transparent()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF40E0D0.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.turquoise
     * @type {Color} 
     */
    static Turquoise {
        get => Colors.get_Turquoise()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFEE82EE.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.violet
     * @type {Color} 
     */
    static Violet {
        get => Colors.get_Violet()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFF5DEB3.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.wheat
     * @type {Color} 
     */
    static Wheat {
        get => Colors.get_Wheat()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #FFFFFFFF.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.white
     * @type {Color} 
     */
    static White {
        get => Colors.get_White()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FFF5F5F5.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.whitesmoke
     * @type {Color} 
     */
    static WhiteSmoke {
        get => Colors.get_WhiteSmoke()
    }

    /**
     * Gets the system-defined color that has the ARGB value of #FFFFFF00.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.yellow
     * @type {Color} 
     */
    static Yellow {
        get => Colors.get_Yellow()
    }

    /**
     * Gets the system-defined color that has an ARGB value of #FF9ACD32.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.colors.yellowgreen
     * @type {Color} 
     */
    static YellowGreen {
        get => Colors.get_YellowGreen()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Color} 
     */
    static get_AliceBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_AliceBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_AntiqueWhite() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_AntiqueWhite()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Aqua() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Aqua()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Aquamarine() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Aquamarine()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Azure() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Azure()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Beige() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Beige()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Bisque() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Bisque()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Black() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Black()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_BlanchedAlmond() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_BlanchedAlmond()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Blue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Blue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_BlueViolet() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_BlueViolet()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Brown() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Brown()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_BurlyWood() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_BurlyWood()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_CadetBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_CadetBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Chartreuse() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Chartreuse()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Chocolate() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Chocolate()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Coral() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Coral()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_CornflowerBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_CornflowerBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Cornsilk() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Cornsilk()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Crimson() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Crimson()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Cyan() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Cyan()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkCyan() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkCyan()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkGoldenrod() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkGoldenrod()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkGray() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkGray()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkGreen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkGreen()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkKhaki() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkKhaki()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkMagenta() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkMagenta()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkOliveGreen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkOliveGreen()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkOrange() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkOrange()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkOrchid() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkOrchid()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkRed() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkRed()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkSalmon() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkSalmon()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkSeaGreen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkSeaGreen()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkSlateBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkSlateBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkSlateGray() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkSlateGray()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkTurquoise() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkTurquoise()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DarkViolet() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DarkViolet()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DeepPink() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DeepPink()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DeepSkyBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DeepSkyBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DimGray() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DimGray()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_DodgerBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_DodgerBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Firebrick() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Firebrick()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_FloralWhite() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_FloralWhite()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_ForestGreen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_ForestGreen()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Fuchsia() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Fuchsia()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Gainsboro() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Gainsboro()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_GhostWhite() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_GhostWhite()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Gold() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Gold()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Goldenrod() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Goldenrod()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Gray() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Gray()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Green() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Green()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_GreenYellow() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_GreenYellow()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Honeydew() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Honeydew()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_HotPink() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_HotPink()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_IndianRed() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_IndianRed()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Indigo() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Indigo()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Ivory() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Ivory()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Khaki() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Khaki()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Lavender() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Lavender()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LavenderBlush() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LavenderBlush()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LawnGreen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LawnGreen()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LemonChiffon() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LemonChiffon()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LightBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LightBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LightCoral() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LightCoral()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LightCyan() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LightCyan()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LightGoldenrodYellow() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LightGoldenrodYellow()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LightGreen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LightGreen()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LightGray() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LightGray()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LightPink() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LightPink()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LightSalmon() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LightSalmon()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LightSeaGreen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LightSeaGreen()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LightSkyBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LightSkyBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LightSlateGray() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LightSlateGray()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LightSteelBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LightSteelBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LightYellow() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LightYellow()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Lime() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Lime()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_LimeGreen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_LimeGreen()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Linen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Linen()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Magenta() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Magenta()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Maroon() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Maroon()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_MediumAquamarine() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_MediumAquamarine()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_MediumBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_MediumBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_MediumOrchid() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_MediumOrchid()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_MediumPurple() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_MediumPurple()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_MediumSeaGreen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_MediumSeaGreen()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_MediumSlateBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_MediumSlateBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_MediumSpringGreen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_MediumSpringGreen()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_MediumTurquoise() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_MediumTurquoise()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_MediumVioletRed() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_MediumVioletRed()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_MidnightBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_MidnightBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_MintCream() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_MintCream()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_MistyRose() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_MistyRose()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Moccasin() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Moccasin()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_NavajoWhite() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_NavajoWhite()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Navy() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Navy()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_OldLace() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_OldLace()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Olive() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Olive()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_OliveDrab() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_OliveDrab()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Orange() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Orange()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_OrangeRed() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_OrangeRed()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Orchid() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Orchid()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_PaleGoldenrod() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_PaleGoldenrod()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_PaleGreen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_PaleGreen()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_PaleTurquoise() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_PaleTurquoise()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_PaleVioletRed() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_PaleVioletRed()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_PapayaWhip() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_PapayaWhip()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_PeachPuff() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_PeachPuff()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Peru() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Peru()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Pink() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Pink()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Plum() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Plum()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_PowderBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_PowderBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Purple() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Purple()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Red() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Red()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_RosyBrown() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_RosyBrown()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_RoyalBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_RoyalBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_SaddleBrown() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_SaddleBrown()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Salmon() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Salmon()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_SandyBrown() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_SandyBrown()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_SeaGreen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_SeaGreen()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_SeaShell() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_SeaShell()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Sienna() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Sienna()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Silver() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Silver()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_SkyBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_SkyBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_SlateBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_SlateBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_SlateGray() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_SlateGray()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Snow() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Snow()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_SpringGreen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_SpringGreen()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_SteelBlue() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_SteelBlue()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Tan() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Tan()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Teal() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Teal()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Thistle() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Thistle()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Tomato() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Tomato()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Transparent() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Transparent()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Turquoise() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Turquoise()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Violet() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Violet()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Wheat() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Wheat()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_White() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_White()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_WhiteSmoke() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_WhiteSmoke()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_Yellow() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_Yellow()
    }

    /**
     * 
     * @returns {Color} 
     */
    static get_YellowGreen() {
        if (!Colors.HasProp("__IColorsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Colors")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorsStatics.IID)
            Colors.__IColorsStatics := IColorsStatics(factoryPtr)
        }

        return Colors.__IColorsStatics.get_YellowGreen()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
