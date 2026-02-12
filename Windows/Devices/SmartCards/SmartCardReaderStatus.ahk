#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the smart card reader's status.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardreaderstatus
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardReaderStatus extends Win32Enum{

    /**
     * The smart card reader is disconnected.
     * @type {Integer (Int32)}
     */
    static Disconnected => 0

    /**
     * The smart card reader is ready.
     * @type {Integer (Int32)}
     */
    static Ready => 1

    /**
     * The smart card reader is allocated for exclusive use by another app.
     * @type {Integer (Int32)}
     */
    static Exclusive => 2
}
