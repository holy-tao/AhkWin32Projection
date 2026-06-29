#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_TVAUDIO_CAPS_S extends Win32Struct {
    static sizeof => 80

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
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {KSIDENTIFIER}
     */
    InputMedium {
        get {
            if(!this.HasProp("__InputMedium"))
                this.__InputMedium := KSIDENTIFIER(32, this)
            return this.__InputMedium
        }
    }

    /**
     * @type {KSIDENTIFIER}
     */
    OutputMedium {
        get {
            if(!this.HasProp("__OutputMedium"))
                this.__OutputMedium := KSIDENTIFIER(56, this)
            return this.__OutputMedium
        }
    }
}
