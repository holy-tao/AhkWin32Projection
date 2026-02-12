#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the cryptogram material package format.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialpackageformat
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramMaterialPackageFormat extends Win32Enum{

    /**
     * The material does not have a format.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The material package is JSON Web Encrypted (JWE) by RSA.
     * @type {Integer (Int32)}
     */
    static JweRsaPki => 1
}
