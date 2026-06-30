#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\INTERNET_ASYNC_RESULT.ahk
#Include .\HTTP_WEB_SOCKET_BUFFER_TYPE.ahk
#Include .\HTTP_WEB_SOCKET_OPERATION.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class HTTP_WEB_SOCKET_ASYNC_RESULT extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {INTERNET_ASYNC_RESULT}
     */
    AsyncResult {
        get {
            if(!this.HasProp("__AsyncResult"))
                this.__AsyncResult := INTERNET_ASYNC_RESULT(0, this)
            return this.__AsyncResult
        }
    }

    /**
     * @type {HTTP_WEB_SOCKET_OPERATION}
     */
    Operation {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {HTTP_WEB_SOCKET_BUFFER_TYPE}
     */
    BufferType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwBytesTransferred {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
