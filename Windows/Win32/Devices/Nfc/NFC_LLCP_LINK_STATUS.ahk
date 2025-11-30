#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_LLCP_LINK_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LinkActivated => 0

    /**
     * @type {Integer (Int32)}
     */
    static LinkDeactivated => 1
}
