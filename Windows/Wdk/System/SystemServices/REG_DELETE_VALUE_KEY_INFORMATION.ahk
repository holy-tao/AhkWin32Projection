#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct REG_DELETE_VALUE_KEY_INFORMATION {
    #StructPack 8

    Object : IntPtr

    ValueName : UNICODE_STRING.Ptr

    CallContext : IntPtr

    ObjectContext : IntPtr

    Reserved : IntPtr

}
