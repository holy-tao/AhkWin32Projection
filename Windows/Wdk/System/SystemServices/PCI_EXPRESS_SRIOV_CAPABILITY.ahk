#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_SRIOV_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    SRIOVCapabilities : IntPtr

    SRIOVControl : IntPtr

    SRIOVStatus : IntPtr

    InitialVFs : UInt16

    TotalVFs : UInt16

    NumVFs : UInt16

    FunctionDependencyLink : Int8

    RsvdP1 : Int8

    FirstVFOffset : UInt16

    VFStride : UInt16

    RsvdP2 : UInt16

    VFDeviceId : UInt16

    SupportedPageSizes : UInt32

    SystemPageSize : UInt32

    BaseAddresses : UInt32[6]

    VFMigrationStateArrayOffset : IntPtr

}
