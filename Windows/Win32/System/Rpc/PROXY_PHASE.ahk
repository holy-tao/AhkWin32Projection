#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class PROXY_PHASE extends Win32Enum {

    /**
     * Native name: PROXY_CALCSIZE
     * @type {Integer (Int32)}
     */
    static CALCSIZE => 0

    /**
     * Native name: PROXY_GETBUFFER
     * @type {Integer (Int32)}
     */
    static GETBUFFER => 1

    /**
     * Native name: PROXY_MARSHAL
     * @type {Integer (Int32)}
     */
    static MARSHAL => 2

    /**
     * Native name: PROXY_SENDRECEIVE
     * @type {Integer (Int32)}
     */
    static SENDRECEIVE => 3

    /**
     * Native name: PROXY_UNMARSHAL
     * @type {Integer (Int32)}
     */
    static UNMARSHAL => 4
}
