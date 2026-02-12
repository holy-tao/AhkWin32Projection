#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines cryptogram storage key capabilities.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeycapabilities
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramStorageKeyCapabilities extends Win32BitflagEnum{

    /**
     * The storage key has none of the capabilities defined in this enumeration.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The storage key has hardware protection.
     * @type {Integer (UInt32)}
     */
    static HardwareProtection => 1

    /**
     * The storage key requires a gesture prior to being used in any cryptographic operation.
     * @type {Integer (UInt32)}
     */
    static UnlockPrompt => 2
}
