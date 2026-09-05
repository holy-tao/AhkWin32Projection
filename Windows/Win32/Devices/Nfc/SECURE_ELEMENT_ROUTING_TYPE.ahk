#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class SECURE_ELEMENT_ROUTING_TYPE extends Win32Enum {

    /**
     * Native name: RoutingTypeTech
     * @type {Integer (Int32)}
     */
    static Tech => 0

    /**
     * Native name: RoutingTypeProtocol
     * @type {Integer (Int32)}
     */
    static Protocol => 1

    /**
     * Native name: RoutingTypeAid
     * @type {Integer (Int32)}
     */
    static Aid => 2
}
