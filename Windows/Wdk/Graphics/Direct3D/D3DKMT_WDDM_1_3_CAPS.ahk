#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_WDDM_1_3_CAPS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - SupportMiracast
     * - IsHybridIntegratedGPU
     * - IsHybridDiscreteGPU
     * - SupportPowerManagementPStates
     * - SupportVirtualModes
     * - SupportCrossAdapterResource
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    SupportMiracast {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    IsHybridIntegratedGPU {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    IsHybridDiscreteGPU {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    SupportPowerManagementPStates {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    SupportVirtualModes {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    SupportCrossAdapterResource {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }
    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
