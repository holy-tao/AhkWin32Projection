#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DMUS_CLOCKTYPE.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
class DMUS_CLOCKINFO8 extends Win32Struct {
    static sizeof => 284

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {DMUS_CLOCKTYPE}
     */
    ctType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Guid}
     */
    guidClock {
        get {
            if(!this.HasProp("__guidClock"))
                this.__guidClock := Guid(8, this)
            return this.__guidClock
        }
    }

    /**
     * @type {String}
     */
    wszDescription {
        get => StrGet(this.ptr + 24, 127, "UTF-16")
        set => StrPut(value, this.ptr + 24, 127, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }
}
