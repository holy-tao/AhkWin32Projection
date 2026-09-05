#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_REQUEST_TYPE extends Win32Enum {

    /**
     * Native name: NdisRequestQueryInformation
     * @type {Integer (Int32)}
     */
    static QueryInformation => 0

    /**
     * Native name: NdisRequestSetInformation
     * @type {Integer (Int32)}
     */
    static SetInformation => 1

    /**
     * Native name: NdisRequestQueryStatistics
     * @type {Integer (Int32)}
     */
    static QueryStatistics => 2

    /**
     * Native name: NdisRequestOpen
     * @type {Integer (Int32)}
     */
    static Open => 3

    /**
     * Native name: NdisRequestClose
     * @type {Integer (Int32)}
     */
    static Close => 4

    /**
     * Native name: NdisRequestSend
     * @type {Integer (Int32)}
     */
    static Send => 5

    /**
     * Native name: NdisRequestTransferData
     * @type {Integer (Int32)}
     */
    static TransferData => 6

    /**
     * Native name: NdisRequestReset
     * @type {Integer (Int32)}
     */
    static Reset => 7

    /**
     * Native name: NdisRequestGeneric1
     * @type {Integer (Int32)}
     */
    static Generic1 => 8

    /**
     * Native name: NdisRequestGeneric2
     * @type {Integer (Int32)}
     */
    static Generic2 => 9

    /**
     * Native name: NdisRequestGeneric3
     * @type {Integer (Int32)}
     */
    static Generic3 => 10

    /**
     * Native name: NdisRequestGeneric4
     * @type {Integer (Int32)}
     */
    static Generic4 => 11
}
