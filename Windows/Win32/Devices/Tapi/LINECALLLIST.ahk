#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINECALLLIST structure describes a list of call handles. A structure of this type is returned by the lineGetNewCalls and lineGetConfRelatedCalls functions.
 * @remarks
 * This structure may not be extended.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linecalllist
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINECALLLIST {
    #StructPack 4

    /**
     * Total size allocated to this data structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * Number of handles in the <i>hCalls</i> array.
     */
    dwCallsNumEntries : UInt32

    /**
     * Size of the array of call handles, in bytes.
     */
    dwCallsSize : UInt32

    /**
     * Offset from the beginning of the structure to the variably sized array of <b>HCALL</b> handles. The size of the array is specified by <b>dwCallsSize</b>.
     */
    dwCallsOffset : UInt32

}
