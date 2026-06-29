#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw12_get_log_page
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW12_GET_LOG_PAGE {
    #StructPack 4

    /**
     * Log Page Offset Lower: The log page offset specifies the location within a log page to start returning data from. This field specifies the lower 32 bits of the log page offset. The offset shall be dword aligned, indicated by bits 1:0 being cleared to 00b.
     */
    LPOL : UInt32

    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
