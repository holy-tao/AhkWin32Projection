#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_COMMAND_STATUS.ahk

/**
 * Specifies an entry in the Completion Queue that is 16 bytes in size.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_completion_entry
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_COMPLETION_ENTRY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The contents of Dword 0 contain command specific information.
     * 
     * If a command uses Dword 0, then the definition of this Dword is contained within the associated command definition. If a command does not use Dword 0, then this field is reserved.
     * @type {Integer}
     */
    DW0 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DW1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    SQHD {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SQID {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    CID {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {NVME_COMMAND_STATUS}
     */
    Status{
        get {
            if(!this.HasProp("__Status"))
                this.__Status := NVME_COMMAND_STATUS(this.ptr + 20)
            return this.__Status
        }
    }
}
