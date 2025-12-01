#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters for the Directive Receive command.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_directive_receive
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW10_DIRECTIVE_RECEIVE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Indicates the number of Dwords.
     * @type {Integer}
     */
    NUMD {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
