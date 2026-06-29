#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the parameters of a single entry in the Host Memory Descriptor List.
 * @remarks
 * For a description of the fields and structures that define the Host Memory Descriptor List, see [NVME_CDW11_FEATURES](ns-nvme-nvme_cdw11_features.md#host-memory-buffer).
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_host_memory_buffer_descriptor_entry
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_HOST_MEMORY_BUFFER_DESCRIPTOR_ENTRY {
    #StructPack 8

    /**
     * Indicates the host memory address for this entry aligned to the memory page size. the memory page size is defined in the **MPS** field of the [NVME_CONTROLLER_CONFIGURATION](s-nvme-nvme_controller_configuration.md)].
     * 
     * The lower bits (n:0) of this field indicate that the offset within the memory page is `0h`. For example, if the memory page size is 4KB, then bits 11:00 will be zero; if the memory page size is 8KB, then bits 12:00 will be zero.
     */
    BADD : Int64

    /**
     * Indicates the number of contiguous memory page size **MPS** units for this entry.
     */
    BSIZE : UInt32

    Reserved : UInt32

}
