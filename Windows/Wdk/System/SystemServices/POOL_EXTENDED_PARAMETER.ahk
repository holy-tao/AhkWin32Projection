#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EX_POOL_PRIORITY.ahk" { EX_POOL_PRIORITY }
#Import ".\POOL_EXTENDED_PARAMS_SECURE_POOL.ahk" { POOL_EXTENDED_PARAMS_SECURE_POOL }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct POOL_EXTENDED_PARAMETER {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - Type
     * - Optional
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    Type {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    Optional {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }
    Reserved2 : Int64

    static __New() {
        DefineProp(this.Prototype, 'Reserved3', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'Priority', { type: EX_POOL_PRIORITY, offset: 8 })
        DefineProp(this.Prototype, 'SecurePoolParams', { type: POOL_EXTENDED_PARAMS_SECURE_POOL.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'PreferredNode', { type: UInt32, offset: 8 })
        this.DeleteProp("__New")
    }
}
