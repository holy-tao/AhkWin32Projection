#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_PORT_TYPE extends Win32Enum{

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
