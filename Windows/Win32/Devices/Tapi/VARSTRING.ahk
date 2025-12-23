#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class VARSTRING extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Total size allocated to this data structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     * @type {Integer}
     */
    dwNeededSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Format of the string. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/stringformat--constants">STRINGFORMAT_ Constants</a>.
     * @type {Integer}
     */
    dwStringFormat {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the string information, including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwStringSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset from the beginning of the structure to the variably sized device field containing the string information. The size of the field is specified by <b>dwStringSize</b>.
     * @type {Integer}
     */
    dwStringOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
