#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBASYNCHPHASEENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBASYNCHPHASE_INITIALIZATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBASYNCHPHASE_POPULATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBASYNCHPHASE_COMPLETE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBASYNCHPHASE_CANCELED => 3
}
