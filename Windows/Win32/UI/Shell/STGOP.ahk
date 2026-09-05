#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class STGOP extends Win32Enum {

    /**
     * Native name: STGOP_MOVE
     * @type {Integer (Int32)}
     */
    static MOVE => 1

    /**
     * Native name: STGOP_COPY
     * @type {Integer (Int32)}
     */
    static COPY => 2

    /**
     * Native name: STGOP_SYNC
     * @type {Integer (Int32)}
     */
    static SYNC => 3

    /**
     * Native name: STGOP_REMOVE
     * @type {Integer (Int32)}
     */
    static REMOVE => 5

    /**
     * Native name: STGOP_RENAME
     * @type {Integer (Int32)}
     */
    static RENAME => 6

    /**
     * Native name: STGOP_APPLYPROPERTIES
     * @type {Integer (Int32)}
     */
    static APPLYPROPERTIES => 8

    /**
     * Native name: STGOP_NEW
     * @type {Integer (Int32)}
     */
    static NEW => 10
}
