#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The children of the indicated feature are included in the cost.
 * @see https://learn.microsoft.com/windows/win32/api/msiquery/nf-msiquery-msigetfeaturecosta
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class MSICOSTTREE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MSICOSTTREE_SELFONLY => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSICOSTTREE_CHILDREN => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSICOSTTREE_PARENTS => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSICOSTTREE_RESERVED => 3
}
