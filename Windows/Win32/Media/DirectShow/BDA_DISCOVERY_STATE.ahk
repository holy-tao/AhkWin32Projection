#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_DISCOVERY_STATE extends Win32Enum {

    /**
     * Native name: BDA_DISCOVERY_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 0

    /**
     * Native name: BDA_DISCOVERY_REQUIRED
     * @type {Integer (Int32)}
     */
    static REQUIRED => 1

    /**
     * Native name: BDA_DISCOVERY_COMPLETE
     * @type {Integer (Int32)}
     */
    static COMPLETE => 2
}
