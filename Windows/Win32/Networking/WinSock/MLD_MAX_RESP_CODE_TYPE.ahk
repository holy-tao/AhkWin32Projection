#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class MLD_MAX_RESP_CODE_TYPE extends Win32Enum {

    /**
     * Native name: MLD_MAX_RESP_CODE_TYPE_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: MLD_MAX_RESP_CODE_TYPE_FLOAT
     * @type {Integer (Int32)}
     */
    static FLOAT => 1
}
