#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the kinds of sockets recognized by this API.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivesocketkind
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveSocketKind extends Win32Enum{

    /**
     * No socket kind is specified. This value should be used in your code only for data validation purposes.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Datagram (UDP).
     * @type {Integer (Int32)}
     */
    static Datagram => 1

    /**
     * Stream (TCP).
     * @type {Integer (Int32)}
     */
    static Stream => 2
}
