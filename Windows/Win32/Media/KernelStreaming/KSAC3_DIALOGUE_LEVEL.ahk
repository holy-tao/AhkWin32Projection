#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSAC3_DIALOGUE_LEVEL extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    DialogueLevel {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
