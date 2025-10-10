#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEAGENTGROUPLIST structure describes a list of ACD agent groups. This structure can contain an array of LINEAGENTGROUPENTRY structures.
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-lineagentgrouplist
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEAGENTGROUPLIST extends Win32Struct
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
     * Size needed to hold all the information requested, in bytes.
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
     * Number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgroupentry">LINEAGENTGROUPENTRY</a> structures that appear in the <i>List</i> array. The value is 0 if no agent is to be logged in on the address.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the group list array, in bytes.
     * @type {Integer}
     */
    dwListSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset from the beginning of this structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgroupentry">LINEAGENTGROUPENTRY</a> structures that specify information about each group into which the current agent is to be logged in at the address. This is <b>dwNumEntries</b> times SIZEOF(LINEAGENTGROUPENTRY). The size of the field is specified by <b>dwListSize</b>.
     * @type {Integer}
     */
    dwListOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
