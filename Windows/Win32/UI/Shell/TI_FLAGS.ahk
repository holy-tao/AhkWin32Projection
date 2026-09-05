#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class TI_FLAGS extends Win32Enum {

    /**
     * Native name: TI_BITMAP
     * @type {Integer (Int32)}
     */
    static BITMAP => 1

    /**
     * Native name: TI_JPEG
     * @type {Integer (Int32)}
     */
    static JPEG => 2
}
