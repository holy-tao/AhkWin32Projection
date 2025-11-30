#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class PROXY_PHASE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PROXY_CALCSIZE => 0

    /**
     * @type {Integer (Int32)}
     */
    static PROXY_GETBUFFER => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROXY_MARSHAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROXY_SENDRECEIVE => 3

    /**
     * @type {Integer (Int32)}
     */
    static PROXY_UNMARSHAL => 4
}
