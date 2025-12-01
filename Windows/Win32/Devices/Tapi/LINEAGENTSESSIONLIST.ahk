#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEAGENTSESSIONLIST structure describes a list of ACD agent sessions. This structure can contain an array of LINEAGENTSESSIONENTRY structures. The lineGetAgentSessionList function returns the LINEAGENTSESSIONLIST structure.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentsessionlist
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEAGENTSESSIONLIST extends Win32Struct
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
     * [LINEAGENTSESSIONENTRY](./ns-tapi-lineagentsessionentry.md) structures that appear in the list array. The value is zero if no agent sessions have been created.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the agent session list array, in bytes.
     * @type {Integer}
     */
    dwListSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset from the beginning of this structure to an array of 
     * [LINEAGENTSESSIONENTRY](./ns-tapi-lineagentsessionentry.md) structures that specify information about agents. The <b>dwListOffset</b> member is <b>dwNumEntries</b> times SIZEOF(LINEAGENTSESSIONENTRY). The size of the field is specified by <b>dwListSize</b>.
     * @type {Integer}
     */
    dwListOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
