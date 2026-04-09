#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
class TXTBACKSTYLE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static TXTBACK_TRANSPARENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static TXTBACK_OPAQUE => 1
}
