#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class HLSHORTCUTF extends Win32Enum {

    /**
     * Native name: HLSHORTCUTF_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: HLSHORTCUTF_DONTACTUALLYCREATE
     * @type {Integer (Int32)}
     */
    static DONTACTUALLYCREATE => 1

    /**
     * Native name: HLSHORTCUTF_USEFILENAMEFROMFRIENDLYNAME
     * @type {Integer (Int32)}
     */
    static USEFILENAMEFROMFRIENDLYNAME => 2

    /**
     * Native name: HLSHORTCUTF_USEUNIQUEFILENAME
     * @type {Integer (Int32)}
     */
    static USEUNIQUEFILENAME => 4

    /**
     * Native name: HLSHORTCUTF_MAYUSEEXISTINGSHORTCUT
     * @type {Integer (Int32)}
     */
    static MAYUSEEXISTINGSHORTCUT => 8
}
