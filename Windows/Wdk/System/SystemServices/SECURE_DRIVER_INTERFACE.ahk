#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SECURE_DRIVER_INTERFACE {
    #StructPack 8

    InterfaceHeader : IntPtr

    ProcessReference : IntPtr

    ProcessDereference : IntPtr

    Reserved : UInt32

}
