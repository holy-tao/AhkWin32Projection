#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the smart card's status.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardstatus
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardStatus extends Win32Enum{

    /**
     * The smart card is disconnected.
     * @type {Integer (Int32)}
     */
    static Disconnected => 0

    /**
     * The smart card is ready.
     * @type {Integer (Int32)}
     */
    static Ready => 1

    /**
     * The smart card can be used by multiple apps.
     * @type {Integer (Int32)}
     */
    static Shared => 2

    /**
     * The smart card is allocated for exclusive use by another app.
     * @type {Integer (Int32)}
     */
    static Exclusive => 3

    /**
     * The smart card is unresponsive.
     * @type {Integer (Int32)}
     */
    static Unresponsive => 4
}
