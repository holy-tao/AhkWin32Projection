#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class GDI_IMAGE_TYPE extends Win32Enum {

    /**
     * Native name: IMAGE_BITMAP
     * @type {Integer (UInt32)}
     */
    static BITMAP => 0

    /**
     * Native name: IMAGE_CURSOR
     * @type {Integer (UInt32)}
     */
    static CURSOR => 2

    /**
     * Native name: IMAGE_ICON
     * @type {Integer (UInt32)}
     */
    static ICON => 1
}
