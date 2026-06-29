#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import ".\KEY_VALUE_INFORMATION_CLASS.ahk" { KEY_VALUE_INFORMATION_CLASS }

/**
 * @namespace Windows.Wdk.System.Registry
 */
export default struct REG_QUERY_VALUE_KEY_INFORMATION {
    #StructPack 8

    Object : IntPtr

    ValueName : UNICODE_STRING.Ptr

    KeyValueInformationClass : KEY_VALUE_INFORMATION_CLASS

    KeyValueInformation : IntPtr

    Length : UInt32

    ResultLength : IntPtr

    CallContext : IntPtr

    ObjectContext : IntPtr

    Reserved : IntPtr

}
