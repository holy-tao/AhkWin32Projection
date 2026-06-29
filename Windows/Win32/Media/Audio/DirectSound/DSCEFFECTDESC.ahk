#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
class DSCEFFECTDESC extends Win32Struct {
    static sizeof => 48

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
    guidDSCFXClass {
        get {
            if(!this.HasProp("__guidDSCFXClass"))
                this.__guidDSCFXClass := Guid(8, this)
            return this.__guidDSCFXClass
        }
    }

    /**
     * @type {Guid}
     */
    guidDSCFXInstance {
        get {
            if(!this.HasProp("__guidDSCFXInstance"))
                this.__guidDSCFXInstance := Guid(24, this)
            return this.__guidDSCFXInstance
        }
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
