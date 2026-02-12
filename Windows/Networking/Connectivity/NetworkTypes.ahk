#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the network connection types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networktypes
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class NetworkTypes extends Win32BitflagEnum{

    /**
     * No network.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Internet.
     * @type {Integer (UInt32)}
     */
    static Internet => 1

    /**
     * Private network.
     * @type {Integer (UInt32)}
     */
    static PrivateNetwork => 2
}
