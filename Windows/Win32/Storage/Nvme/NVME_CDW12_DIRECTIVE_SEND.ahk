#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE.ahk" { NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE }

/**
 * Contains a parameter for enabling a directive for the Directive Send command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw12_directive_send
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW12_DIRECTIVE_SEND {
    #StructPack 4

    /**
     * A [NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE](ns-nvme-nvme_cdw12_directive_send_identify_enable_directive.md) structure that specifies the directive type and whether it is enabled.
     */
    EnableDirective : NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE

    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
