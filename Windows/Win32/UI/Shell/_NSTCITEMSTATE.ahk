#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the state of a tree item. These values are used by methods of the INameSpaceTreeControl interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _NSTCITEMSTATE extends Win32Enum{

    /**
     * The item has default state; it is not selected, expanded, bolded or disabled.
     * @type {Integer (Int32)}
     */
    static NSTCIS_NONE => 0

    /**
     * The item is selected.
     * @type {Integer (Int32)}
     */
    static NSTCIS_SELECTED => 1

    /**
     * The item is expanded.
     * @type {Integer (Int32)}
     */
    static NSTCIS_EXPANDED => 2

    /**
     * The item is bold.
     * @type {Integer (Int32)}
     */
    static NSTCIS_BOLD => 4

    /**
     * The item is disabled.
     * @type {Integer (Int32)}
     */
    static NSTCIS_DISABLED => 8

    /**
     * <b>Windows 7 and later</b>. The item is selected, but not expanded.
     * @type {Integer (Int32)}
     */
    static NSTCIS_SELECTEDNOEXPAND => 16
}
