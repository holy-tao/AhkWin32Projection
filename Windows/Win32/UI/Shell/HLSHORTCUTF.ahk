#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class HLSHORTCUTF extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HLSHORTCUTF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static HLSHORTCUTF_DONTACTUALLYCREATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static HLSHORTCUTF_USEFILENAMEFROMFRIENDLYNAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static HLSHORTCUTF_USEUNIQUEFILENAME => 4

    /**
     * @type {Integer (Int32)}
     */
    static HLSHORTCUTF_MAYUSEEXISTINGSHORTCUT => 8
}
