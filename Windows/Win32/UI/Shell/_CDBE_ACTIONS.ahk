#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class _CDBE_ACTIONS extends Win32Enum {

    /**
     * Native name: CDBE_TYPE_MUSIC
     * @type {Integer (Int32)}
     */
    static TYPE_MUSIC => 1

    /**
     * Native name: CDBE_TYPE_DATA
     * @type {Integer (Int32)}
     */
    static TYPE_DATA => 2

    /**
     * Native name: CDBE_TYPE_ALL
     * @type {Integer (Int32)}
     */
    static TYPE_ALL => -1
}
