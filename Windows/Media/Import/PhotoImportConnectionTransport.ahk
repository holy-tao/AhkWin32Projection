#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the connection transport used for photo import.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.import.photoimportconnectiontransport
 * @namespace Windows.Media.Import
 * @version WindowsRuntime 1.4
 */
class PhotoImportConnectionTransport extends Win32Enum{

    /**
     * The connection transport is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The connection transport is USB.
     * @type {Integer (Int32)}
     */
    static Usb => 1

    /**
     * The connection transport is Internet Protocol.
     * @type {Integer (Int32)}
     */
    static IP => 2

    /**
     * The connection transport is Bluetooth.
     * @type {Integer (Int32)}
     */
    static Bluetooth => 3
}
