#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_CDW14_FEATURE_HOST_MEMORY_BUFFER.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW14_FEATURES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {NVME_CDW14_FEATURE_HOST_MEMORY_BUFFER}
     */
    HostMemoryBuffer{
        get {
            if(!this.HasProp("__HostMemoryBuffer"))
                this.__HostMemoryBuffer := NVME_CDW14_FEATURE_HOST_MEMORY_BUFFER(0, this)
            return this.__HostMemoryBuffer
        }
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
