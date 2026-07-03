#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DMA_IOMMU_INTERFACE {
    #StructPack 8

    Version : UInt32

    CreateDomain : IntPtr

    DeleteDomain : IntPtr

    AttachDevice : IntPtr

    DetachDevice : IntPtr

    FlushDomain : IntPtr

    FlushDomainByVaList : IntPtr

    QueryInputMappings : IntPtr

    MapLogicalRange : IntPtr

    UnmapLogicalRange : IntPtr

    MapIdentityRange : IntPtr

    UnmapIdentityRange : IntPtr

    SetDeviceFaultReporting : IntPtr

    ConfigureDomain : IntPtr

}
