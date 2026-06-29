#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\SECURITY_IMPERSONATION_LEVEL.ahk" { SECURITY_IMPERSONATION_LEVEL }

/**
 * The SECPKG_CLIENT_INFO structure holds information about a security package's client. This structure is used by the GetClientInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_client_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_CLIENT_INFO {
    #StructPack 8

    /**
     * The client's effective <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon identifier</a>.
     */
    LogonId : LUID

    /**
     * The client's process identifier.
     */
    ProcessID : UInt32

    /**
     * The client's thread identifier.
     */
    ThreadID : UInt32

    /**
     * <b>TRUE</b> if the client has the SeTcbPrivilege privilege; otherwise <b>FALSE</b>.
     */
    HasTcbPrivilege : BOOLEAN

    /**
     * <b>TRUE</b> if the client is impersonating another <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security principal</a>.
     */
    Impersonating : BOOLEAN

    /**
     * The client is restricted in its ability to access securable objects or perform privileged operations.
     */
    Restricted : BOOLEAN

    ClientFlags : Int8

    ImpersonationLevel : SECURITY_IMPERSONATION_LEVEL

    ClientToken : HANDLE

}
