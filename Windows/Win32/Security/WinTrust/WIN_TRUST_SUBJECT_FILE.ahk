#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WIN_TRUST_SUBJECT_FILE {
    #StructPack 8

    hFile : HANDLE

    lpPath : PWSTR

}
