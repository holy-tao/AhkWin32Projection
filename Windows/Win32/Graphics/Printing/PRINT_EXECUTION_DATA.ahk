#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRINT_EXECUTION_CONTEXT.ahk" { PRINT_EXECUTION_CONTEXT }

/**
 * Contains the execution context of the printer driver that calls GetPrintExecutionData.
 * @see https://learn.microsoft.com/windows/win32/printdocs/print-execution-data
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINT_EXECUTION_DATA {
    #StructPack 4

    /**
     * The [**PRINT\_EXECUTION\_CONTEXT**](print-execution-context.md) value that represents the current execution context of the printer driver.
     */
    context : PRINT_EXECUTION_CONTEXT

    /**
     * If the value of **context** is **PRINT\_EXECUTION\_CONTEXT\_WOW64**, **clientAppPID** identifies the client application on whose behalf the splwow64.exe process loaded the printer driver. If the value of **context** is not **PRINT\_EXECUTION\_CONTEXT\_WOW64**, **clientAppPID** is zero.
     */
    clientAppPID : UInt32

}
