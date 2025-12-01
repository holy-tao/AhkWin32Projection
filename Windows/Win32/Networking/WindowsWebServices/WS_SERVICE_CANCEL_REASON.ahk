#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The reasons for a cancellation.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_service_cancel_reason
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SERVICE_CANCEL_REASON extends Win32Enum{

    /**
     * A service host is going through an abort.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_HOST_ABORT => 0

    /**
     * The underlying channel faulted.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_CHANNEL_FAULTED => 1
}
