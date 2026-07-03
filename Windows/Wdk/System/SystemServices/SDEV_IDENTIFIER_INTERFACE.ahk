#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PGET_SDEV_IDENTIFIER.ahk" { PGET_SDEV_IDENTIFIER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SDEV_IDENTIFIER_INTERFACE {
    #StructPack 8

    InterfaceHeader : IntPtr

    GetIdentifier : PGET_SDEV_IDENTIFIER

}
