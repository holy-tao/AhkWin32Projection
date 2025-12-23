#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class IDL_CS_CONVERT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IDL_CS_NO_CONVERT => 0

    /**
     * @type {Integer (Int32)}
     */
    static IDL_CS_IN_PLACE_CONVERT => 1

    /**
     * @type {Integer (Int32)}
     */
    static IDL_CS_NEW_BUFFER_CONVERT => 2
}
