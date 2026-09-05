#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
class MPR_VS extends Win32Enum {

    /**
     * Native name: MPR_VS_Default
     * @type {Integer (UInt32)}
     */
    static Default => 0

    /**
     * Native name: MPR_VS_PptpOnly
     * @type {Integer (UInt32)}
     */
    static PptpOnly => 1

    /**
     * Native name: MPR_VS_PptpFirst
     * @type {Integer (UInt32)}
     */
    static PptpFirst => 2

    /**
     * Native name: MPR_VS_L2tpOnly
     * @type {Integer (UInt32)}
     */
    static L2tpOnly => 3

    /**
     * Native name: MPR_VS_L2tpFirst
     * @type {Integer (UInt32)}
     */
    static L2tpFirst => 4
}
