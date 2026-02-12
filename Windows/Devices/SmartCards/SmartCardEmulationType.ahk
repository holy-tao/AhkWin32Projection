#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the mechanism by which the device emulates a smart card.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulationtype
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardEmulationType extends Win32Enum{

    /**
     * The device emulates a smart card by forwarding application protocol data unit (APDU) commands to the host application, which responds back.
     * @type {Integer (Int32)}
     */
    static Host => 0

    /**
     * The device emulates a smart card by forwarding the application protocol data unit (APDU) commands directly to the physical UICC card. The UICC card is more commonly referred to as the SIM card.
     * @type {Integer (Int32)}
     */
    static Uicc => 1

    /**
     * The device emulates a smart card by forwarding the application protocol data unit (APDU) commands to an embedded SE reader.
     * @type {Integer (Int32)}
     */
    static EmbeddedSE => 2
}
