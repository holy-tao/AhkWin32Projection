#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a parameter for the Host Memory Buffer Feature that specifies the lower 32 bits of the physical location of the Host Memory Descriptor List.
 * @remarks
 * For a description of the fields and structures that define the Host Memory Descriptor List, see [NVME_CDW11_FEATURES](ns-nvme-nvme_cdw11_features.md#host-memory-buffer).
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw13_feature_host_memory_buffer
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW13_FEATURE_HOST_MEMORY_BUFFER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
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
