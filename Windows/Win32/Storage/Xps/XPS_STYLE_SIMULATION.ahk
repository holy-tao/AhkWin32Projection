#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the simulation style of a font or glyph.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_style_simulation
 * @namespace Windows.Win32.Storage.Xps
 */
class XPS_STYLE_SIMULATION extends Win32Enum {

    /**
     * No font style simulation.
     * Native name: XPS_STYLE_SIMULATION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 1

    /**
     * Italic style simulation.
     * Native name: XPS_STYLE_SIMULATION_ITALIC
     * @type {Integer (Int32)}
     */
    static ITALIC => 2

    /**
     * Bold style simulation.
     * Native name: XPS_STYLE_SIMULATION_BOLD
     * @type {Integer (Int32)}
     */
    static BOLD => 3

    /**
     * Both bold and italic style simulation: first bold, then italic.
     * Native name: XPS_STYLE_SIMULATION_BOLDITALIC
     * @type {Integer (Int32)}
     */
    static BOLDITALIC => 4
}
