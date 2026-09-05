#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
class NFC_LLCP_LINK_STATUS extends Win32Enum {

    /**
     * Native name: LinkActivated
     * @type {Integer (Int32)}
     */
    static Activated => 0

    /**
     * Native name: LinkDeactivated
     * @type {Integer (Int32)}
     */
    static Deactivated => 1
}
