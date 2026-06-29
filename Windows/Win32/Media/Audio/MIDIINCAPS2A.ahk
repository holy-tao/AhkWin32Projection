#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
class MIDIINCAPS2A extends Win32Struct {
    static sizeof => 92

    static packingSize => 4

    /**
     * @type {Integer}
     */
    wMid {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wPid {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    vDriverVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    szPname {
        get => StrGet(this.ptr + 8, 31, "UTF-8")
        set => StrPut(value, this.ptr + 8, 31, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwSupport {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Guid}
     */
    ManufacturerGuid {
        get {
            if(!this.HasProp("__ManufacturerGuid"))
                this.__ManufacturerGuid := Guid(44, this)
            return this.__ManufacturerGuid
        }
    }

    /**
     * @type {Guid}
     */
    ProductGuid {
        get {
            if(!this.HasProp("__ProductGuid"))
                this.__ProductGuid := Guid(60, this)
            return this.__ProductGuid
        }
    }

    /**
     * @type {Guid}
     */
    NameGuid {
        get {
            if(!this.HasProp("__NameGuid"))
                this.__NameGuid := Guid(76, this)
            return this.__NameGuid
        }
    }
}
