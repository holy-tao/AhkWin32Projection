#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the valid categories of smart cards that can be emulated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulationcategory
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardEmulationCategory extends Win32Enum{

    /**
     * Specifies smart cards other than payment cards, such as a loyalty cards or security badges.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * Specifies payment cards.
     * @type {Integer (Int32)}
     */
    static Payment => 1
}
