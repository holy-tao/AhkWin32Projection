#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the caching of a handle for a printer opened with OpenPrinter2.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-option-flags
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PRINTER_OPTION_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PRINTER_OPTION_NO_CACHE => 1

    /**
     * @type {Integer (Int32)}
     */
    static PRINTER_OPTION_CACHE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PRINTER_OPTION_CLIENT_CHANGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static PRINTER_OPTION_NO_CLIENT_DATA => 8
}
