#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class AUDIO_EFFECT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    canSetState{
        get {
            if(!this.HasProp("__canSetState"))
                this.__canSetState := BOOL(this.ptr + 8)
            return this.__canSetState
        }
    }

    /**
     * @type {Integer}
     */
    state {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
