#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSAUDIO_MICROPHONE_COORDINATES extends Win32Struct
{
    static sizeof => 12

    static packingSize => 2

    /**
     * @type {Integer}
     */
    usType {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wXCoord {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    wYCoord {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    wZCoord {
        get => NumGet(this, 6, "short")
        set => NumPut("short", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    wVerticalAngle {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    wHorizontalAngle {
        get => NumGet(this, 10, "short")
        set => NumPut("short", value, this, 10)
    }
}
