#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_TVAUDIO_CAPS_S extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(this.ptr + 0)
            return this.__Property
        }
    }

    /**
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {KSIDENTIFIER}
     */
    InputMedium{
        get {
            if(!this.HasProp("__InputMedium"))
                this.__InputMedium := KSIDENTIFIER(this.ptr + 16)
            return this.__InputMedium
        }
    }

    /**
     * @type {KSIDENTIFIER}
     */
    OutputMedium{
        get {
            if(!this.HasProp("__OutputMedium"))
                this.__OutputMedium := KSIDENTIFIER(this.ptr + 24)
            return this.__OutputMedium
        }
    }
}
