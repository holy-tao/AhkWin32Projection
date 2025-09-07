#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_CONTEXT_ATTRIBUTES.ahk

/**
 * Contains parameters that define a collection of contiguous logical blocks specified by a starting LBA and number of logical blocks.
 * @remarks
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
     * A [NVME_CONTEXT_ATTRIBUTES](ns-nvme-nvme_context_attributes.md) structure that specifies context attributes for the logical block range.
     * 
     * The use of this information is optional and the controller is not required to perform any specific action.
     * @type {NVME_CONTEXT_ATTRIBUTES}
     */
    Attributes{
        get {
            if(!this.HasProp("__Attributes"))
                this.__Attributes := NVME_CONTEXT_ATTRIBUTES(this.ptr + 0)
            return this.__Attributes
        }
    }

    /**
     * Specifies the length of the LBA range in logical blocks.
     * @type {Integer}
     */
    LogicalBlockCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the starting logical block in the range.
     * @type {Integer}
     */
    StartingLBA {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
