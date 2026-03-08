#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Column names are returned.
 * @see https://learn.microsoft.com/windows/win32/api/msiquery/nf-msiquery-msiviewgetcolumninfo
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class MSICOLINFO extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MSICOLINFO_NAMES => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSICOLINFO_TYPES => 1
}
