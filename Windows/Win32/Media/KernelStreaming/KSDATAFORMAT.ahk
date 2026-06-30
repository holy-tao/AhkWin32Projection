#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSDATAFORMAT extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    FormatSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    SampleSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Guid}
     */
    MajorFormat {
        get {
            if(!this.HasProp("__MajorFormat"))
                this.__MajorFormat := Guid(16, this)
            return this.__MajorFormat
        }
    }

    /**
     * @type {Guid}
     */
    SubFormat {
        get {
            if(!this.HasProp("__SubFormat"))
                this.__SubFormat := Guid(32, this)
            return this.__SubFormat
        }
    }

    /**
     * @type {Guid}
     */
    Specifier {
        get {
            if(!this.HasProp("__Specifier"))
                this.__Specifier := Guid(48, this)
            return this.__Specifier
        }
    }

    /**
     * @type {Integer}
     */
    Alignment {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
