#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies column state values. Used by members of the IColumnManager interface through the CM_COLUMNINFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-cm_state
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CM_STATE extends Win32BitflagEnum{

    /**
     * The column is not currently displayed.
     * @type {Integer (Int32)}
     */
    static CM_STATE_NONE => 0

    /**
     * The column is currently displayed.
     * @type {Integer (Int32)}
     */
    static CM_STATE_VISIBLE => 1

    /**
     * The column cannot be resized.
     * @type {Integer (Int32)}
     */
    static CM_STATE_FIXEDWIDTH => 2

    /**
     * Do not sort folders separately.
     * @type {Integer (Int32)}
     */
    static CM_STATE_NOSORTBYFOLDERNESS => 4

    /**
     * The column cannot be hidden.
     * @type {Integer (Int32)}
     */
    static CM_STATE_ALWAYSVISIBLE => 8
}
