#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates which values in the CM_COLUMNINFO structure should be set during calls to IColumnManager::SetColumnInfo.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-cm_mask
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CM_MASK extends Win32BitflagEnum{

    /**
     * The <b>uWidth</b> member is specified.
     * @type {Integer (Int32)}
     */
    static CM_MASK_WIDTH => 1

    /**
     * The <b>uDefaultWidth</b> member is specified.
     * @type {Integer (Int32)}
     */
    static CM_MASK_DEFAULTWIDTH => 2

    /**
     * The <b>uIdealWidth</b> member is specified.
     * @type {Integer (Int32)}
     */
    static CM_MASK_IDEALWIDTH => 4

    /**
     * The <b>wszName</b> member is specified.
     * @type {Integer (Int32)}
     */
    static CM_MASK_NAME => 8

    /**
     * The <b>dwState</b> member is specified.
     * @type {Integer (Int32)}
     */
    static CM_MASK_STATE => 16
}
