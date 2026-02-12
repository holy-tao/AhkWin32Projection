#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values used to describe the status of a Wi-Fi Direct Service Session.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesessionstatus
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceSessionStatus extends Win32Enum{

    /**
     * The session has been closed.
     * @type {Integer (Int32)}
     */
    static Closed => 0

    /**
     * The session has been initiated.
     * @type {Integer (Int32)}
     */
    static Initiated => 1

    /**
     * A session has been requested.
     * @type {Integer (Int32)}
     */
    static Requested => 2

    /**
     * The session is open.
     * @type {Integer (Int32)}
     */
    static Open => 3
}
