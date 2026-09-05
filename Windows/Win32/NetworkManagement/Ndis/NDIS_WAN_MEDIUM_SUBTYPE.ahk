#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_WAN_MEDIUM_SUBTYPE extends Win32Enum {

    /**
     * Native name: NdisWanMediumHub
     * @type {Integer (Int32)}
     */
    static Hub => 0

    /**
     * Native name: NdisWanMediumX_25
     * @type {Integer (Int32)}
     */
    static MediumX_25 => 1

    /**
     * Native name: NdisWanMediumIsdn
     * @type {Integer (Int32)}
     */
    static Isdn => 2

    /**
     * Native name: NdisWanMediumSerial
     * @type {Integer (Int32)}
     */
    static Serial => 3

    /**
     * Native name: NdisWanMediumFrameRelay
     * @type {Integer (Int32)}
     */
    static FrameRelay => 4

    /**
     * Native name: NdisWanMediumAtm
     * @type {Integer (Int32)}
     */
    static Atm => 5

    /**
     * Native name: NdisWanMediumSonet
     * @type {Integer (Int32)}
     */
    static Sonet => 6

    /**
     * Native name: NdisWanMediumSW56K
     * @type {Integer (Int32)}
     */
    static MediumSW56K => 7

    /**
     * Native name: NdisWanMediumPPTP
     * @type {Integer (Int32)}
     */
    static MediumPPTP => 8

    /**
     * Native name: NdisWanMediumL2TP
     * @type {Integer (Int32)}
     */
    static MediumL2TP => 9

    /**
     * Native name: NdisWanMediumIrda
     * @type {Integer (Int32)}
     */
    static Irda => 10

    /**
     * Native name: NdisWanMediumParallel
     * @type {Integer (Int32)}
     */
    static Parallel => 11

    /**
     * Native name: NdisWanMediumPppoe
     * @type {Integer (Int32)}
     */
    static Pppoe => 12

    /**
     * Native name: NdisWanMediumSSTP
     * @type {Integer (Int32)}
     */
    static MediumSSTP => 13

    /**
     * Native name: NdisWanMediumAgileVPN
     * @type {Integer (Int32)}
     */
    static AgileVPN => 14

    /**
     * Native name: NdisWanMediumGre
     * @type {Integer (Int32)}
     */
    static Gre => 15

    /**
     * Native name: NdisWanMediumSubTypeMax
     * @type {Integer (Int32)}
     */
    static SubTypeMax => 16
}
