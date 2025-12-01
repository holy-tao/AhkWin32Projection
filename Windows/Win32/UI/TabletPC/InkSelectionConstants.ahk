#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the first element or all elements within a group of points or packet values are used.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkselectionconstants
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkSelectionConstants extends Win32Enum{

    /**
     * The first element is used.
     * @type {Integer (Int32)}
     */
    static ISC_FirstElement => 0

    /**
     * All elements are used.
     * @type {Integer (Int32)}
     */
    static ISC_AllElements => -1
}
