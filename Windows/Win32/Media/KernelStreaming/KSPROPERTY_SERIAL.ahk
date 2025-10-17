#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_SERIAL extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    PropTypeSet{
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
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PropertyLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
