#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class MIDL_ES_HANDLE_STYLE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MES_INCREMENTAL_HANDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MES_FIXED_BUFFER_HANDLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MES_DYNAMIC_BUFFER_HANDLE => 2
}
