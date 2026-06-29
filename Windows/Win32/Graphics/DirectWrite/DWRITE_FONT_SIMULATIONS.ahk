#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies algorithmic style simulations to be applied to the font face. Bold and oblique simulations can be combined via bitwise OR operation.
 * @remarks
 * Style simulations are not recommended for good typographic quality.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_FONT_SIMULATIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that no simulations are applied to the font face.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_SIMULATIONS_NONE => 0

    /**
     * Indicates that algorithmic emboldening is applied to the font face.  <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations">DWRITE_FONT_SIMULATIONS_BOLD</a> increases weight by applying a widening algorithm to the glyph outline. This may  be used to simulate a bold weight where no designed bold weight is available.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_SIMULATIONS_BOLD => 1

    /**
     * Indicates that algorithmic italicization is applied to the font face. <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations">DWRITE_FONT_SIMULATIONS_OBLIQUE</a> applies obliquing (shear) to the glyph outline. This may be used to simulate an oblique/italic style where no designed oblique/italic style is available.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_SIMULATIONS_OBLIQUE => 2
}
