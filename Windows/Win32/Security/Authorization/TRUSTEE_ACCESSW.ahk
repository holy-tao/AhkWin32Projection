#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Authorization
 * @charset Unicode
 */
export default struct TRUSTEE_ACCESSW {
    #StructPack 8

    lpProperty : PWSTR

    Access : UInt32

    fAccessFlags : UInt32

    fReturnedAccess : UInt32

}
