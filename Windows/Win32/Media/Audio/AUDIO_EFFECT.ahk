#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioclient/ns-audioclient-audio_effect
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
    canSetState {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    state {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
