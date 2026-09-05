#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the status from a query for the REAL_TIME_NOTIFICATION_CAPABILITY transport setting for a TCP socket that is used with ControlChannelTrigger to receive background network notifications in a Windows Store app.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/ne-mswsock-rio_notification_completion_type">CONTROL_CHANNEL_TRIGGER_STATUS</a>  structure is supported on Windows 8,   and Windows Server 2012, and later versions of the operating system.
 * 
 * A <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/ne-mswsock-rio_notification_completion_type">CONTROL_CHANNEL_TRIGGER_STATUS</a> enumeration value is returned as output from the <a href="https://docs.microsoft.com/windows/win32/winsock/sio-query-transport-setting">SIO_QUERY_TRANSPORT_SETTING</a> 
 *         IOCTL to a query the <b>REAL_TIME_NOTIFICATION_CAPABILITY</b> transport setting for a TCP socket that is used with <a href="https://docs.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger">ControlChannelTrigger</a> to receive background network notifications in a Windows Store app.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ne-mstcpip-control_channel_trigger_status
 * @namespace Windows.Win32.Networking.WinSock
 */
class CONTROL_CHANNEL_TRIGGER_STATUS extends Win32Enum {

    /**
     * Status is invalid.
     * Native name: CONTROL_CHANNEL_TRIGGER_STATUS_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * A software slot was allocated for the <a href="https://docs.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger">ControlChannelTrigger</a>.
     * Native name: CONTROL_CHANNEL_TRIGGER_STATUS_SOFTWARE_SLOT_ALLOCATED
     * @type {Integer (Int32)}
     */
    static SOFTWARE_SLOT_ALLOCATED => 1

    /**
     * A hardware slot was allocated for the <a href="https://docs.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger">ControlChannelTrigger</a>.
     * Native name: CONTROL_CHANNEL_TRIGGER_STATUS_HARDWARE_SLOT_ALLOCATED
     * @type {Integer (Int32)}
     */
    static HARDWARE_SLOT_ALLOCATED => 2

    /**
     * A status policy error.
     * Native name: CONTROL_CHANNEL_TRIGGER_STATUS_POLICY_ERROR
     * @type {Integer (Int32)}
     */
    static POLICY_ERROR => 3

    /**
     * A status system error.
     * Native name: CONTROL_CHANNEL_TRIGGER_STATUS_SYSTEM_ERROR
     * @type {Integer (Int32)}
     */
    static SYSTEM_ERROR => 4

    /**
     * The TCP transport is disconnected.
     * Native name: CONTROL_CHANNEL_TRIGGER_STATUS_TRANSPORT_DISCONNECTED
     * @type {Integer (Int32)}
     */
    static TRANSPORT_DISCONNECTED => 5

    /**
     * Service is unavailable.
     * Native name: CONTROL_CHANNEL_TRIGGER_STATUS_SERVICE_UNAVAILABLE
     * @type {Integer (Int32)}
     */
    static SERVICE_UNAVAILABLE => 6
}
