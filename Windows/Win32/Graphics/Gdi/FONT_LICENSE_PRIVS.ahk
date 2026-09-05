#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class FONT_LICENSE_PRIVS extends Win32Enum {

    /**
     * Native name: LICENSE_PREVIEWPRINT
     * @type {Integer (UInt32)}
     */
    static PREVIEWPRINT => 4

    /**
     * Native name: LICENSE_EDITABLE
     * @type {Integer (UInt32)}
     */
    static EDITABLE => 8

    /**
     * Native name: LICENSE_INSTALLABLE
     * @type {Integer (UInt32)}
     */
    static INSTALLABLE => 0

    /**
     * Native name: LICENSE_NOEMBEDDING
     * @type {Integer (UInt32)}
     */
    static NOEMBEDDING => 2

    /**
     * Native name: LICENSE_DEFAULT
     * @type {Integer (UInt32)}
     */
    static DEFAULT => 0
}
