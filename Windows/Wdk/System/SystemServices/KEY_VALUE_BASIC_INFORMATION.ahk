#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KEY_VALUE_BASIC_INFORMATION {
    #StructPack 4

    TitleIndex : UInt32

    Type : UInt32

    NameLength : UInt32

    Name : WCHAR[1]

}
