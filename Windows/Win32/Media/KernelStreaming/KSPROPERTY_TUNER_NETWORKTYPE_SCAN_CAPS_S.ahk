#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_TUNER_NETWORKTYPE_SCAN_CAPS_S extends Win32Struct {
    static sizeof => 56

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
    NetworkType {
        get {
            if(!this.HasProp("__NetworkType"))
                this.__NetworkType := Guid(24, this)
            return this.__NetworkType
        }
    }

    /**
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<Void>}
     */
    NetworkTunerCapabilities {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
