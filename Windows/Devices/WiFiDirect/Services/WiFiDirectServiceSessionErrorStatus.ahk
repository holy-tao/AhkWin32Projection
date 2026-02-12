#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values used in the [WiFiDirectServiceSession.ErrorStatus](wifidirectservicesession_errorstatus.md) property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectservicesessionerrorstatus
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceSessionErrorStatus extends Win32Enum{

    /**
     * Session status is OK.
     * @type {Integer (Int32)}
     */
    static Ok => 0

    /**
     * The L2 connection was disassociated unexpectedly.
     * @type {Integer (Int32)}
     */
    static Disassociated => 1

    /**
     * The session was closed from the local side of the session.
     * @type {Integer (Int32)}
     */
    static LocalClose => 2

    /**
     * The session was closed from the remote side of the session.
     * @type {Integer (Int32)}
     */
    static RemoteClose => 3

    /**
     * A general system failure has occurred.
     * @type {Integer (Int32)}
     */
    static SystemFailure => 4

    /**
     * Session timed out due to no response from the remote side of the session.
     * @type {Integer (Int32)}
     */
    static NoResponseFromRemote => 5
}
