#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates which discovery options are available to use with the [PeerFinder](peerfinder.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerdiscoverytypes
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class PeerDiscoveryTypes extends Win32BitflagEnum{

    /**
     * No supported discovery types are available. You can't use the [PeerFinder](peerfinder.md) class.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * You can use Wifi-Direct to find peers by using the [FindAllPeersAsync](peerfinder_findallpeersasync_830195586.md) and [ConnectAsync](peerfinder_connectasync_380619906.md) methods of the [PeerFinder](peerfinder.md) class.
     * @type {Integer (UInt32)}
     */
    static Browse => 1

    /**
     * You can tap to connect to peers by using the [PeerFinder](peerfinder.md) class.
     * @type {Integer (UInt32)}
     */
    static Triggered => 2
}
