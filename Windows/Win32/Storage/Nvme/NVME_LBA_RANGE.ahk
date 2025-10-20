#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_CONTEXT_ATTRIBUTES.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_lba_range
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_LBA_RANGE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {NVME_CONTEXT_ATTRIBUTES}
     */
    Attributes{
        get {
            if(!this.HasProp("__Attributes"))
                this.__Attributes := NVME_CONTEXT_ATTRIBUTES(0, this)
            return this.__Attributes
        }
    }

    /**
     * @type {Integer}
     */
    LogicalBlockCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    StartingLBA {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
