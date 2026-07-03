#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PTM_CONTROL_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : IntPtr

    InterfaceDereference : IntPtr

    QueryGranularity : IntPtr

    QueryTimeSource : IntPtr

    Enable : IntPtr

    Disable : IntPtr

}
