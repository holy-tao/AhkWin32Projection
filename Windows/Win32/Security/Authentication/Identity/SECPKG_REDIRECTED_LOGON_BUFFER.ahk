#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_REDIRECTED_LOGON_BUFFER {
    #StructPack 8

    RedirectedLogonGuid : Guid

    RedirectedLogonHandle : HANDLE

    Init : IntPtr

    Callback : IntPtr

    CleanupCallback : IntPtr

    GetLogonCreds : IntPtr

    GetSupplementalCreds : IntPtr

    GetRedirectedLogonSid : IntPtr

}
