#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\INTERNET_ASYNC_RESULT.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class HTTP_WEB_SOCKET_ASYNC_RESULT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {INTERNET_ASYNC_RESULT}
     */
    AsyncResult{
        get {
            if(!this.HasProp("__AsyncResult"))
                this.__AsyncResult := INTERNET_ASYNC_RESULT(this.ptr + 0)
            return this.__AsyncResult
        }
    }

    /**
     * @type {Integer}
     */
    Operation {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
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
