#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset Unicode
 */
export default struct NTMS_I1_OPREQUESTINFORMATIONW {
    #StructPack 4

    Request : UInt32

    Submitted : SYSTEMTIME

    State : UInt32

    szMessage : WCHAR[127]

    Arg1Type : UInt32

    Arg1 : Guid

    Arg2Type : UInt32

    Arg2 : Guid

    szApplication : WCHAR[64]

    szUser : WCHAR[64]

    szComputer : WCHAR[64]

}
