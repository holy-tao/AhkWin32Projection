#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies a direct pairing procedure.
 * @remarks
 * Wi-Fi Direct supports two different pairing procedures. In the Group Owner Negotiation procedure, the connecting device chooses the configuration method (PIN entry, PIN display, or push-button pairing.) In the P2P Invitation procedure, the accepting device chooses the configuration method. Use the values in this enumeration to identify a pairing procedure.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectpairingprocedure
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectPairingProcedure extends Win32Enum{

    /**
     * Group Owner Negotiation. The connecting device chooses the configuration method.
     * @type {Integer (Int32)}
     */
    static GroupOwnerNegotiation => 0

    /**
     * P2P Invitation. The accepting device chooses the configuration method.
     * @type {Integer (Int32)}
     */
    static Invitation => 1
}
