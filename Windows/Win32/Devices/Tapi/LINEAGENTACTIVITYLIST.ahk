#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEAGENTACTIVITYLIST structure describes a list of ACD agent activities. This structure can contain an array of LINEAGENTACTIVITYENTRY structures. The lineGetAgentActivityList function returns the LINEAGENTACTIVITYLIST structure.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentactivitylist
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEAGENTACTIVITYLIST {
    #StructPack 4

    /**
     * Total size allocated to this data structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size needed to hold all the information requested, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * Number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentactivityentry">LINEAGENTACTIVITYENTRY</a> structures that appear in the <i>List</i> array. The value is 0 if no agent activity codes are available.
     */
    dwNumEntries : UInt32

    /**
     * Size of the activity list array, in bytes.
     */
    dwListSize : UInt32

    /**
     * Offset from the beginning of the structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentactivityentry">LINEAGENTACTIVITYENTRY</a> structures indicating information about activity that could be specified for the current logged-in agent. This is <b>dwNumEntries</b> times SIZEOF(LINEAGENTACTIVITYENTRY). The size of the array is specified by <b>dwListSize</b>.
     */
    dwListOffset : UInt32

}
