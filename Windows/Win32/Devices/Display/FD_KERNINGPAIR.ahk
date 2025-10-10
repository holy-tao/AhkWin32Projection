#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FD_KERNINGPAIR structure is used to store information about kerning pairs.
 * @remarks
 * 
  * An array of FD_KERNINGPAIR structures must be null-terminated, which means the last FD_KERNINGPAIR structure in the array has all structure members set to zero. An array of FD_KERNINGPAIR structures must be sorted in increasing order according to an unsigned 32-bit key, calculated as follows:
  * 
  * 
  * ```
  *     wcFirst + 65536 * wcSecond.
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-fd_kerningpair
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FD_KERNINGPAIR extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * Specifies the code point of the first character in the kerning pair.
     * @type {Integer}
     */
    wcFirst {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies the code point of the second character in the kerning pair.
     * @type {Integer}
     */
    wcSecond {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Specifies the kerning value, in font (notional) units, for the kerning pair. If this value is greater than zero, the characters will be moved apart; otherwise, the characters will be moved together. For information about the FWORD data type, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     * @type {Integer}
     */
    fwdKern {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }
}
