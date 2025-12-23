#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class MIDL_ES_CODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MES_ENCODE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MES_DECODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MES_ENCODE_NDR64 => 2
}
