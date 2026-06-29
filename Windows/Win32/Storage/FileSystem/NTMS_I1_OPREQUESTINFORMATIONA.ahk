#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @charset ANSI
 */
export default struct NTMS_I1_OPREQUESTINFORMATIONA {
    #StructPack 4

    Request : UInt32

    Submitted : SYSTEMTIME

    State : UInt32

    szMessage : CHAR[127]

    Arg1Type : UInt32

    Arg1 : Guid

    Arg2Type : UInt32

    Arg2 : Guid

    szApplication : CHAR[64]

    szUser : CHAR[64]

    szComputer : CHAR[64]

}
