#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_PARAMETER_TYPE extends Win32Enum {

    /**
     * Native name: NdisParameterInteger
     * @type {Integer (Int32)}
     */
    static Integer => 0

    /**
     * Native name: NdisParameterHexInteger
     * @type {Integer (Int32)}
     */
    static HexInteger => 1

    /**
     * Native name: NdisParameterString
     * @type {Integer (Int32)}
     */
    static String => 2

    /**
     * Native name: NdisParameterMultiString
     * @type {Integer (Int32)}
     */
    static MultiString => 3

    /**
     * Native name: NdisParameterBinary
     * @type {Integer (Int32)}
     */
    static Binary => 4
}
