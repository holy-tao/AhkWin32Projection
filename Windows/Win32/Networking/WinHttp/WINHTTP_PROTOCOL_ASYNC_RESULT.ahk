#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINHTTP_ASYNC_RESULT.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROTOCOL_ASYNC_RESULT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {WINHTTP_ASYNC_RESULT}
     */
    AsyncResult{
        get {
            if(!this.HasProp("__AsyncResult"))
                this.__AsyncResult := WINHTTP_ASYNC_RESULT(0, this)
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
}
