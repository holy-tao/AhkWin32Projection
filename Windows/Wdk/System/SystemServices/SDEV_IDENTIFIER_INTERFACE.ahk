#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SDEV_IDENTIFIER_INTERFACE {
    #StructPack 8

    InterfaceHeader : IntPtr

    GetIdentifier : IntPtr

}
