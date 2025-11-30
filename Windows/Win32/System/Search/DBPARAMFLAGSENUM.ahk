#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBPARAMFLAGSENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBPARAMFLAGS_ISINPUT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPARAMFLAGS_ISOUTPUT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPARAMFLAGS_ISSIGNED => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBPARAMFLAGS_ISNULLABLE => 64

    /**
     * @type {Integer (Int32)}
     */
    static DBPARAMFLAGS_ISLONG => 128
}
