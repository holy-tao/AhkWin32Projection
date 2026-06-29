#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CSEDB_RSTMAPW {
    #StructPack 8

    pwszDatabaseName : PWSTR

    pwszNewDatabaseName : PWSTR

}
