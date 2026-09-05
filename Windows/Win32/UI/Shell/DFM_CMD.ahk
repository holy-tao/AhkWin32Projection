#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class DFM_CMD extends Win32Enum {

    /**
     * Native name: DFM_CMD_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => -1

    /**
     * Native name: DFM_CMD_MOVE
     * @type {Integer (Int32)}
     */
    static MOVE => -2

    /**
     * Native name: DFM_CMD_COPY
     * @type {Integer (Int32)}
     */
    static COPY => -3

    /**
     * Native name: DFM_CMD_LINK
     * @type {Integer (Int32)}
     */
    static LINK => -4

    /**
     * Native name: DFM_CMD_PROPERTIES
     * @type {Integer (Int32)}
     */
    static PROPERTIES => -5

    /**
     * Native name: DFM_CMD_NEWFOLDER
     * @type {Integer (Int32)}
     */
    static NEWFOLDER => -6

    /**
     * Native name: DFM_CMD_PASTE
     * @type {Integer (Int32)}
     */
    static PASTE => -7

    /**
     * Native name: DFM_CMD_VIEWLIST
     * @type {Integer (Int32)}
     */
    static VIEWLIST => -8

    /**
     * Native name: DFM_CMD_VIEWDETAILS
     * @type {Integer (Int32)}
     */
    static VIEWDETAILS => -9

    /**
     * Native name: DFM_CMD_PASTELINK
     * @type {Integer (Int32)}
     */
    static PASTELINK => -10

    /**
     * Native name: DFM_CMD_PASTESPECIAL
     * @type {Integer (Int32)}
     */
    static PASTESPECIAL => -11

    /**
     * Native name: DFM_CMD_MODALPROP
     * @type {Integer (Int32)}
     */
    static MODALPROP => -12

    /**
     * Native name: DFM_CMD_RENAME
     * @type {Integer (Int32)}
     */
    static RENAME => -13
}
