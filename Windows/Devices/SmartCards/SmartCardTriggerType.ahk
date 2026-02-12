#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the valid smart card trigger types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardtriggertype
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardTriggerType extends Win32Enum{

    /**
     * A transaction event.
     * @type {Integer (Int32)}
     */
    static EmulatorTransaction => 0

    /**
     * A field entry event.
     * 
     * > [!NOTE]
     * > This event is not supported for Universal Windows Platform (UWP) apps in Windows 10.
     * @type {Integer (Int32)}
     */
    static EmulatorNearFieldEntry => 1

    /**
     * A field exit event.
     * 
     * > [!NOTE]
     * > This event is not supported for Universal Windows Platform (UWP) apps in Windows 10.
     * @type {Integer (Int32)}
     */
    static EmulatorNearFieldExit => 2

    /**
     * A host application activated event.
     * @type {Integer (Int32)}
     */
    static EmulatorHostApplicationActivated => 3

    /**
     * An applet ID group registration changed event.
     * @type {Integer (Int32)}
     */
    static EmulatorAppletIdGroupRegistrationChanged => 4

    /**
     * A reader card was added event.
     * @type {Integer (Int32)}
     */
    static ReaderCardAdded => 5
}
