#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Authorization
 * @charset ANSI
 */
export default struct ACTRL_ACCESS_INFOA {
    #StructPack 8

    fAccessPermission : UInt32

    lpAccessPermissionName : PSTR

}
