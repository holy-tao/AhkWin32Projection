#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FD_KERNINGPAIR structure is used to store information about kerning pairs.
 * @remarks
 * An array of FD_KERNINGPAIR structures must be null-terminated, which means the last FD_KERNINGPAIR structure in the array has all structure members set to zero. An array of FD_KERNINGPAIR structures must be sorted in increasing order according to an unsigned 32-bit key, calculated as follows:
 * 
 * 
 * ```
 *     wcFirst + 65536 * wcSecond.
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-fd_kerningpair
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FD_KERNINGPAIR {
    #StructPack 2

    /**
     * Specifies the code point of the first character in the kerning pair.
     */
    wcFirst : Int8

    /**
     * Specifies the code point of the second character in the kerning pair.
     */
    wcSecond : Int8

    /**
     * Specifies the kerning value, in font (notional) units, for the kerning pair. If this value is greater than zero, the characters will be moved apart; otherwise, the characters will be moved together. For information about the FWORD data type, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     */
    fwdKern : Int16

}
