#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSITRANSACTION extends Win32Enum {

    /**
     * Native name: MSITRANSACTION_CHAIN_EMBEDDEDUI
     * @type {Integer (Int32)}
     */
    static CHAIN_EMBEDDEDUI => 1

    /**
     * Native name: MSITRANSACTION_JOIN_EXISTING_EMBEDDEDUI
     * @type {Integer (Int32)}
     */
    static JOIN_EXISTING_EMBEDDEDUI => 2
}
