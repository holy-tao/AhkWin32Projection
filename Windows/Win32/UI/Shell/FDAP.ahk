#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies list placement.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-fdap
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FDAP extends Win32Enum{

    /**
     * The place is added to the bottom of the default list.
     * @type {Integer (Int32)}
     */
    static FDAP_BOTTOM => 0

    /**
     * The place is added to the top of the default list.
     * @type {Integer (Int32)}
     */
    static FDAP_TOP => 1
}
