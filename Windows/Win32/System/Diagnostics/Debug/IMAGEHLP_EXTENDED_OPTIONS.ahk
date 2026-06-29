#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Lists the extended symbol options that you can get and set by using the SymGetExtendedOption and SymSetExtendedOption functions.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ne-dbghelp-imagehlp_extended_options
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_EXTENDED_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Turns off explicit updates to the last access time of a symbol that is loaded. By default, DbgHelp updates the last access time of a symbol file that is consumed so that a symbol cache can be maintained by using a least recently used mechanism.
     * @type {Integer (Int32)}
     */
    static SYMOPT_EX_DISABLEACCESSTIMEUPDATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SYMOPT_EX_LASTVALIDDEBUGDIRECTORY => 1

    /**
     * @type {Integer (Int32)}
     */
    static SYMOPT_EX_NOIMPLICITPATTERNSEARCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static SYMOPT_EX_NEVERLOADSYMBOLS => 3

    /**
     * Unused.
     * @type {Integer (Int32)}
     */
    static SYMOPT_EX_MAX => 4
}
