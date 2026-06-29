#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct REMSECURITY_ATTRIBUTES {
    #StructPack 4

    nLength : UInt32

    lpSecurityDescriptor : UInt32

    bInheritHandle : BOOL

}
