#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class TXFS_MINIVERSION extends Win32Enum {

    /**
     * Native name: TXFS_MINIVERSION_COMMITTED_VIEW
     * @type {Integer (UInt32)}
     */
    static COMMITTED_VIEW => 0

    /**
     * Native name: TXFS_MINIVERSION_DIRTY_VIEW
     * @type {Integer (UInt32)}
     */
    static DIRTY_VIEW => 65535

    /**
     * Native name: TXFS_MINIVERSION_DEFAULT_VIEW
     * @type {Integer (UInt32)}
     */
    static DEFAULT_VIEW => 65534
}
