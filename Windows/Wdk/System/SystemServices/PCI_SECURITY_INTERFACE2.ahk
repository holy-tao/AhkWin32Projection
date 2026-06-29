#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_SECURITY_INTERFACE2 {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : IntPtr

    InterfaceDereference : IntPtr

    Flags : UInt32

    SupportedScenarios : UInt32

    SetAccessControlServices : IntPtr

}
