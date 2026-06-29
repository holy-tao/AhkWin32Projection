#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECURITY_STRING.ahk" { SECURITY_STRING }

/**
 * Contains the path to the WOW-aware 32-bit DLL.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_wow_client_dll
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_WOW_CLIENT_DLL {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-security_string">SECURITY_STRING</a> that contain the path to the WOW-aware client 32-bit library.
     */
    WowClientDllPath : SECURITY_STRING

}
