#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class USER_MARSHAL_CB_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static USER_MARSHAL_CB_BUFFER_SIZE => 0

    /**
     * @type {Integer (Int32)}
     */
    static USER_MARSHAL_CB_MARSHALL => 1

    /**
     * @type {Integer (Int32)}
     */
    static USER_MARSHAL_CB_UNMARSHALL => 2

    /**
     * @type {Integer (Int32)}
     */
    static USER_MARSHAL_CB_FREE => 3
}
