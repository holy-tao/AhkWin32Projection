#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents a position in 3D space, using a right-handed coordinate system.
 * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/ns-hrtfapoapi-hrtfposition
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class HrtfPosition extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * 
     * @type {Float}
     */
    x {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * 
     * @type {Float}
     */
    y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * 
     * @type {Float}
     */
    z {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
