#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSAUDIO_MIXLEVEL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    Mute{
        get {
            if(!this.HasProp("__Mute"))
                this.__Mute := BOOL(this.ptr + 0)
            return this.__Mute
        }
    }

    /**
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
