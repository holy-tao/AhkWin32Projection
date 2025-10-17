#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_CDW12_DIRECTIVE_SEND_IDENTIFY_ENABLE_DIRECTIVE.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW12_DIRECTIVE_SEND extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
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
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
