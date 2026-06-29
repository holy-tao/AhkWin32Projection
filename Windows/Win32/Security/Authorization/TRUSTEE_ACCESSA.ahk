#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Authorization
 * @charset ANSI
 */
export default struct TRUSTEE_ACCESSA {
    #StructPack 8

    lpProperty : PSTR

    Access : UInt32

    fAccessFlags : UInt32

    fReturnedAccess : UInt32

}
