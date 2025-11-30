#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBMEMOWNERENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBMEMOWNER_CLIENTOWNED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBMEMOWNER_PROVIDEROWNED => 1
}
