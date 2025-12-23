#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies NLS function capabilities.
 * @see https://learn.microsoft.com/windows/win32/api/winnls/ne-winnls-sysnls_function
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SYSNLS_FUNCTION extends Win32Enum{

    /**
     * Value indicating comparison of two strings in the manner of the <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-comparestringw">CompareString</a> function or <a href="https://docs.microsoft.com/windows/desktop/api/winnls/nf-winnls-lcmapstringa">LCMapString</a> with the LCMAP_SORTKEY flag specified.
     * @type {Integer (Int32)}
     */
    static COMPARE_STRING => 1
}
