#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_DETACHED_SIG_FILE_HANDLES {
    #StructPack 8

    hContentFile : HANDLE

    hSignatureFile : HANDLE

}
