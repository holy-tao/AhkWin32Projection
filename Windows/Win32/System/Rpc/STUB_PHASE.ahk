#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class STUB_PHASE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static STUB_UNMARSHAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static STUB_CALL_SERVER => 1

    /**
     * @type {Integer (Int32)}
     */
    static STUB_MARSHAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static STUB_CALL_SERVER_NO_HRESULT => 3
}
