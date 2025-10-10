#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies parameters used to initialize HRTF spatial audio.
 * @see https://docs.microsoft.com/windows/win32/api//hrtfapoapi/ns-hrtfapoapi-hrtfapoinit
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class HrtfApoInit extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The decay type. If you pass in nullptr, the default value is used. The default is natural decay.
     * @type {Pointer<HrtfDistanceDecay>}
     */
    distanceDecay {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The directivity type. If you pass in nullptr, the default value is used. The default directivity is omni-directional.
     * @type {Pointer<HrtfDirectivity>}
     */
    directivity {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
