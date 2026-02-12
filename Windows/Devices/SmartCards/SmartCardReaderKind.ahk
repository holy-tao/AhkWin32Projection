#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the smart card reader's type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardreaderkind
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardReaderKind extends Win32Enum{

    /**
     * This value is never returned.
     * 
     * This value can be used with [GetDeviceSelector(SmartCardReaderKind)](smartcardreader_getdeviceselector_1037956577.md) to specify no specific smart card reader type in the underlying Advanced Query Syntax (AQS) string.
     * @type {Integer (Int32)}
     */
    static Any => 0

    /**
     * A generic smart card reader.
     * @type {Integer (Int32)}
     */
    static Generic => 1

    /**
     * A Trusted Platform Module (TPM) virtual smart card reader.
     * @type {Integer (Int32)}
     */
    static Tpm => 2

    /**
     * A near field communication (NFC) smart card reader.
     * @type {Integer (Int32)}
     */
    static Nfc => 3

    /**
     * A Universal Integrated Circuit Card (UICC) smart card reader.
     * @type {Integer (Int32)}
     */
    static Uicc => 4

    /**
     * An embedded SE smart card reader.
     * @type {Integer (Int32)}
     */
    static EmbeddedSE => 5
}
