#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_POST_LOGON_USER_INFO {
    #StructPack 4

    Flags : UInt32

    LogonId : LUID

    LinkedLogonId : LUID

}
