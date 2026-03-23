#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSMIDILOOPED_EVENT2 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    WriteEvent{
        get {
            if(!this.HasProp("__WriteEvent"))
                this.__WriteEvent := HANDLE(0, this)
            return this.__WriteEvent
        }
    }

    /**
     * @type {HANDLE}
     */
    ReadEvent{
        get {
            if(!this.HasProp("__ReadEvent"))
                this.__ReadEvent := HANDLE(8, this)
            return this.__ReadEvent
        }
    }
}
