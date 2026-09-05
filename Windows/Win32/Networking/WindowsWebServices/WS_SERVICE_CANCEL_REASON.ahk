#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The reasons for a cancellation.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_service_cancel_reason
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_SERVICE_CANCEL_REASON extends Win32Enum {

    /**
     * A service host is going through an abort.
     * Native name: WS_SERVICE_HOST_ABORT
     * @type {Integer (Int32)}
     */
    static HOST_ABORT => 0

    /**
     * The underlying channel faulted.
     * Native name: WS_SERVICE_CHANNEL_FAULTED
     * @type {Integer (Int32)}
     */
    static CHANNEL_FAULTED => 1
}
