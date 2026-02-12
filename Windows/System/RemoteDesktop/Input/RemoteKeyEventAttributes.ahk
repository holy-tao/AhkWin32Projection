#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.System.RemoteDesktop.Input
 * @version WindowsRuntime 1.4
 */
class RemoteKeyEventAttributes extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KeyUp => 1

    /**
     * @type {Integer (UInt32)}
     */
    static Repeat => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Extended => 4

    /**
     * @type {Integer (UInt32)}
     */
    static Extended1 => 8
}
