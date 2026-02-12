#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the valid types of smart card connection sources.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorconnectionsource
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardEmulatorConnectionSource extends Win32Enum{

    /**
     * Specifies a connection to something other than an NFC reader.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Specifies an NFC reader connection.
     * @type {Integer (Int32)}
     */
    static NfcReader => 1
}
