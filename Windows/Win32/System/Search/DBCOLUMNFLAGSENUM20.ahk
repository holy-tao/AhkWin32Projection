#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBCOLUMNFLAGSENUM20 extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_SCALEISNEGATIVE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DBCOLUMNFLAGS_RESERVED => 32768
}
