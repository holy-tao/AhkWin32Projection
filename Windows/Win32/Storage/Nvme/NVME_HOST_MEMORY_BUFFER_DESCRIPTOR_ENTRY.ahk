#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the parameters of a single entry in the Host Memory Descriptor List.
 * @remarks
 * For a description of the fields and structures that define the Host Memory Descriptor List, see [NVME_CDW11_FEATURES](ns-nvme-nvme_cdw11_features.md#host-memory-buffer).
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_host_memory_buffer_descriptor_entry
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_HOST_MEMORY_BUFFER_DESCRIPTOR_ENTRY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Indicates the host memory address for this entry aligned to the memory page size. the memory page size is defined in the **MPS** field of the [NVME_CONTROLLER_CONFIGURATION](s-nvme-nvme_controller_configuration.md)].
     * 
     * The lower bits (n:0) of this field indicate that the offset within the memory page is `0h`. For example, if the memory page size is 4KB, then bits 11:00 will be zero; if the memory page size is 8KB, then bits 12:00 will be zero.
     * @type {Integer}
     */
    BADD {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates the number of contiguous memory page size **MPS** units for this entry.
     * @type {Integer}
     */
    BSIZE {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
