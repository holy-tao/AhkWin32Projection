#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class TXTVIEW extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TXTVIEW_ACTIVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static TXTVIEW_INACTIVE => -1
}
