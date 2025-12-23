#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class GLOBALOPT_RPCTP_VALUES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_RPC_THREADPOOL_SETTING_DEFAULT_POOL => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_RPC_THREADPOOL_SETTING_PRIVATE_POOL => 1
}
