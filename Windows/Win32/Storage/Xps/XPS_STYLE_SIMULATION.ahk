#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the simulation style of a font or glyph.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_style_simulation
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_STYLE_SIMULATION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
