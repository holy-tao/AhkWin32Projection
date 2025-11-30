#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class AATrustClassID extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AA_UNTRUSTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static AA_TRUSTEDUSER_UNTRUSTEDCLIENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static AA_TRUSTEDUSER_TRUSTEDCLIENT => 2
}
