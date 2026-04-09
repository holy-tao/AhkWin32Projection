#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class HTTP_PUSH_WAIT_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static HttpPushWaitEnableComplete => 0

    /**
     * @type {Integer (Int32)}
     */
    static HttpPushWaitReceiveComplete => 1

    /**
     * @type {Integer (Int32)}
     */
    static HttpPushWaitSendComplete => 2
}
