#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
class TXTVIEW extends Win32Enum {

    /**
     * Native name: TXTVIEW_ACTIVE
     * @type {Integer (Int32)}
     */
    static ACTIVE => 0

    /**
     * Native name: TXTVIEW_INACTIVE
     * @type {Integer (Int32)}
     */
    static INACTIVE => -1
}
