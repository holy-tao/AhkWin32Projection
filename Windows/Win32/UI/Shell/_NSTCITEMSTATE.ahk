#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _NSTCITEMSTATE{

    /**
     * @type {Integer (Int32)}
     */
    static NSTCIS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NSTCIS_SELECTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static NSTCIS_EXPANDED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NSTCIS_BOLD => 4

    /**
     * @type {Integer (Int32)}
     */
    static NSTCIS_DISABLED => 8

    /**
     * @type {Integer (Int32)}
     */
    static NSTCIS_SELECTEDNOEXPAND => 16
}
