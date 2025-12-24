#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_MEDIUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NdisMedium802_3 => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisMedium802_5 => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumFddi => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumWan => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumLocalTalk => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumDix => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumArcnetRaw => 6

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumArcnet878_2 => 7

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumAtm => 8

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumWirelessWan => 9

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumIrda => 10

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumBpc => 11

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumCoWan => 12

    /**
     * @type {Integer (Int32)}
     */
    static NdisMedium1394 => 13

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumInfiniBand => 14

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumTunnel => 15

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumNative802_11 => 16

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumLoopback => 17

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumWiMAX => 18

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumIP => 19

    /**
     * @type {Integer (Int32)}
     */
    static NdisMediumMax => 20
}
