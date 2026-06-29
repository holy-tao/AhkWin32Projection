#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Wdk.System.Registry
 */
export default struct KEY_VALUE_ENTRY {
    #StructPack 8

    ValueName : UNICODE_STRING.Ptr

    DataLength : UInt32

    DataOffset : UInt32

    Type : UInt32

}
