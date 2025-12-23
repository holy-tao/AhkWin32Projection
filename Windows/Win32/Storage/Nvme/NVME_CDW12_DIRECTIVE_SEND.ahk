#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE.ahk

/**
 * Contains a parameter for enabling a directive for the Directive Send command.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw12_directive_send
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW12_DIRECTIVE_SEND extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * A [NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE](ns-nvme-nvme_cdw12_directive_send_identify_enable_directive.md) structure that specifies the directive type and whether it is enabled.
     * @type {NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE}
     */
    EnableDirective{
        get {
            if(!this.HasProp("__EnableDirective"))
                this.__EnableDirective := NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE(0, this)
            return this.__EnableDirective
        }
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
