#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_CDW14_FEATURE_HOST_MEMORY_BUFFER.ahk" { NVME_CDW14_FEATURE_HOST_MEMORY_BUFFER }

/**
 * The NVME_CDW14_FEATURES structure contains parameters for the Set Features command that sets the attributes of the specified feature.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw14_features
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW14_FEATURES {
    #StructPack 4

    /**
     * Specifies an [NVME_CDW14_FEATURE_HOST_MEMORY_BUFFER](ns-nvme-nvme_cdw14_feature_host_memory_buffer.md) structure containing a value that specifies the upper 32 bits of the physical location of the Host Memory Descriptor List.
     */
    HostMemoryBuffer : NVME_CDW14_FEATURE_HOST_MEMORY_BUFFER

    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
