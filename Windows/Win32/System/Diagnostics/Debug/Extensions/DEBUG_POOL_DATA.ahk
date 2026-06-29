#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_POOL_DATA {
    #StructPack 8

    SizeofStruct : UInt32

    PoolBlock : Int64

    Pool : Int64

    PreviousSize : UInt32

    Size : UInt32

    PoolTag : UInt32

    ProcessBilled : Int64

    /**
     * This bitfield backs the following members:
     * - Free
     * - LargePool
     * - SpecialPool
     * - Pageable
     * - Protected
     * - Allocated
     * - Session
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Free {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    LargePool {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    SpecialPool {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    Pageable {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Protected {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    Allocated {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    Session {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }
    Reserved2 : Int64[4]

    PoolTagDescription : CHAR[64]

    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 48 })
        this.DeleteProp("__New")
    }
}
