#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSITRANSACTION extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static MSITRANSACTION_CHAIN_EMBEDDEDUI => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSITRANSACTION_JOIN_EXISTING_EMBEDDEDUI => 2
}
