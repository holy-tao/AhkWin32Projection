#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_REQUEST_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestQueryInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestSetInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestQueryStatistics => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestOpen => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestClose => 4

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestSend => 5

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestTransferData => 6

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestReset => 7

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestGeneric1 => 8

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestGeneric2 => 9

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestGeneric3 => 10

    /**
     * @type {Integer (Int32)}
     */
    static NdisRequestGeneric4 => 11
}
