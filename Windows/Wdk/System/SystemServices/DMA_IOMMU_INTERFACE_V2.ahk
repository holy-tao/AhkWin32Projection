#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DMA_IOMMU_INTERFACE_V2 {
    #StructPack 8

    CreateDomainEx : IntPtr

    DeleteDomain : IntPtr

    AttachDeviceEx : IntPtr

    DetachDeviceEx : IntPtr

    FlushDomain : IntPtr

    FlushDomainByVaList : IntPtr

    QueryInputMappings : IntPtr

    MapLogicalRangeEx : IntPtr

    UnmapLogicalRange : IntPtr

    MapIdentityRangeEx : IntPtr

    UnmapIdentityRangeEx : IntPtr

    SetDeviceFaultReportingEx : IntPtr

    ConfigureDomain : IntPtr

    QueryAvailableDomainTypes : IntPtr

    RegisterInterfaceStateChangeCallback : IntPtr

    UnregisterInterfaceStateChangeCallback : IntPtr

    ReserveLogicalAddressRange : IntPtr

    FreeReservedLogicalAddressRange : IntPtr

    MapReservedLogicalRange : IntPtr

    UnmapReservedLogicalRange : IntPtr

    CreateDevice : IntPtr

    DeleteDevice : IntPtr

}
