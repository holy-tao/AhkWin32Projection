#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PROTECTED_FILE_DATA {
    #StructPack 4

    FileName : WCHAR[260]

    FileNumber : UInt32

}
