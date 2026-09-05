#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PNRP_SCOPE extends Win32Enum {

    /**
     * Native name: PNRP_SCOPE_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 0

    /**
     * Native name: PNRP_GLOBAL_SCOPE
     * @type {Integer (Int32)}
     */
    static GLOBAL_SCOPE => 1

    /**
     * Native name: PNRP_SITE_LOCAL_SCOPE
     * @type {Integer (Int32)}
     */
    static SITE_LOCAL_SCOPE => 2

    /**
     * Native name: PNRP_LINK_LOCAL_SCOPE
     * @type {Integer (Int32)}
     */
    static LINK_LOCAL_SCOPE => 3
}
