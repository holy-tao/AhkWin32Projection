#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CLAIMLIST {
    #StructPack 8

    count : UInt32

    claims : PWSTR.Ptr

}
