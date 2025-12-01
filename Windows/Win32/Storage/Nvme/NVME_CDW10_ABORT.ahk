#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters for the Abort command that is used to abort a specific command previously submitted to the Admin Submission Queue or an I/O Submission Queue.
 * @remarks
 * Host software may have multiple Abort commands outstanding, subject to the constraints of the Abort Command Limit indicated in the **ACL** field of the [Identify Controller data structure](ns-nvme-nvme_identify_controller_data.md).
 * 
 * An Abort command is a best effort command; the command to abort may have already completed, currently be in execution, or may be deeply queued. If or when a controller chooses to complete the command when the command to abort is not found, is implementation specific.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_abort
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW10_ABORT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - SQID
     * - CID
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SQID {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    CID {
        get => (this._bitfield >> 8) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 8) | (this._bitfield & ~(0xFFFF << 8))
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
