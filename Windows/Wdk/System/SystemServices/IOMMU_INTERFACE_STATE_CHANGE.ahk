#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_INTERFACE_STATE_CHANGE {
    #StructPack 8

    PresentFields : IntPtr

    AvailableDomainTypes : UInt32

}
