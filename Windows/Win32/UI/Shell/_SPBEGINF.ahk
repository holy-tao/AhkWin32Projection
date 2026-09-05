#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by IActionProgress::Begin, these constants specify certain UI operations that are to be enabled or disabled.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_spbeginf
 * @namespace Windows.Win32.UI.Shell
 */
class _SPBEGINF extends Win32Enum {

    /**
     * Indicates default progress behavior.
     * Native name: SPBEGINF_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Indicates that the progress UI should automatically update a text field with the amount of time remaining until the action completes.
     * Native name: SPBEGINF_AUTOTIME
     * @type {Integer (Int32)}
     */
    static AUTOTIME => 2

    /**
     * Indicates that the UI should not display a progress bar.
     * Native name: SPBEGINF_NOPROGRESSBAR
     * @type {Integer (Int32)}
     */
    static NOPROGRESSBAR => 16

    /**
     * Indicates that the UI should use a marquee-style progress bar.
     * Native name: SPBEGINF_MARQUEEPROGRESS
     * @type {Integer (Int32)}
     */
    static MARQUEEPROGRESS => 32

    /**
     * Indicates that the UI should not include a <b>Cancel</b> button.
     * Native name: SPBEGINF_NOCANCELBUTTON
     * @type {Integer (Int32)}
     */
    static NOCANCELBUTTON => 64
}
