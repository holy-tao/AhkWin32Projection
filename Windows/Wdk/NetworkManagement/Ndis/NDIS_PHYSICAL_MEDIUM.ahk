#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_PHYSICAL_MEDIUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumWirelessLan => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumCableModem => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumPhoneLine => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumPowerLine => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumDSL => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumFibreChannel => 6

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMedium1394 => 7

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumWirelessWan => 8

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumNative802_11 => 9

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumBluetooth => 10

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumInfiniband => 11

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumWiMax => 12

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumUWB => 13

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMedium802_3 => 14

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMedium802_5 => 15

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumIrda => 16

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumWiredWAN => 17

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumWiredCoWan => 18

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumOther => 19

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumNative802_15_4 => 20

    /**
     * @type {Integer (Int32)}
     */
    static NdisPhysicalMediumMax => 21
}
