#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DMA_DOMAIN_CREATION_FLAGS {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - Reserved
     */
    _bitfield : Int64

    static __New() {
        DefineProp(this.Prototype, 'AsUlonglong', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
