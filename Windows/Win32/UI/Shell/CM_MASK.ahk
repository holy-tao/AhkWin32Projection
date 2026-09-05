#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates which values in the CM_COLUMNINFO structure should be set during calls to IColumnManager::SetColumnInfo.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-cm_mask
 * @namespace Windows.Win32.UI.Shell
 */
class CM_MASK extends Win32BitflagEnum {

    /**
     * The <b>uWidth</b> member is specified.
     * Native name: CM_MASK_WIDTH
     * @type {Integer (Int32)}
     */
    static WIDTH => 1

    /**
     * The <b>uDefaultWidth</b> member is specified.
     * Native name: CM_MASK_DEFAULTWIDTH
     * @type {Integer (Int32)}
     */
    static DEFAULTWIDTH => 2

    /**
     * The <b>uIdealWidth</b> member is specified.
     * Native name: CM_MASK_IDEALWIDTH
     * @type {Integer (Int32)}
     */
    static IDEALWIDTH => 4

    /**
     * The <b>wszName</b> member is specified.
     * Native name: CM_MASK_NAME
     * @type {Integer (Int32)}
     */
    static NAME => 8

    /**
     * The <b>dwState</b> member is specified.
     * Native name: CM_MASK_STATE
     * @type {Integer (Int32)}
     */
    static STATE => 16
}
