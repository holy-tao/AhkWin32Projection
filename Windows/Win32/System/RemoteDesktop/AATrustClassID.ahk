#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class AATrustClassID extends Win32Enum {

    /**
     * Native name: AA_UNTRUSTED
     * @type {Integer (Int32)}
     */
    static UNTRUSTED => 0

    /**
     * Native name: AA_TRUSTEDUSER_UNTRUSTEDCLIENT
     * @type {Integer (Int32)}
     */
    static TRUSTEDUSER_UNTRUSTEDCLIENT => 1

    /**
     * Native name: AA_TRUSTEDUSER_TRUSTEDCLIENT
     * @type {Integer (Int32)}
     */
    static TRUSTEDUSER_TRUSTEDCLIENT => 2
}
