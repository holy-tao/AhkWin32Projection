#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the current state of a casting connection. Rendering is used when actively playing content.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingconnectionstate
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class CastingConnectionState extends Win32Enum{

    /**
     * The casting connection has been disconnected.
     * @type {Integer (Int32)}
     */
    static Disconnected => 0

    /**
     * The casting connection is active.
     * @type {Integer (Int32)}
     */
    static Connected => 1

    /**
     * The casting connection is actively playing content.
     * @type {Integer (Int32)}
     */
    static Rendering => 2

    /**
     * The connection is being disconnected.
     * @type {Integer (Int32)}
     */
    static Disconnecting => 3

    /**
     * The connection is connecting.
     * @type {Integer (Int32)}
     */
    static Connecting => 4
}
