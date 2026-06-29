#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a parameter for the Host Memory Buffer Feature that specifies the upper 32 bits of the physical location of the Host Memory Descriptor List.
 * @remarks
 * For a description of the fields and structures that define the Host Memory Descriptor List, see [NVME_CDW11_FEATURES](ns-nvme-nvme_cdw11_features.md#host-memory-buffer).
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw14_feature_host_memory_buffer
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW14_FEATURE_HOST_MEMORY_BUFFER {
    #StructPack 4

    HMDLUA : UInt32

    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
