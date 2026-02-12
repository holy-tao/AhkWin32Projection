#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the IP protocol of the new port when a [WiFiDirectServiceSession.RemotePortAdded](wifidirectservicesession_remoteportadded.md) event is raised.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.services.wifidirectserviceipprotocol
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class WiFiDirectServiceIPProtocol extends Win32Enum{

    /**
     * Specifies the TCP protocol.
     * @type {Integer (Int32)}
     */
    static Tcp => 6

    /**
     * Specifies the UDP protocol.
     * @type {Integer (Int32)}
     */
    static Udp => 17
}
