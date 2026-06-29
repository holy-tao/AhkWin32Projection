#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSAUDIOMODULE_PROPERTY extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property {
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(0, this)
            return this.__Property
        }
    }

    /**
     * @type {Guid}
     */
    ClassId {
        get {
            if(!this.HasProp("__ClassId"))
                this.__ClassId := Guid(24, this)
            return this.__ClassId
        }
    }

    /**
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
