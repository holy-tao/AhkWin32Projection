#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_FAST_FORWARDING_STATE{

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpFastForwardingStateInProgress => 0

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpFastForwardingStateSucceeded => 1

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpFastForwardingStateClientSideFailed => 2

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpFastForwardingStateServerSideFailed => 3
}
