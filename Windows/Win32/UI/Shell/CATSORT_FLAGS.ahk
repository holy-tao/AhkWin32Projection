#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies methods for sorting category data.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-catsort_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CATSORT_FLAGS{

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
