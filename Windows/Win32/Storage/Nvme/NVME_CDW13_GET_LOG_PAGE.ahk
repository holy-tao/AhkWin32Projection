#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw13_get_log_page
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW13_GET_LOG_PAGE {
    #StructPack 4

    /**
     * Log Page Offset Upper: This field specifies the upper 32 bits of the log page offset.
     */
    LPOU : UInt32

    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
