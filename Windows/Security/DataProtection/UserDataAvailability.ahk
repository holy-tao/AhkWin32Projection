#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Identifies the availability of protected data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdataavailability
 * @namespace Windows.Security.DataProtection
 * @version WindowsRuntime 1.4
 */
class UserDataAvailability extends Win32Enum{

    /**
     * Data are unprotected when associated with this availability, and are always accessible whether the device is locked or unlocked.
     * @type {Integer (Int32)}
     */
    static Always => 0

    /**
     * Data protected to this availability are accessible from the time the user signs in until the user signs out or the system is shut down or restarted.
     * 
     * Protecting new data to this availability is always possible.
     * 
     * This is also known as "Level 1" availability.
     * @type {Integer (Int32)}
     */
    static AfterFirstUnlock => 1

    /**
     * Data protected to this availability are available only when the user is signed in and the device is unlocked.
     * 
     * Protecting new data to this availability is always possible.
     * 
     * This is also known as "Level 2" availability.
     * @type {Integer (Int32)}
     */
    static WhileUnlocked => 2
}
