#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSAUDIOMODULE_DESCRIPTOR extends Win32Struct {
    static sizeof => 284

    static packingSize => 4

    /**
     * @type {Guid}
     */
    ClassId {
        get {
            if(!this.HasProp("__ClassId"))
                this.__ClassId := Guid(0, this)
            return this.__ClassId
        }
    }

    /**
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    VersionMajor {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    VersionMinor {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 28, 127, "UTF-16")
        set => StrPut(value, this.ptr + 28, 127, "UTF-16")
    }
}
