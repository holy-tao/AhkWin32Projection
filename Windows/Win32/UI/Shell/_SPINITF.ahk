#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class _SPINITF extends Win32Enum {

    /**
     * Native name: SPINITF_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: SPINITF_MODAL
     * @type {Integer (Int32)}
     */
    static MODAL => 1

    /**
     * Native name: SPINITF_NOMINIMIZE
     * @type {Integer (Int32)}
     */
    static NOMINIMIZE => 8
}
