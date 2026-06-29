#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VARSTRING structure is used for returning variably sized strings. It is used both by the line device class and the phone device class.
 * @remarks
 * No extensibility.
 * 
 * If a string cannot be returned in a variable structure, the <b>dwStringSize</b> and <b>dwStringOffset</b> members are set in one of the following ways:
 * 
 * <ul>
 * <li><b>dwStringSize</b> and <b>dwStringOffset</b> members are both set to zero.</li>
 * <li><b>dwStringOffset</b> is nonzero and <b>dwStringSize</b> is zero.</li>
 * <li><b>dwStringOffset</b> is nonzero, <b>dwStringSize</b> is 1, and the byte at the given offset is zero.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-varstring
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct VARSTRING {
    #StructPack 4

    /**
     * Total size allocated to this data structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * Format of the string. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/stringformat--constants">STRINGFORMAT_ Constants</a>.
     */
    dwStringFormat : UInt32

    /**
     * Size of the string information, including the <b>null</b> terminator, in bytes.
     */
    dwStringSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized device field containing the string information. The size of the field is specified by <b>dwStringSize</b>.
     */
    dwStringOffset : UInt32

}
