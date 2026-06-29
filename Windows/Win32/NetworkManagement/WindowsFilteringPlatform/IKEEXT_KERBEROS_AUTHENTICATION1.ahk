#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IKEEXT_KERBEROS_AUTHENTICATION_FLAGS.ahk" { IKEEXT_KERBEROS_AUTHENTICATION_FLAGS }

/**
 * Contains information needed for preshared key authentication. (IKEEXT_KERBEROS_AUTHENTICATION1)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_kerberos_authentication1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_KERBEROS_AUTHENTICATION1 {
    #StructPack 8

    /**
     * Type: <b>UINT32</b>
     */
    flags : IKEEXT_KERBEROS_AUTHENTICATION_FLAGS

    /**
     * Type: <b>wchar_t*</b>
     * 
     * The Kerberos proxy server.
     */
    proxyServer : PWSTR

}
