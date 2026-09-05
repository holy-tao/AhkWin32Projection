#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class HTTP_PUSH_WAIT_TYPE extends Win32Enum {

    /**
     * Native name: HttpPushWaitEnableComplete
     * @type {Integer (Int32)}
     */
    static EnableComplete => 0

    /**
     * Native name: HttpPushWaitReceiveComplete
     * @type {Integer (Int32)}
     */
    static ReceiveComplete => 1

    /**
     * Native name: HttpPushWaitSendComplete
     * @type {Integer (Int32)}
     */
    static SendComplete => 2
}
