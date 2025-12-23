#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ENDCOMPOSITIONNOTIFY_CODE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static ECN_ENDCOMPOSITION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ECN_NEWTEXT => 2
}
