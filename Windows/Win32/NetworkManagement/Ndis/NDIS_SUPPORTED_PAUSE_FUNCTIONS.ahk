#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_SUPPORTED_PAUSE_FUNCTIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NdisPauseFunctionsUnsupported => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisPauseFunctionsSendOnly => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisPauseFunctionsReceiveOnly => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisPauseFunctionsSendAndReceive => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisPauseFunctionsUnknown => 4
}
