#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IO_COMMAND_SET_VECTOR.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_IDENTIFY_IO_COMMAND_SET extends Win32Struct
{
    static sizeof => 4096

    static packingSize => 8

    /**
     * @type {Array<IO_COMMAND_SET_VECTOR>}
     */
    IOCommandSetVector{
        get {
            if(!this.HasProp("__IOCommandSetVectorProxyArray"))
                this.__IOCommandSetVectorProxyArray := Win32FixedArray(this.ptr + 0, 512, IO_COMMAND_SET_VECTOR, "")
            return this.__IOCommandSetVectorProxyArray
        }
    }
}
