#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class COMPLETION_STATUS_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COMPSTAT_NOUPDATEOK => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMPSTAT_WAIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMPSTAT_ABORT => 4
}
