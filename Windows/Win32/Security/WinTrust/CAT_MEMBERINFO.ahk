#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CAT_MEMBERINFO {
    #StructPack 8

    pwszSubjGuid : PWSTR

    dwCertVersion : UInt32

}
