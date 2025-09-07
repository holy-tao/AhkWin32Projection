#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_IDENTIFY_IO_COMMAND_SET extends Win32Struct
{
    static sizeof => 4096

    static packingSize => 8

    /**
     * @type {Array<UInt64>}
     */
    IOCommandSetVector{
        get {
            if(!this.HasProp("__IOCommandSetVectorProxyArray"))
                this.__IOCommandSetVectorProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "uint")
            return this.__IOCommandSetVectorProxyArray
        }
    }
}
