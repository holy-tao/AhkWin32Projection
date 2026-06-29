#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\SECURITY_IMPERSONATION_LEVEL.ahk" { SECURITY_IMPERSONATION_LEVEL }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_CLIENT_INFO_EX {
    #StructPack 8

    LogonId : LUID

    ProcessID : UInt32

    ThreadID : UInt32

    HasTcbPrivilege : BOOLEAN

    Impersonating : BOOLEAN

    Restricted : BOOLEAN

    ClientFlags : Int8

    ImpersonationLevel : SECURITY_IMPERSONATION_LEVEL

    ClientToken : HANDLE

    IdentificationLogonId : LUID

    IdentificationToken : HANDLE

}
