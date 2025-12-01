#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the execution context of the printer driver that calls GetPrintExecutionData.
 * @see https://learn.microsoft.com/windows/win32/printdocs/print-execution-data
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PRINT_EXECUTION_DATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The [**PRINT\_EXECUTION\_CONTEXT**](print-execution-context.md) value that represents the current execution context of the printer driver.
     * @type {Integer}
     */
    context {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * If the value of **context** is **PRINT\_EXECUTION\_CONTEXT\_WOW64**, **clientAppPID** identifies the client application on whose behalf the splwow64.exe process loaded the printer driver. If the value of **context** is not **PRINT\_EXECUTION\_CONTEXT\_WOW64**, **clientAppPID** is zero.
     * @type {Integer}
     */
    clientAppPID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
