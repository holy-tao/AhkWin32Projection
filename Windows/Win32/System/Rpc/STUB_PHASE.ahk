#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class STUB_PHASE extends Win32Enum {

    /**
     * Native name: STUB_UNMARSHAL
     * @type {Integer (Int32)}
     */
    static UNMARSHAL => 0

    /**
     * Native name: STUB_CALL_SERVER
     * @type {Integer (Int32)}
     */
    static CALL_SERVER => 1

    /**
     * Native name: STUB_MARSHAL
     * @type {Integer (Int32)}
     */
    static MARSHAL => 2

    /**
     * Native name: STUB_CALL_SERVER_NO_HRESULT
     * @type {Integer (Int32)}
     */
    static CALL_SERVER_NO_HRESULT => 3
}
