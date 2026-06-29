#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a parameter for the Host Memory Buffer Feature that specifies the size of the host memory buffer.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw12_feature_host_memory_buffer
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW12_FEATURE_HOST_MEMORY_BUFFER {
    #StructPack 4

    HSIZE : UInt32

    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
