#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies width values in pixels and includes special support for default and autosize. Used by members of the IColumnManager interface through the CM_COLUMNINFO structure.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-cm_set_width_value
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CM_SET_WIDTH_VALUE{

    /**
     * Use the default width.
     * @type {Integer (Int32)}
     */
    static CM_WIDTH_USEDEFAULT => -1

    /**
     * Use the auto-size width.
     * @type {Integer (Int32)}
     */
    static CM_WIDTH_AUTOSIZE => -2
}
