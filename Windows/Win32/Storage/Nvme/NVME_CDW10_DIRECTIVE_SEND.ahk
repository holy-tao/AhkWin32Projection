#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Directive Send command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_directive_send
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_DIRECTIVE_SEND {
    #StructPack 4

    /**
     * Indicates the number of Dwords.
     */
    NUMD : UInt32

}
