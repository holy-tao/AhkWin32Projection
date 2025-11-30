#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class SECURE_ELEMENT_EVENT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ExternalReaderArrival => 0

    /**
     * @type {Integer (Int32)}
     */
    static ExternalReaderDeparture => 1

    /**
     * @type {Integer (Int32)}
     */
    static ApplicationSelected => 2

    /**
     * @type {Integer (Int32)}
     */
    static Transaction => 3

    /**
     * @type {Integer (Int32)}
     */
    static HceActivated => 4

    /**
     * @type {Integer (Int32)}
     */
    static HceDeactivated => 5

    /**
     * @type {Integer (Int32)}
     */
    static ExternalFieldEnter => 6

    /**
     * @type {Integer (Int32)}
     */
    static ExternalFieldExit => 7
}
