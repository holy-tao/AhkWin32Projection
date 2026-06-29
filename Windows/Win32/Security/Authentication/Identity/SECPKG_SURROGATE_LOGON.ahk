#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECPKG_SURROGATE_LOGON_ENTRY.ahk" { SECPKG_SURROGATE_LOGON_ENTRY }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_SURROGATE_LOGON {
    #StructPack 8

    Version : UInt32

    SurrogateLogonID : LUID

    EntryCount : UInt32

    Entries : SECPKG_SURROGATE_LOGON_ENTRY.Ptr

}
