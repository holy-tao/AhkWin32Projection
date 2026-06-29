#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEQUEUELIST structure describes a list of queues. This structure can contain an array of LINEQUEUEENTRY structures. The lineGetQueueList function returns the LINEQUEUELIST structure. LINEQUEUELIST requires TAPI 3.0 version negotiation.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linequeuelist
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEQUEUELIST {
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linequeueentry">LINEQUEUEENTRY</a> structures that appear in the list array. The value is zero if no queue is available.
     */
    dwNumEntries : UInt32

    /**
     * Size of the agent information array, in bytes.
     */
    dwListSize : UInt32

    /**
     * Offset from the beginning of the structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linequeueentry">LINEQUEUEENTRY</a> structure that specify information about agents. The <b>dwListOffset</b> member is <b>dwNumEntries</b> times SIZEOF(LINEQUEUEENTRY). The size of the field is specified by <b>dwListSize</b>.
     */
    dwListOffset : UInt32

}
