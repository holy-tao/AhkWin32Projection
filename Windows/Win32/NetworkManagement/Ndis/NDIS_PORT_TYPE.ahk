#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_PORT_TYPE extends Win32Enum {

    /**
     * Native name: NdisPortTypeUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: NdisPortTypeBridge
     * @type {Integer (Int32)}
     */
    static Bridge => 1

    /**
     * Native name: NdisPortTypeRasConnection
     * @type {Integer (Int32)}
     */
    static RasConnection => 2

    /**
     * Native name: NdisPortType8021xSupplicant
     * @type {Integer (Int32)}
     */
    static Type8021xSupplicant => 3

    /**
     * Native name: NdisPortTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}
