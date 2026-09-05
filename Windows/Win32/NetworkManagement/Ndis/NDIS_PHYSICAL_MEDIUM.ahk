#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_PHYSICAL_MEDIUM extends Win32Enum {

    /**
     * Native name: NdisPhysicalMediumUnspecified
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Native name: NdisPhysicalMediumWirelessLan
     * @type {Integer (Int32)}
     */
    static WirelessLan => 1

    /**
     * Native name: NdisPhysicalMediumCableModem
     * @type {Integer (Int32)}
     */
    static CableModem => 2

    /**
     * Native name: NdisPhysicalMediumPhoneLine
     * @type {Integer (Int32)}
     */
    static PhoneLine => 3

    /**
     * Native name: NdisPhysicalMediumPowerLine
     * @type {Integer (Int32)}
     */
    static PowerLine => 4

    /**
     * Native name: NdisPhysicalMediumDSL
     * @type {Integer (Int32)}
     */
    static MediumDSL => 5

    /**
     * Native name: NdisPhysicalMediumFibreChannel
     * @type {Integer (Int32)}
     */
    static FibreChannel => 6

    /**
     * Native name: NdisPhysicalMedium1394
     * @type {Integer (Int32)}
     */
    static Medium1394 => 7

    /**
     * Native name: NdisPhysicalMediumWirelessWan
     * @type {Integer (Int32)}
     */
    static WirelessWan => 8

    /**
     * Native name: NdisPhysicalMediumNative802_11
     * @type {Integer (Int32)}
     */
    static Native802_11 => 9

    /**
     * Native name: NdisPhysicalMediumBluetooth
     * @type {Integer (Int32)}
     */
    static Bluetooth => 10

    /**
     * Native name: NdisPhysicalMediumInfiniband
     * @type {Integer (Int32)}
     */
    static Infiniband => 11

    /**
     * Native name: NdisPhysicalMediumWiMax
     * @type {Integer (Int32)}
     */
    static WiMax => 12

    /**
     * Native name: NdisPhysicalMediumUWB
     * @type {Integer (Int32)}
     */
    static MediumUWB => 13

    /**
     * Native name: NdisPhysicalMedium802_3
     * @type {Integer (Int32)}
     */
    static Medium802_3 => 14

    /**
     * Native name: NdisPhysicalMedium802_5
     * @type {Integer (Int32)}
     */
    static Medium802_5 => 15

    /**
     * Native name: NdisPhysicalMediumIrda
     * @type {Integer (Int32)}
     */
    static Irda => 16

    /**
     * Native name: NdisPhysicalMediumWiredWAN
     * @type {Integer (Int32)}
     */
    static WiredWAN => 17

    /**
     * Native name: NdisPhysicalMediumWiredCoWan
     * @type {Integer (Int32)}
     */
    static WiredCoWan => 18

    /**
     * Native name: NdisPhysicalMediumOther
     * @type {Integer (Int32)}
     */
    static Other => 19

    /**
     * Native name: NdisPhysicalMediumNative802_15_4
     * @type {Integer (Int32)}
     */
    static Native802_15_4 => 20

    /**
     * Native name: NdisPhysicalMediumMax
     * @type {Integer (Int32)}
     */
    static Max => 21
}
