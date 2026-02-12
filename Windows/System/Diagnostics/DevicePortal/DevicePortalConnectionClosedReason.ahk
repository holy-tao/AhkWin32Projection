#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that explain why a device portal connection was closed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.deviceportal.deviceportalconnectionclosedreason
 * @namespace Windows.System.Diagnostics.DevicePortal
 * @version WindowsRuntime 1.4
 */
class DevicePortalConnectionClosedReason extends Win32Enum{

    /**
     * The connection closed for an unknown reason.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Windows Devices Portal closed the connection because the resource limit was exceeded.
     * @type {Integer (Int32)}
     */
    static ResourceLimitsExceeded => 1

    /**
     * The connection closed because of an unrecognized app service message.
     * @type {Integer (Int32)}
     */
    static ProtocolError => 2

    /**
     * The app is missing the appropriate capability to use a device portal.
     * @type {Integer (Int32)}
     */
    static NotAuthorized => 3

    /**
     * The WTS active console user was missing.
     * @type {Integer (Int32)}
     */
    static UserNotPresent => 4

    /**
     * Windows Device Portal has shut down.
     * @type {Integer (Int32)}
     */
    static ServiceTerminated => 5
}
