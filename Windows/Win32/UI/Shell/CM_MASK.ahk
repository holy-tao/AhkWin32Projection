#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates which values in the CM_COLUMNINFO structure should be set during calls to IColumnManager::SetColumnInfo.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-cm_mask
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CM_MASK {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
