#Requires AutoHotkey v2.0.0 64-bit

/**
 * Lists the extended symbol options that you can get and set by using the SymGetExtendedOption and SymSetExtendedOption functions.
 * @see https://docs.microsoft.com/windows/win32/api//dbghelp/ne-dbghelp-imagehlp_extended_options
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_EXTENDED_OPTIONS{

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
