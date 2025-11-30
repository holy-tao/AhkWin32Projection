#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MODLOAD_DATA_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DBHHEADER_DEBUGDIRS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBHHEADER_CVMISC => 2
}
