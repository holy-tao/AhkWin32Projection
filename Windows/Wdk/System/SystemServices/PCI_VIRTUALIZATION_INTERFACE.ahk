#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_VIRTUALIZATION_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : IntPtr

    InterfaceDereference : IntPtr

    SetVirtualFunctionData : IntPtr

    GetVirtualFunctionData : IntPtr

    GetLocation : IntPtr

    GetResources : IntPtr

    EnableVirtualization : IntPtr

    GetVirtualFunctionProbedBars : IntPtr

}
