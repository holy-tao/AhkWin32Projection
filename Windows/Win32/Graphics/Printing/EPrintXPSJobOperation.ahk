#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether an XPS print job is in the spooling or the rendering phase.
 * @remarks
 * This enumeration is primarily used as a parameter for the [**ReportJobProcessingProgress**](reportjobprocessingprogress.md) function.
 * @see https://learn.microsoft.com/windows/win32/printdocs/eprintxpsjoboperation
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class EPrintXPSJobOperation extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static kJobProduction => 1

    /**
     * @type {Integer (Int32)}
     */
    static kJobConsumption => 2
}
