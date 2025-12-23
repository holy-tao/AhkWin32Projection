#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_VS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_VS_Default => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_VS_PptpOnly => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_VS_PptpFirst => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_VS_L2tpOnly => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MPR_VS_L2tpFirst => 4
}
