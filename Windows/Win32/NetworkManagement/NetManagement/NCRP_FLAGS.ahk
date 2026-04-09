#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class NCRP_FLAGS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static NCRP_QUERY_PROPERTY_UI => 1

    /**
     * @type {Integer (Int32)}
     */
    static NCRP_SHOW_PROPERTY_UI => 2
}
