#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains extended working set information for a page.
 * @see https://learn.microsoft.com/windows/win32/api/psapi/ns-psapi-psapi_working_set_ex_block
 * @namespace Windows.Win32.System.ProcessStatus
 */
export default struct PSAPI_WORKING_SET_EX_BLOCK {
    #StructPack 8


    struct _Invalid {
        /**
         * This bitfield backs the following members:
         * - Valid
         * - Reserved0
         * - Shared
         * - Reserved1
         * - Bad
         */
        _bitfield : Int64


        /**
         * @type {Pointer}
         */
        Valid {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Pointer}
         */
        Reserved0 {
            get => (this._bitfield >> 1) & 0x3FFF
            set => this._bitfield := ((value & 0x3FFF) << 1) | (this._bitfield & ~(0x3FFF << 1))
        }

        /**
         * @type {Pointer}
         */
        Shared {
            get => (this._bitfield >> 15) & 0x1
            set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
        }

        /**
         * @type {Pointer}
         */
        Reserved1 {
            get => (this._bitfield >> 16) & 0x7FFF
            set => this._bitfield := ((value & 0x7FFF) << 16) | (this._bitfield & ~(0x7FFF << 16))
        }

        /**
         * @type {Pointer}
         */
        Bad {
            get => (this._bitfield >> 31) & 0x1
            set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
        }
    }

    /**
     * The working set information. See the description of the structure  members for information about the layout 
     *       of this variable.
     */
    Flags : IntPtr


    /**
     * @type {Pointer}
     */
    Valid {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Pointer}
     */
    ShareCount {
        get => (this._bitfield >> 1) & 0x7
        set => this._bitfield := ((value & 0x7) << 1) | (this._bitfield & ~(0x7 << 1))
    }

    /**
     * @type {Pointer}
     */
    Win32Protection {
        get => (this._bitfield >> 4) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 4) | (this._bitfield & ~(0x7FF << 4))
    }

    /**
     * @type {Pointer}
     */
    Shared {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Pointer}
     */
    Node {
        get => (this._bitfield >> 16) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 16) | (this._bitfield & ~(0x3F << 16))
    }

    /**
     * @type {Pointer}
     */
    Locked {
        get => (this._bitfield >> 22) & 0x1
        set => this._bitfield := ((value & 0x1) << 22) | (this._bitfield & ~(0x1 << 22))
    }

    /**
     * @type {Pointer}
     */
    LargePage {
        get => (this._bitfield >> 23) & 0x1
        set => this._bitfield := ((value & 0x1) << 23) | (this._bitfield & ~(0x1 << 23))
    }

    /**
     * @type {Pointer}
     */
    Bad {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int64, offset: 0 })
        DefineProp(this.Prototype, 'Invalid', { type: PSAPI_WORKING_SET_EX_BLOCK._Invalid, offset: 0 })
        this.DeleteProp("__New")
    }
}
