#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the reasons a smart card connection to an NFC reader could become deactivated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorconnectiondeactivatedreason
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardEmulatorConnectionDeactivatedReason extends Win32Enum{

    /**
     * The physical connection to the reader was lost.
     * @type {Integer (Int32)}
     */
    static ConnectionLost => 0

    /**
     * The connection is redirected to another app due to reader terminal selecting a different application identifier which resolves to a different app.
     * @type {Integer (Int32)}
     */
    static ConnectionRedirected => 1
}
