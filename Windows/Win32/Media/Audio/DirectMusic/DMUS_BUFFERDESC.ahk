#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
class DMUS_BUFFERDESC extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Guid}
     */
    guidBufferFormat {
        get {
            if(!this.HasProp("__guidBufferFormat"))
                this.__guidBufferFormat := Guid(8, this)
            return this.__guidBufferFormat
        }
    }

    /**
     * @type {Integer}
     */
    cbBuffer {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
