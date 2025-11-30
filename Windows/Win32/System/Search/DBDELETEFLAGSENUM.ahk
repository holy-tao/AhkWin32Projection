#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBDELETEFLAGSENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBDELETE_ASYNC => 256

    /**
     * @type {Integer (Int32)}
     */
    static DBDELETE_ATOMIC => 4096
}
