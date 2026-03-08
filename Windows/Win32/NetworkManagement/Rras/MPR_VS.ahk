#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * RRAS dials PPTP first. If PPTP fails, L2TP is attempted. The protocol that succeeds is tried first in subsequent dialing for this entry.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_interface_2
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
