#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class USER_MARSHAL_CB_TYPE extends Win32Enum {

    /**
     * Native name: USER_MARSHAL_CB_BUFFER_SIZE
     * @type {Integer (Int32)}
     */
    static BUFFER_SIZE => 0

    /**
     * Native name: USER_MARSHAL_CB_MARSHALL
     * @type {Integer (Int32)}
     */
    static MARSHALL => 1

    /**
     * Native name: USER_MARSHAL_CB_UNMARSHALL
     * @type {Integer (Int32)}
     */
    static UNMARSHALL => 2

    /**
     * Native name: USER_MARSHAL_CB_FREE
     * @type {Integer (Int32)}
     */
    static FREE => 3
}
