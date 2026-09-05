#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class IGMP_MAX_RESP_CODE_TYPE extends Win32Enum {

    /**
     * Native name: IGMP_MAX_RESP_CODE_TYPE_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * Native name: IGMP_MAX_RESP_CODE_TYPE_FLOAT
     * @type {Integer (Int32)}
     */
    static FLOAT => 1
}
