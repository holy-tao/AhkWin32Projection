#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DMA_IOMMU_INTERFACE_EX {
    #StructPack 8

    Size : IntPtr

    Version : UInt32

    V1 : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'V2', { type: IntPtr, offset: 16 })
        this.DeleteProp("__New")
    }
}
