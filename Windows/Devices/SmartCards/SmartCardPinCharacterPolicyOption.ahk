#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the rules for characters in a smart card personal identification number (PIN).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpincharacterpolicyoption
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardPinCharacterPolicyOption extends Win32Enum{

    /**
     * Any of the characters in the specified character class can be in the PIN.
     * @type {Integer (Int32)}
     */
    static Allow => 0

    /**
     * At least one of the characters in the specified character class must be in the PIN.
     * @type {Integer (Int32)}
     */
    static RequireAtLeastOne => 1

    /**
     * None of the characters in the specified character class can be in the PIN.
     * @type {Integer (Int32)}
     */
    static Disallow => 2
}
