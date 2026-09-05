#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the execution context when GetPrintExecutionData is called.
 * @see https://learn.microsoft.com/windows/win32/printdocs/print-execution-context
 * @namespace Windows.Win32.Graphics.Printing
 */
class PRINT_EXECUTION_CONTEXT extends Win32Enum {

    /**
     * Native name: PRINT_EXECUTION_CONTEXT_APPLICATION
     * @type {Integer (Int32)}
     */
    static APPLICATION => 0

    /**
     * Native name: PRINT_EXECUTION_CONTEXT_SPOOLER_SERVICE
     * @type {Integer (Int32)}
     */
    static SPOOLER_SERVICE => 1

    /**
     * Native name: PRINT_EXECUTION_CONTEXT_SPOOLER_ISOLATION_HOST
     * @type {Integer (Int32)}
     */
    static SPOOLER_ISOLATION_HOST => 2

    /**
     * Native name: PRINT_EXECUTION_CONTEXT_FILTER_PIPELINE
     * @type {Integer (Int32)}
     */
    static FILTER_PIPELINE => 3

    /**
     * Native name: PRINT_EXECUTION_CONTEXT_WOW64
     * @type {Integer (Int32)}
     */
    static WOW64 => 4
}
