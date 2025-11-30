#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NCPNP_RECONFIG_LAYER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NCRL_NDIS => 1

    /**
     * @type {Integer (Int32)}
     */
    static NCRL_TDI => 2
}
