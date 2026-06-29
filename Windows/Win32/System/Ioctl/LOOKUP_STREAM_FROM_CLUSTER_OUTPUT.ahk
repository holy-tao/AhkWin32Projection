#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Received as output from the FSCTL_LOOKUP_STREAM_FROM_CLUSTER control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-lookup_stream_from_cluster_output
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct LOOKUP_STREAM_FROM_CLUSTER_OUTPUT {
    #StructPack 4

    /**
     * Offset from the beginning of this structure to the first entry returned.  If no entries are returned, this value is zero.
     */
    Offset : UInt32

    /**
     * Number of matches to the input criteria.  Note that more matches may be found than entries returned if the buffer provided is not large enough.
     */
    NumberOfMatches : UInt32

    /**
     * Minimum size of the buffer, in bytes, which would be needed to contain all matching entries to the input criteria.
     */
    BufferSizeRequired : UInt32

}
