#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FONTSIM structure contains offsets to one or more FONTDIFF structures describing bold, italic, and bold italic font simulations.
 * @remarks
 * If the <b>dpFontSim</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-ifimetrics">IFIMETRICS</a> structure is nonzero, it holds the offset from the beginning of that structure to the beginning of a FONTSIM structure.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-fontsim
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FONTSIM {
    #StructPack 4

    /**
     * If nonzero, specifies the offset from the beginning of this structure to the FONTDIFF structure describing the bold simulation. If this member is zero, the font does not support bold simulation.
     */
    dpBold : Int32

    /**
     * If nonzero, specifies the offset from the beginning of this structure to the FONTDIFF structure describing the italic simulation. If this member is zero, the font does not support italic simulation.
     */
    dpItalic : Int32

    /**
     * If nonzero, specifies the offset from the beginning of this structure to the FONTDIFF structure describing the bold italic simulation. If this member is zero, the font does not support bold italic simulation.
     */
    dpBoldItalic : Int32

}
