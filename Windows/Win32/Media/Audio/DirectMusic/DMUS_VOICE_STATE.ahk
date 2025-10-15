#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * DMUS_VOICE_STATE is not supported and may be altered or unavailable in the future.
 * @see https://docs.microsoft.com/windows/win32/api//dmusics/ns-dmusics-dmus_voice_state
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class DMUS_VOICE_STATE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {BOOL}
     */
    bExists{
        get {
            if(!this.HasProp("__bExists"))
                this.__bExists := BOOL(this.ptr + 0)
            return this.__bExists
        }
    }

    /**
     * 
     * @type {Integer}
     */
    spPosition {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
