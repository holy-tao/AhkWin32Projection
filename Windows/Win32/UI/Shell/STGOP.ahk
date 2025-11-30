#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class STGOP extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static STGOP_MOVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static STGOP_COPY => 2

    /**
     * @type {Integer (Int32)}
     */
    static STGOP_SYNC => 3

    /**
     * @type {Integer (Int32)}
     */
    static STGOP_REMOVE => 5

    /**
     * @type {Integer (Int32)}
     */
    static STGOP_RENAME => 6

    /**
     * @type {Integer (Int32)}
     */
    static STGOP_APPLYPROPERTIES => 8

    /**
     * @type {Integer (Int32)}
     */
    static STGOP_NEW => 10
}
