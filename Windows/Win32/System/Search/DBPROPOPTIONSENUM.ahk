#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBPROPOPTIONSENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPOPTIONS_REQUIRED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPOPTIONS_SETIFCHEAP => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPROPOPTIONS_OPTIONAL => 1
}
