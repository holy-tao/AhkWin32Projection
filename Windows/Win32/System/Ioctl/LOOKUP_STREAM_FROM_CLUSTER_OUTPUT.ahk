#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Received as output from the FSCTL_LOOKUP_STREAM_FROM_CLUSTER control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-lookup_stream_from_cluster_output
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class LOOKUP_STREAM_FROM_CLUSTER_OUTPUT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Offset from the beginning of this structure to the first entry returned.  If no entries are returned, this value is zero.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of matches to the input criteria.  Note that more matches may be found than entries returned if the buffer provided is not large enough.
     * @type {Integer}
     */
    NumberOfMatches {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Minimum size of the buffer, in bytes, which would be needed to contain all matching entries to the input criteria.
     * @type {Integer}
     */
    BufferSizeRequired {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
