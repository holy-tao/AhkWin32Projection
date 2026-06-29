#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies methods for sorting category data.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-catsort_flags
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CATSORT_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use the default sort order.
     * @type {Integer (Int32)}
     */
    static CATSORT_DEFAULT => 0

    /**
     * Use a method that sorts on category names.
     * @type {Integer (Int32)}
     */
    static CATSORT_NAME => 1
}
