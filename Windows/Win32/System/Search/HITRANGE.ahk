#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies the range of matching data when query search conditions match indexed data.
 * @remarks
 * The <b>HITRANGE</b> structure is useful for identifying where a search term matches the content from returned results, and for hit highlighting in user interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/ns-structuredquery-hitrange
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class HITRANGE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>ULONG</b>
     * 
     * The beginning of the hit range.
     * @type {Integer}
     */
    iPosition {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The length of the hit range.
     * @type {Integer}
     */
    cLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
