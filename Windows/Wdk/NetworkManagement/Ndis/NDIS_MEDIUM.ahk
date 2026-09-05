#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_MEDIUM extends Win32Enum {

    /**
     * Native name: NdisMedium802_3
     * @type {Integer (Int32)}
     */
    static Medium802_3 => 0

    /**
     * Native name: NdisMedium802_5
     * @type {Integer (Int32)}
     */
    static Medium802_5 => 1

    /**
     * Native name: NdisMediumFddi
     * @type {Integer (Int32)}
     */
    static Fddi => 2

    /**
     * Native name: NdisMediumWan
     * @type {Integer (Int32)}
     */
    static Wan => 3

    /**
     * Native name: NdisMediumLocalTalk
     * @type {Integer (Int32)}
     */
    static LocalTalk => 4

    /**
     * Native name: NdisMediumDix
     * @type {Integer (Int32)}
     */
    static Dix => 5

    /**
     * Native name: NdisMediumArcnetRaw
     * @type {Integer (Int32)}
     */
    static ArcnetRaw => 6

    /**
     * Native name: NdisMediumArcnet878_2
     * @type {Integer (Int32)}
     */
    static Arcnet878_2 => 7

    /**
     * Native name: NdisMediumAtm
     * @type {Integer (Int32)}
     */
    static Atm => 8

    /**
     * Native name: NdisMediumWirelessWan
     * @type {Integer (Int32)}
     */
    static WirelessWan => 9

    /**
     * Native name: NdisMediumIrda
     * @type {Integer (Int32)}
     */
    static Irda => 10

    /**
     * Native name: NdisMediumBpc
     * @type {Integer (Int32)}
     */
    static Bpc => 11

    /**
     * Native name: NdisMediumCoWan
     * @type {Integer (Int32)}
     */
    static CoWan => 12

    /**
     * Native name: NdisMedium1394
     * @type {Integer (Int32)}
     */
    static Medium1394 => 13

    /**
     * Native name: NdisMediumInfiniBand
     * @type {Integer (Int32)}
     */
    static InfiniBand => 14

    /**
     * Native name: NdisMediumTunnel
     * @type {Integer (Int32)}
     */
    static Tunnel => 15

    /**
     * Native name: NdisMediumNative802_11
     * @type {Integer (Int32)}
     */
    static Native802_11 => 16

    /**
     * Native name: NdisMediumLoopback
     * @type {Integer (Int32)}
     */
    static Loopback => 17

    /**
     * Native name: NdisMediumWiMAX
     * @type {Integer (Int32)}
     */
    static WiMAX => 18

    /**
     * Native name: NdisMediumIP
     * @type {Integer (Int32)}
     */
    static MediumIP => 19

    /**
     * Native name: NdisMediumMax
     * @type {Integer (Int32)}
     */
    static Max => 20
}
