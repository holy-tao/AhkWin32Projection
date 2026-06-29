#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct REG_SET_VALUE_KEY_INFORMATION {
    #StructPack 8

    Object : IntPtr

    ValueName : UNICODE_STRING.Ptr

    TitleIndex : UInt32

    Type : UInt32

    Data : IntPtr

    DataSize : UInt32

    CallContext : IntPtr

    ObjectContext : IntPtr

    Reserved : IntPtr

}
