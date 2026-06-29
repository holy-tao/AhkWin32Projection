#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TRANSACTION_PROPERTIES_INFORMATION {
    #StructPack 8

    IsolationLevel : UInt32

    IsolationFlags : UInt32

    Timeout : Int64

    Outcome : UInt32

    DescriptionLength : UInt32

    Description : WCHAR[1]

}
