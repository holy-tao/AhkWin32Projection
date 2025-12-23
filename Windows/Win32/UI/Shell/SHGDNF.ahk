#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHGDNF extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SHGDN_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHGDN_INFOLDER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHGDN_FOREDITING => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SHGDN_FORADDRESSBAR => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SHGDN_FORPARSING => 32768
}
