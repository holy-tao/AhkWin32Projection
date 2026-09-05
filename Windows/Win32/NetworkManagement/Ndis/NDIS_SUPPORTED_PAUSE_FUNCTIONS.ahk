#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_SUPPORTED_PAUSE_FUNCTIONS extends Win32Enum {

    /**
     * Native name: NdisPauseFunctionsUnsupported
     * @type {Integer (Int32)}
     */
    static Unsupported => 0

    /**
     * Native name: NdisPauseFunctionsSendOnly
     * @type {Integer (Int32)}
     */
    static SendOnly => 1

    /**
     * Native name: NdisPauseFunctionsReceiveOnly
     * @type {Integer (Int32)}
     */
    static ReceiveOnly => 2

    /**
     * Native name: NdisPauseFunctionsSendAndReceive
     * @type {Integer (Int32)}
     */
    static SendAndReceive => 3

    /**
     * Native name: NdisPauseFunctionsUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 4
}
