#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEAGENTGROUPLIST structure describes a list of ACD agent groups. This structure can contain an array of LINEAGENTGROUPENTRY structures.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineagentgrouplist
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEAGENTGROUPLIST {
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgroupentry">LINEAGENTGROUPENTRY</a> structures that appear in the <i>List</i> array. The value is 0 if no agent is to be logged in on the address.
     */
    dwNumEntries : UInt32

    /**
     * Size of the group list array, in bytes.
     */
    dwListSize : UInt32

    /**
     * Offset from the beginning of this structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineagentgroupentry">LINEAGENTGROUPENTRY</a> structures that specify information about each group into which the current agent is to be logged in at the address. This is <b>dwNumEntries</b> times SIZEOF(LINEAGENTGROUPENTRY). The size of the field is specified by <b>dwListSize</b>.
     */
    dwListOffset : UInt32

}
