#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_TVAUDIO_CAPS_S extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
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
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {KSIDENTIFIER}
     */
    InputMedium{
        get {
            if(!this.HasProp("__InputMedium"))
                this.__InputMedium := KSIDENTIFIER(24, this)
            return this.__InputMedium
        }
    }

    /**
     * @type {KSIDENTIFIER}
     */
    OutputMedium{
        get {
            if(!this.HasProp("__OutputMedium"))
                this.__OutputMedium := KSIDENTIFIER(40, this)
            return this.__OutputMedium
        }
    }
}
