#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FIXED structure contains the integral and fractional parts of a fixed-point real number.
 * @remarks
 * The <b>FIXED</b> structure is used to describe the elements of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-mat2">MAT2</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-fixed
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct FIXED {
    #StructPack 2

    /**
     * The fractional part of the number.
     */
    fract : UInt16

    /**
     * The integer part of the number.
     */
    value : Int16

}
