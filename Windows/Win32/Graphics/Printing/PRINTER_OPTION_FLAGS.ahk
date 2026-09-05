#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the caching of a handle for a printer opened with OpenPrinter2.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-option-flags
 * @namespace Windows.Win32.Graphics.Printing
 */
class PRINTER_OPTION_FLAGS extends Win32Enum {

    /**
     * Native name: PRINTER_OPTION_NO_CACHE
     * @type {Integer (Int32)}
     */
    static NO_CACHE => 1

    /**
     * Native name: PRINTER_OPTION_CACHE
     * @type {Integer (Int32)}
     */
    static CACHE => 2

    /**
     * Native name: PRINTER_OPTION_CLIENT_CHANGE
     * @type {Integer (Int32)}
     */
    static CLIENT_CHANGE => 4

    /**
     * Native name: PRINTER_OPTION_NO_CLIENT_DATA
     * @type {Integer (Int32)}
     */
    static NO_CLIENT_DATA => 8
}
