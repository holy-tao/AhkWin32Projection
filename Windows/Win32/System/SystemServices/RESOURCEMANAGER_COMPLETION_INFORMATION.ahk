#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class RESOURCEMANAGER_COMPLETION_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    IoCompletionPortHandle{
        get {
            if(!this.HasProp("__IoCompletionPortHandle"))
                this.__IoCompletionPortHandle := HANDLE(this.ptr + 0)
            return this.__IoCompletionPortHandle
        }
    }

    /**
     * @type {Pointer}
     */
    CompletionKey {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
