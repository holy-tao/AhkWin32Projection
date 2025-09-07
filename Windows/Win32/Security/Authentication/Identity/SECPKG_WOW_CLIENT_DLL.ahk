#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SECURITY_STRING.ahk

/**
 * Contains the path to the WOW-aware 32-bit DLL.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_wow_client_dll
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_WOW_CLIENT_DLL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-security_string">SECURITY_STRING</a> that contain the path to the WOW-aware client 32-bit library.
     * @type {SECURITY_STRING}
     */
    WowClientDllPath{
        get {
            if(!this.HasProp("__WowClientDllPath"))
                this.__WowClientDllPath := SECURITY_STRING(this.ptr + 0)
            return this.__WowClientDllPath
        }
    }
}
