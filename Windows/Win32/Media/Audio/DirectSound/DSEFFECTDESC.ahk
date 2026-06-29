#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
class DSEFFECTDESC extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

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
    guidDSFXClass {
        get {
            if(!this.HasProp("__guidDSFXClass"))
                this.__guidDSFXClass := Guid(8, this)
            return this.__guidDSFXClass
        }
    }

    /**
     * @type {Pointer}
     */
    dwReserved1 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    dwReserved2 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
