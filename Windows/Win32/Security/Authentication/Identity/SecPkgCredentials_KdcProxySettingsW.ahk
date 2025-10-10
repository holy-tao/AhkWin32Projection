#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies the Kerberos proxy settings for the credentials.
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcredentials_kdcproxysettingsw
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgCredentials_KdcProxySettingsW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Version for the Kerberos proxy settings where KDC_PROXY_SETTINGS_V1 is defined as 1.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Flags for the Kerberos proxy settings.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The offset of the proxy server. This member is optional.
     * @type {Integer}
     */
    ProxyServerOffset {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Length of the proxy server.
     * @type {Integer}
     */
    ProxyServerLength {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The offset of the client credentials. This member is optional.
     * @type {Integer}
     */
    ClientTlsCredOffset {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Length of the client credentials.
     * @type {Integer}
     */
    ClientTlsCredLength {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}
