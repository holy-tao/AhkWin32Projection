#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains working set information for a page.
 * @see https://docs.microsoft.com/windows/win32/api//psapi/ns-psapi-psapi_working_set_block
 * @namespace Windows.Win32.System.ProcessStatus
 * @version v4.0.30319
 */
class PSAPI_WORKING_SET_BLOCK extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The working set information. See the description of the structure  members for information about the layout of this variable.
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - Protection
     * - ShareCount
     * - Shared
     * - Reserved
     * - VirtualPage
     * @type {Pointer}
     */
    _bitfield {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    Protection {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * @type {Pointer}
     */
    ShareCount {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }

    /**
     * @type {Pointer}
     */
    Shared {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Pointer}
     */
    Reserved {
        get => (this._bitfield >> 9) & 0x7
        set => this._bitfield := ((value & 0x7) << 9) | (this._bitfield & ~(0x7 << 9))
    }

    /**
     * @type {Pointer}
     */
    VirtualPage {
        get => (this._bitfield >> 12) & 0xFFFFF
        set => this._bitfield := ((value & 0xFFFFF) << 12) | (this._bitfield & ~(0xFFFFF << 12))
    }
}
