#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\WAVEFORMATEX.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class DMUS_WAVE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ulFirstExtCkIdx {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulCopyrightIdx {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ulWaveDataIdx {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {WAVEFORMATEX}
     */
    WaveformatEx{
        get {
            if(!this.HasProp("__WaveformatEx"))
                this.__WaveformatEx := WAVEFORMATEX(this.ptr + 16)
            return this.__WaveformatEx
        }
    }
}
