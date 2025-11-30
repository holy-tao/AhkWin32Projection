#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class REQUEST_TIMES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NameResolutionStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static NameResolutionEnd => 1

    /**
     * @type {Integer (Int32)}
     */
    static ConnectionEstablishmentStart => 2

    /**
     * @type {Integer (Int32)}
     */
    static ConnectionEstablishmentEnd => 3

    /**
     * @type {Integer (Int32)}
     */
    static TLSHandshakeStart => 4

    /**
     * @type {Integer (Int32)}
     */
    static TLSHandshakeEnd => 5

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestTimeMax => 32
}
