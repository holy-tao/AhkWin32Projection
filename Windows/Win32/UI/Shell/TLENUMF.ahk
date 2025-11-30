#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class TLENUMF extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TLEF_RELATIVE_INCLUDE_CURRENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static TLEF_RELATIVE_BACK => 16

    /**
     * @type {Integer (Int32)}
     */
    static TLEF_RELATIVE_FORE => 32

    /**
     * @type {Integer (Int32)}
     */
    static TLEF_INCLUDE_UNINVOKEABLE => 64

    /**
     * @type {Integer (Int32)}
     */
    static TLEF_ABSOLUTE => 49

    /**
     * @type {Integer (Int32)}
     */
    static TLEF_EXCLUDE_SUBFRAME_ENTRIES => 128

    /**
     * @type {Integer (Int32)}
     */
    static TLEF_EXCLUDE_ABOUT_PAGES => 256
}
