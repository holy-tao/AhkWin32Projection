#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct NPEM_CONTROL_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : IntPtr

    InterfaceDereference : IntPtr

    SetNpemSupportState : IntPtr

    QueryStandardCapabilities : IntPtr

    SetStandardControl : IntPtr

    QueryNpemControl : IntPtr

}
