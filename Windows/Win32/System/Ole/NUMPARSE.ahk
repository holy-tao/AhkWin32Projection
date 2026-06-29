#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NUMPARSE_FLAGS.ahk" { NUMPARSE_FLAGS }

/**
 * Specifies numeric parsing information.
 * @remarks
 * The following apply only to decimal numbers:
 * 
 * <ul>
 * <li><b>nPwr10</b> sets the decimal point position by giving the power of 10 of the least significant digit.</li>
 * <li>If the number is negative, <b>NUMPRS_NEG</b> will be set in <b>dwOutFlags</b>.</li>
 * <li>If there are more non-zero decimal digits than will fit into the digit array, the NUMPRS_INEXACT flag will be set.
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/ns-oleauto-numparse
 * @namespace Windows.Win32.System.Ole
 */
export default struct NUMPARSE {
    #StructPack 4

    /**
     * On input, the size of the array. On output, the number of items written to the rgbDig array.
     */
    cDig : Int32

    /**
     * Input flags.
     */
    dwInFlags : NUMPARSE_FLAGS

    /**
     * Output flags. Includes all the values for <b>dwInFlags</b>, plus the following values.
     */
    dwOutFlags : NUMPARSE_FLAGS

    /**
     * Receives the number of characters (from the beginning of the string) that were successfully parsed.
     */
    cchUsed : Int32

    /**
     * The number of bits per digit (3 or 4 for octal and hexadecimal numbers, and zero for decimal).
     */
    nBaseShift : Int32

    /**
     * The decimal point position.
     */
    nPwr10 : Int32

}
