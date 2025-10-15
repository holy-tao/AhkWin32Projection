#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSMIDILOOPED_EVENT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    WriteEvent{
        get {
            if(!this.HasProp("__WriteEvent"))
                this.__WriteEvent := HANDLE(this.ptr + 0)
            return this.__WriteEvent
        }
    }
}
