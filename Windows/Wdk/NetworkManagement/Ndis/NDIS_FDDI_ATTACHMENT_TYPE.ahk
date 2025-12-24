#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_FDDI_ATTACHMENT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeIsolated => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeLocalA => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeLocalB => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeLocalAB => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeLocalS => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeWrapA => 6

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeWrapB => 7

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeWrapAB => 8

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeWrapS => 9

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeCWrapA => 10

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeCWrapB => 11

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeCWrapS => 12

    /**
     * @type {Integer (Int32)}
     */
    static NdisFddiTypeThrough => 13
}
