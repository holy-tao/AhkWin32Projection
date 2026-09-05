#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies column state values. Used by members of the IColumnManager interface through the CM_COLUMNINFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-cm_state
 * @namespace Windows.Win32.UI.Shell
 */
class CM_STATE extends Win32BitflagEnum {

    /**
     * The column is not currently displayed.
     * Native name: CM_STATE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The column is currently displayed.
     * Native name: CM_STATE_VISIBLE
     * @type {Integer (Int32)}
     */
    static VISIBLE => 1

    /**
     * The column cannot be resized.
     * Native name: CM_STATE_FIXEDWIDTH
     * @type {Integer (Int32)}
     */
    static FIXEDWIDTH => 2

    /**
     * Do not sort folders separately.
     * Native name: CM_STATE_NOSORTBYFOLDERNESS
     * @type {Integer (Int32)}
     */
    static NOSORTBYFOLDERNESS => 4

    /**
     * The column cannot be hidden.
     * Native name: CM_STATE_ALWAYSVISIBLE
     * @type {Integer (Int32)}
     */
    static ALWAYSVISIBLE => 8
}
