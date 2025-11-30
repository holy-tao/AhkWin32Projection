#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBEVENTPHASEENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBEVENTPHASE_OKTODO => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBEVENTPHASE_ABOUTTODO => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBEVENTPHASE_SYNCHAFTER => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBEVENTPHASE_FAILEDTODO => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBEVENTPHASE_DIDEVENT => 4
}
