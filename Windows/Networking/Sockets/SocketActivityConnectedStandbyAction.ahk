#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates whether an app that uses the socket brokering service can receive packets when the system goes to connected stand by.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketactivityconnectedstandbyaction
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class SocketActivityConnectedStandbyAction extends Win32Enum{

    /**
     * The app should not receive packets when the system goes to stand by.
     * @type {Integer (Int32)}
     */
    static DoNotWake => 0

    /**
     * The app can receive packets even when the system goes to stand by.
     * @type {Integer (Int32)}
     */
    static Wake => 1
}
