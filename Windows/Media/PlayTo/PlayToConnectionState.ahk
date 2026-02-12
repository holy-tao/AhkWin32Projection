#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the status of a Play To connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoconnectionstate
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class PlayToConnectionState extends Win32Enum{

    /**
     * The connection is disconnected.
     * @type {Integer (Int32)}
     */
    static Disconnected => 0

    /**
     * The connection is connected.
     * @type {Integer (Int32)}
     */
    static Connected => 1

    /**
     * The connection is rendering media on the Play To target device.
     * @type {Integer (Int32)}
     */
    static Rendering => 2
}
