#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_CDW13_FEATURE_HOST_MEMORY_BUFFER.ahk

/**
 * Contains parameters for the Set Features command that sets the attributes of the specified feature.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw13_features
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW13_FEATURES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies an [NVME_CDW13_FEATURE_HOST_MEMORY_BUFFER](ns-nvme-nvme_cdw13_feature_host_memory_buffer.md) structure containing a value that specifies the lower 32 bits of the physical location of the Host Memory Descriptor List.
     * @type {NVME_CDW13_FEATURE_HOST_MEMORY_BUFFER}
     */
    HostMemoryBuffer{
        get {
            if(!this.HasProp("__HostMemoryBuffer"))
                this.__HostMemoryBuffer := NVME_CDW13_FEATURE_HOST_MEMORY_BUFFER(0, this)
            return this.__HostMemoryBuffer
        }
    }

    /**
     * 
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
