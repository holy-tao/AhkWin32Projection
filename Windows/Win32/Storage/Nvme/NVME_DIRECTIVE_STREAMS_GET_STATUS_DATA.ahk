#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the identifiers of streams that are currently open.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_directive_streams_get_status_data
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DIRECTIVE_STREAMS_GET_STATUS_DATA extends Win32Struct
{
    static sizeof => 131072

    static packingSize => 2

    /**
     * The number of currently open streams.
     * @type {Integer}
     */
    OpenStreamCount {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * An array of stream IDs that indicate which streams are currently open.
     * 
     * The array is of size **NVME_STREAMS_GET_STATUS_MAX_IDS**.
     * @type {Array<UInt16>}
     */
    StreamIdentifiers{
        get {
            if(!this.HasProp("__StreamIdentifiersProxyArray"))
                this.__StreamIdentifiersProxyArray := Win32FixedArray(this.ptr + 2, 2, Primitive, "ushort")
            return this.__StreamIdentifiersProxyArray
        }
    }
}
