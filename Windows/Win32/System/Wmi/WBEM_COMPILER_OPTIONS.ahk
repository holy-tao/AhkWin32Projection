#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains option flags for IMofCompiler methods.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_compiler_options
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_COMPILER_OPTIONS extends Win32Enum {

    /**
     * Native name: WBEM_FLAG_CHECK_ONLY
     * @type {Integer (Int32)}
     */
    static FLAG_CHECK_ONLY => 1

    /**
     * Native name: WBEM_FLAG_AUTORECOVER
     * @type {Integer (Int32)}
     */
    static FLAG_AUTORECOVER => 2

    /**
     * Native name: WBEM_FLAG_WMI_CHECK
     * @type {Integer (Int32)}
     */
    static FLAG_WMI_CHECK => 4

    /**
     * Native name: WBEM_FLAG_CONSOLE_PRINT
     * @type {Integer (Int32)}
     */
    static FLAG_CONSOLE_PRINT => 8

    /**
     * Native name: WBEM_FLAG_DONT_ADD_TO_LIST
     * @type {Integer (Int32)}
     */
    static FLAG_DONT_ADD_TO_LIST => 16

    /**
     * Native name: WBEM_FLAG_SPLIT_FILES
     * @type {Integer (Int32)}
     */
    static FLAG_SPLIT_FILES => 32

    /**
     * Native name: WBEM_FLAG_STORE_FILE
     * @type {Integer (Int32)}
     */
    static FLAG_STORE_FILE => 256
}
