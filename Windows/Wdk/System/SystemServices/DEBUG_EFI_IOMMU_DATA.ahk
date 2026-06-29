#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEBUG_EFI_IOMMU_DATA {
    #StructPack 8

    PciIoProtocolHandle : IntPtr

    Mapping : IntPtr

}
