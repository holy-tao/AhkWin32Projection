#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class NCRP_FLAGS extends Win32Enum {

    /**
     * Native name: NCRP_QUERY_PROPERTY_UI
     * @type {Integer (Int32)}
     */
    static QUERY_PROPERTY_UI => 1

    /**
     * Native name: NCRP_SHOW_PROPERTY_UI
     * @type {Integer (Int32)}
     */
    static SHOW_PROPERTY_UI => 2
}
