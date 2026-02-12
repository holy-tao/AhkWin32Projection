#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the cryptogram material protection method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialprotectionmethod
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramMaterialProtectionMethod extends Win32Enum{

    /**
     * Do not protect the cryptogram material.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Protect the cryptogram material by whiteboxing.
     * @type {Integer (Int32)}
     */
    static WhiteBoxing => 1
}
