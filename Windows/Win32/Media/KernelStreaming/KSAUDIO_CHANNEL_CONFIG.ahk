#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSAUDIO_CHANNEL_CONFIG extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ActiveSpeakerPositions {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
