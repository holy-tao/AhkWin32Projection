#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class NCPNP_RECONFIG_LAYER extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static NCRL_NDIS => 1

    /**
     * @type {Integer (Int32)}
     */
    static NCRL_TDI => 2
}
