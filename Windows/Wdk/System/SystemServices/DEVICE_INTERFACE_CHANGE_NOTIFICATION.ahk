#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_INTERFACE_CHANGE_NOTIFICATION {
    #StructPack 8

    Version : UInt16

    Size : UInt16

    Event : Guid

    InterfaceClassGuid : Guid

    SymbolicLinkName : UNICODE_STRING.Ptr

}
