#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 */
class TF_CONTEXT_EDIT_CONTEXT_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: TF_ES_ASYNCDONTCARE
     * @type {Integer (UInt32)}
     */
    static ES_ASYNCDONTCARE => 0

    /**
     * Native name: TF_ES_SYNC
     * @type {Integer (UInt32)}
     */
    static ES_SYNC => 1

    /**
     * Native name: TF_ES_READ
     * @type {Integer (UInt32)}
     */
    static ES_READ => 2

    /**
     * Native name: TF_ES_READWRITE
     * @type {Integer (UInt32)}
     */
    static ES_READWRITE => 6

    /**
     * Native name: TF_ES_ASYNC
     * @type {Integer (UInt32)}
     */
    static ES_ASYNC => 8
}
