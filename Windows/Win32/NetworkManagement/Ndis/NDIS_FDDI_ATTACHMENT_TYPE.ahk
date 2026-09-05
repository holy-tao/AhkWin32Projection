#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_FDDI_ATTACHMENT_TYPE extends Win32Enum {

    /**
     * Native name: NdisFddiTypeIsolated
     * @type {Integer (Int32)}
     */
    static Isolated => 1

    /**
     * Native name: NdisFddiTypeLocalA
     * @type {Integer (Int32)}
     */
    static LocalA => 2

    /**
     * Native name: NdisFddiTypeLocalB
     * @type {Integer (Int32)}
     */
    static LocalB => 3

    /**
     * Native name: NdisFddiTypeLocalAB
     * @type {Integer (Int32)}
     */
    static LocalAB => 4

    /**
     * Native name: NdisFddiTypeLocalS
     * @type {Integer (Int32)}
     */
    static LocalS => 5

    /**
     * Native name: NdisFddiTypeWrapA
     * @type {Integer (Int32)}
     */
    static WrapA => 6

    /**
     * Native name: NdisFddiTypeWrapB
     * @type {Integer (Int32)}
     */
    static WrapB => 7

    /**
     * Native name: NdisFddiTypeWrapAB
     * @type {Integer (Int32)}
     */
    static WrapAB => 8

    /**
     * Native name: NdisFddiTypeWrapS
     * @type {Integer (Int32)}
     */
    static WrapS => 9

    /**
     * Native name: NdisFddiTypeCWrapA
     * @type {Integer (Int32)}
     */
    static TypeCWrapA => 10

    /**
     * Native name: NdisFddiTypeCWrapB
     * @type {Integer (Int32)}
     */
    static TypeCWrapB => 11

    /**
     * Native name: NdisFddiTypeCWrapS
     * @type {Integer (Int32)}
     */
    static TypeCWrapS => 12

    /**
     * Native name: NdisFddiTypeThrough
     * @type {Integer (Int32)}
     */
    static Through => 13
}
