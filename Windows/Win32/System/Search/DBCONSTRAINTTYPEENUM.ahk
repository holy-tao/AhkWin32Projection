#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBCONSTRAINTTYPEENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBCONSTRAINTTYPE_UNIQUE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBCONSTRAINTTYPE_FOREIGNKEY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBCONSTRAINTTYPE_PRIMARYKEY => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBCONSTRAINTTYPE_CHECK => 3
}
