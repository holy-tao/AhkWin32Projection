#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEAGENTSESSIONLIST structure describes a list of ACD agent sessions. This structure can contain an array of LINEAGENTSESSIONENTRY structures. The lineGetAgentSessionList function returns the LINEAGENTSESSIONLIST structure.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentsessionlist
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEAGENTSESSIONLIST {
    #StructPack 4

    /**
     * Total size allocated to this structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size needed to hold all the information requested, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * Number of 
     * [LINEAGENTSESSIONENTRY](./ns-tapi-lineagentsessionentry.md) structures that appear in the list array. The value is zero if no agent sessions have been created.
     */
    dwNumEntries : UInt32

    /**
     * Size of the agent session list array, in bytes.
     */
    dwListSize : UInt32

    /**
     * Offset from the beginning of this structure to an array of 
     * [LINEAGENTSESSIONENTRY](./ns-tapi-lineagentsessionentry.md) structures that specify information about agents. The <b>dwListOffset</b> member is <b>dwNumEntries</b> times SIZEOF(LINEAGENTSESSIONENTRY). The size of the field is specified by <b>dwListSize</b>.
     */
    dwListOffset : UInt32

}
