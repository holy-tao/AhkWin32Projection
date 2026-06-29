#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the Kerberos proxy settings for the credentials.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcredentials_kdcproxysettingsw
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgCredentials_KdcProxySettingsW {
    #StructPack 4

    /**
     * Version for the Kerberos proxy settings where KDC_PROXY_SETTINGS_V1 is defined as 1.
     */
    Version : UInt32

    /**
     * Flags for the Kerberos proxy settings.
     */
    Flags : UInt32

    /**
     * The offset of the proxy server. This member is optional.
     */
    ProxyServerOffset : UInt16

    /**
     * Length of the proxy server.
     */
    ProxyServerLength : UInt16

    /**
     * The offset of the client credentials. This member is optional.
     */
    ClientTlsCredOffset : UInt16

    /**
     * Length of the client credentials.
     */
    ClientTlsCredLength : UInt16

}
