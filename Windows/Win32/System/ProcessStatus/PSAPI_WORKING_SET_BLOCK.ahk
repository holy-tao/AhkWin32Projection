#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains working set information for a page.
 * @see https://learn.microsoft.com/windows/win32/api/psapi/ns-psapi-psapi_working_set_block
 * @namespace Windows.Win32.System.ProcessStatus
 */
export default struct PSAPI_WORKING_SET_BLOCK {
    #StructPack 8

    /**
     * The working set information. See the description of the structure  members for information about the layout of this variable.
     */
    Flags : IntPtr


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
    VirtualPage {
        get => (this._bitfield >> 12) & 0xFFFFF
        set => this._bitfield := ((value & 0xFFFFF) << 12) | (this._bitfield & ~(0xFFFFF << 12))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
