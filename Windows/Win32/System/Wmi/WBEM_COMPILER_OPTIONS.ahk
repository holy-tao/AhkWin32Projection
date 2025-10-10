#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains option flags for IMofCompiler methods.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/ne-wbemcli-wbem_compiler_options
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_COMPILER_OPTIONS{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_CHECK_ONLY => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_AUTORECOVER => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_WMI_CHECK => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_CONSOLE_PRINT => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_DONT_ADD_TO_LIST => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_SPLIT_FILES => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_STORE_FILE => 256
}
