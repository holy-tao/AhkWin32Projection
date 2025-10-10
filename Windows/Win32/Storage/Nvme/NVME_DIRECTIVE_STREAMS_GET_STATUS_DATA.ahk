#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DIRECTIVE_STREAMS_GET_STATUS_DATA extends Win32Struct
{
    static sizeof => 131072

    static packingSize => 2

    /**
     * @type {Integer}
     */
    OpenStreamCount {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<UInt16>}
     */
    StreamIdentifiers{
        get {
            if(!this.HasProp("__StreamIdentifiersProxyArray"))
                this.__StreamIdentifiersProxyArray := Win32FixedArray(this.ptr + 2, 65535, Primitive, "ushort")
            return this.__StreamIdentifiersProxyArray
        }
    }
}
