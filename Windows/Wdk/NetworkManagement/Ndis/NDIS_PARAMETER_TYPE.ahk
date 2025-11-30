#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_PARAMETER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NdisParameterInteger => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisParameterHexInteger => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisParameterString => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisParameterMultiString => 3

    /**
     * @type {Integer (Int32)}
     */
    static NdisParameterBinary => 4
}
