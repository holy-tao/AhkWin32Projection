#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the caching of a handle for a printer opened with OpenPrinter2.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printer-option-flags
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PRINTER_OPTION_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
