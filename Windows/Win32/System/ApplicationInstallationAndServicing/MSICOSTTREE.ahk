#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSICOSTTREE extends Win32Enum {

    /**
     * Native name: MSICOSTTREE_SELFONLY
     * @type {Integer (Int32)}
     */
    static SELFONLY => 0

    /**
     * Native name: MSICOSTTREE_CHILDREN
     * @type {Integer (Int32)}
     */
    static CHILDREN => 1

    /**
     * Native name: MSICOSTTREE_PARENTS
     * @type {Integer (Int32)}
     */
    static PARENTS => 2

    /**
     * Native name: MSICOSTTREE_RESERVED
     * @type {Integer (Int32)}
     */
    static RESERVED => 3
}
