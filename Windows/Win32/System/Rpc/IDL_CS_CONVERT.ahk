#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class IDL_CS_CONVERT extends Win32Enum {

    /**
     * Native name: IDL_CS_NO_CONVERT
     * @type {Integer (Int32)}
     */
    static NO_CONVERT => 0

    /**
     * Native name: IDL_CS_IN_PLACE_CONVERT
     * @type {Integer (Int32)}
     */
    static IN_PLACE_CONVERT => 1

    /**
     * Native name: IDL_CS_NEW_BUFFER_CONVERT
     * @type {Integer (Int32)}
     */
    static NEW_BUFFER_CONVERT => 2
}
