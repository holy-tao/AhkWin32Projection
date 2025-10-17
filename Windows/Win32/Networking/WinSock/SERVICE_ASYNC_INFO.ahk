#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SERVICE_ASYNC_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<LPSERVICE_CALLBACK_PROC>}
     */
    lpServiceCallbackProc {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {HANDLE}
     */
    hAsyncTaskHandle{
        get {
            if(!this.HasProp("__hAsyncTaskHandle"))
                this.__hAsyncTaskHandle := HANDLE(16, this)
            return this.__hAsyncTaskHandle
        }
    }
}
