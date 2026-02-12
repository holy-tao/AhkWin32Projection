#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The current state of the SIM card for a cellular phone line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonesimstate
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneSimState extends Win32Enum{

    /**
     * The SIM card state is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The SIM card does not require a PIN code.
     * @type {Integer (Int32)}
     */
    static PinNotRequired => 1

    /**
     * The SIM card is unlocked, but requires a PIN code to unlock again if it becomes locked.
     * @type {Integer (Int32)}
     */
    static PinUnlocked => 2

    /**
     * The SIM card is locked and requires a PIN code to unlock.
     * @type {Integer (Int32)}
     */
    static PinLocked => 3

    /**
     * The SIM card is locked due to too many incorrect PIN entries, and requires a Personal Unlocking Key (PUK) to unlock.
     * @type {Integer (Int32)}
     */
    static PukLocked => 4

    /**
     * There is no SIM card inserted into the phone.
     * @type {Integer (Int32)}
     */
    static NotInserted => 5

    /**
     * The SIM card is not valid.
     * @type {Integer (Int32)}
     */
    static Invalid => 6

    /**
     * The SIM card is disabled.
     * @type {Integer (Int32)}
     */
    static Disabled => 7
}
