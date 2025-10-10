#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies numeric parsing information.
 * @remarks
 * 
  * The following apply only to decimal numbers:
  * 
  * <ul>
  * <li><b>nPwr10</b> sets the decimal point position by giving the power of 10 of the least significant digit.</li>
  * <li>If the number is negative, <b>NUMPRS_NEG</b> will be set in <b>dwOutFlags</b>.</li>
  * <li>If there are more non-zero decimal digits than will fit into the digit array, the NUMPRS_INEXACT flag will be set.
  * </li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oleauto/ns-oleauto-numparse
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class NUMPARSE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * On input, the size of the array. On output, the number of items written to the rgbDig array.
     * @type {Integer}
     */
    cDig {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Input flags.
     * @type {Integer}
     */
    dwInFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Output flags. Includes all the values for <b>dwInFlags</b>, plus the following values.
     * @type {Integer}
     */
    dwOutFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Receives the number of characters (from the beginning of the string) that were successfully parsed.
     * @type {Integer}
     */
    cchUsed {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The number of bits per digit (3 or 4 for octal and hexadecimal numbers, and zero for decimal).
     * @type {Integer}
     */
    nBaseShift {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The decimal point position.
     * @type {Integer}
     */
    nPwr10 {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
