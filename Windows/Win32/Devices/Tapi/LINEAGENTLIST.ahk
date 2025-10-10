#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEAGENTLIST structure describes a list of ACD agents. This structure can contain an array of LINEAGENTENTRY structures.
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-lineagentlist
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEAGENTLIST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Total size allocated to this structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size needed to hold all the information requested, in bytes.
     * @type {Integer}
     */
    dwNeededSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the portion of this structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagententry">LINEAGENTENTRY</a> structures that appear in the list array. The value is zero if no agents are available.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the agent list array, in bytes.
     * @type {Integer}
     */
    dwListSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset from the beginning of the structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagententry">LINEAGENTENTRY</a> structures that specify information about agents. The <b>dwListOffset</b> member is <b>dwNumEntries</b> times SIZEOF(LINEAGENTENTRY). The size of the field is specified by <b>dwListSize</b>.
     * @type {Integer}
     */
    dwListOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
