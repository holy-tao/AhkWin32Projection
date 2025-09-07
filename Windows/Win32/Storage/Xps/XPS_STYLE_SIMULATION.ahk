#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the simulation style of a font or glyph.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_style_simulation
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_STYLE_SIMULATION{

    /**
     * No font style simulation.
     * @type {Integer (Int32)}
     */
    static XPS_STYLE_SIMULATION_NONE => 1

    /**
     * Italic style simulation.
     * @type {Integer (Int32)}
     */
    static XPS_STYLE_SIMULATION_ITALIC => 2

    /**
     * Bold style simulation.
     * @type {Integer (Int32)}
     */
    static XPS_STYLE_SIMULATION_BOLD => 3

    /**
     * Both bold and italic style simulation: first bold, then italic.
     * @type {Integer (Int32)}
     */
    static XPS_STYLE_SIMULATION_BOLDITALIC => 4
}
