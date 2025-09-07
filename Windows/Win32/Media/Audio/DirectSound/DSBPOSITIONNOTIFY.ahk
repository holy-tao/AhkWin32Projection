#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class DSBPOSITIONNOTIFY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {HANDLE}
     */
    hEventNotify{
        get {
            if(!this.HasProp("__hEventNotify"))
                this.__hEventNotify := HANDLE(this.ptr + 8)
            return this.__hEventNotify
        }
    }
}
