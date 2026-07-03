#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct PUBLIC_OBJECT_TYPE_INFORMATION {
    #StructPack 8

    TypeName : UNICODE_STRING

    Reserved : UInt32[22]

}
