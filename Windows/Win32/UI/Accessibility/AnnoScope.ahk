#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
class AnnoScope extends Win32Enum {

    /**
     * Native name: ANNO_THIS
     * @type {Integer (Int32)}
     */
    static THIS => 0

    /**
     * Native name: ANNO_CONTAINER
     * @type {Integer (Int32)}
     */
    static CONTAINER => 1
}
