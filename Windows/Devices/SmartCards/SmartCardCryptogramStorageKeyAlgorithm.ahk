#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines cryptogram storage key algorithms.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramstoragekeyalgorithm
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramStorageKeyAlgorithm extends Win32Enum{

    /**
     * The storage key is not encrypted.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The storage key is encrypted by RSA-2048.
     * @type {Integer (Int32)}
     */
    static Rsa2048 => 1
}
