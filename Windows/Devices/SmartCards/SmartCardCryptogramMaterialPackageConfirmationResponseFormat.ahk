#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the format of the proof of possession returned when calling the [TryProvePossessionOfCryptogramMaterialPackageAsync](smartcardcryptogramgenerator_tryprovepossessionofcryptogrammaterialpackageasync_2141877963.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogrammaterialpackageconfirmationresponseformat
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramMaterialPackageConfirmationResponseFormat extends Win32Enum{

    /**
     * No format specified.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Visa hash-based message authentication code (HMAC) format.
     * @type {Integer (Int32)}
     */
    static VisaHmac => 1
}
