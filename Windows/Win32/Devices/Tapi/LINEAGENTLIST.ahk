#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEAGENTLIST structure describes a list of ACD agents. This structure can contain an array of LINEAGENTENTRY structures.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentlist
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEAGENTLIST {
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagententry">LINEAGENTENTRY</a> structures that appear in the list array. The value is zero if no agents are available.
     */
    dwNumEntries : UInt32

    /**
     * Size of the agent list array, in bytes.
     */
    dwListSize : UInt32

    /**
     * Offset from the beginning of the structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagententry">LINEAGENTENTRY</a> structures that specify information about agents. The <b>dwListOffset</b> member is <b>dwNumEntries</b> times SIZEOF(LINEAGENTENTRY). The size of the field is specified by <b>dwListSize</b>.
     */
    dwListOffset : UInt32

}
