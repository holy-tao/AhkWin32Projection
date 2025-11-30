#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class EOF_WAIT_BLOCK extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {LIST_ENTRY}
     */
    EofWaitLinks{
        get {
            if(!this.HasProp("__EofWaitLinks"))
                this.__EofWaitLinks := LIST_ENTRY(0, this)
            return this.__EofWaitLinks
        }
    }

    /**
     * @type {Pointer<KEVENT>}
     */
    Event {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
