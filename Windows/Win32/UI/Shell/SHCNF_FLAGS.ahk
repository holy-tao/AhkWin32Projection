#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SHCNF_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: SHCNF_IDLIST
     * @type {Integer (UInt32)}
     */
    static IDLIST => 0

    /**
     * Native name: SHCNF_PATHA
     * @type {Integer (UInt32)}
     */
    static PATHA => 1

    /**
     * Native name: SHCNF_PRINTERA
     * @type {Integer (UInt32)}
     */
    static PRINTERA => 2

    /**
     * Native name: SHCNF_DWORD
     * @type {Integer (UInt32)}
     */
    static DWORD => 3

    /**
     * Native name: SHCNF_PATHW
     * @type {Integer (UInt32)}
     */
    static PATHW => 5

    /**
     * Native name: SHCNF_PRINTERW
     * @type {Integer (UInt32)}
     */
    static PRINTERW => 6

    /**
     * Native name: SHCNF_TYPE
     * @type {Integer (UInt32)}
     */
    static TYPE => 255

    /**
     * Native name: SHCNF_FLUSH
     * @type {Integer (UInt32)}
     */
    static FLUSH => 4096

    /**
     * Native name: SHCNF_FLUSHNOWAIT
     * @type {Integer (UInt32)}
     */
    static FLUSHNOWAIT => 12288

    /**
     * Native name: SHCNF_NOTIFYRECURSIVE
     * @type {Integer (UInt32)}
     */
    static NOTIFYRECURSIVE => 65536

    /**
     * Native name: SHCNF_PATH
     * @type {Integer (UInt32)}
     */
    static PATH => 5

    /**
     * Native name: SHCNF_PRINTER
     * @type {Integer (UInt32)}
     */
    static PRINTER => 6
}
