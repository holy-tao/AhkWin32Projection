#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by members of the IColumnManager interface to specify which set of columns are being requested, either all or only those currently visible.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-cm_enum_flags
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CM_ENUM_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Enumerate all.
     * @type {Integer (Int32)}
     */
    static CM_ENUM_ALL => 1

    /**
     * Enumerate visible.
     * @type {Integer (Int32)}
     */
    static CM_ENUM_VISIBLE => 2
}
