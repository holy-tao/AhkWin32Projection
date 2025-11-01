#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/printdocs/print-execution-context
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PRINT_EXECUTION_CONTEXT{

    /**
     * @type {Integer (Int32)}
     */
    static PRINT_EXECUTION_CONTEXT_APPLICATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static PRINT_EXECUTION_CONTEXT_SPOOLER_SERVICE => 1

    /**
     * @type {Integer (Int32)}
     */
    static PRINT_EXECUTION_CONTEXT_SPOOLER_ISOLATION_HOST => 2

    /**
     * @type {Integer (Int32)}
     */
    static PRINT_EXECUTION_CONTEXT_FILTER_PIPELINE => 3

    /**
     * @type {Integer (Int32)}
     */
    static PRINT_EXECUTION_CONTEXT_WOW64 => 4
}
