#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_SERIAL extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    PropTypeSet {
        get {
            if(!this.HasProp("__PropTypeSet"))
                this.__PropTypeSet := KSIDENTIFIER(0, this)
            return this.__PropTypeSet
        }
    }

    /**
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    PropertyLength {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
