#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_INTERFACE_STATE_CHANGE_FIELDS {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - AvailableDomainTypes
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    AvailableDomainTypes {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONG', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
