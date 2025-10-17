#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains extended working set information for a page.
 * @see https://docs.microsoft.com/windows/win32/api//psapi/ns-psapi-psapi_working_set_ex_block
 * @namespace Windows.Win32.System.ProcessStatus
 * @version v4.0.30319
 */
class PSAPI_WORKING_SET_EX_BLOCK extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The working set information. See the description of the structure  members for information about the layout 
     *       of this variable.
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    class _Invalid extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - Valid
         * - Reserved0
         * - Shared
         * - Reserved1
         * - Bad
         * @type {Pointer}
         */
        _bitfield {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
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
     * This bitfield backs the following members:
     * - Valid
     * - ShareCount
     * - Win32Protection
     * - Shared
     * - Node
     * - Locked
     * - LargePage
     * - Reserved
     * - Bad
     * @type {Pointer}
     */
    _bitfield {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

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
    Reserved {
        get => (this._bitfield >> 24) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 24) | (this._bitfield & ~(0x7F << 24))
    }

    /**
     * @type {Pointer}
     */
    Bad {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }

    /**
     * @type {_Invalid}
     */
    Invalid{
        get {
            if(!this.HasProp("__Invalid"))
                this.__Invalid := %this.__Class%._Invalid(0, this)
            return this.__Invalid
        }
    }
}
