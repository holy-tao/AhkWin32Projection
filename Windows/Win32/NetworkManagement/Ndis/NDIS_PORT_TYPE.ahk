#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_PORT_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static NdisPortTypeUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisPortTypeBridge => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisPortTypeRasConnection => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisPortType8021xSupplicant => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisPortTypeMax => 4
}
