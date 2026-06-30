#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class MU_TELEMETRY_SECTION extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Guid}
     */
    ComponentID {
        get {
            if(!this.HasProp("__ComponentID"))
                this.__ComponentID := Guid(0, this)
            return this.__ComponentID
        }
    }

    /**
     * @type {Guid}
     */
    SubComponentID {
        get {
            if(!this.HasProp("__SubComponentID"))
                this.__SubComponentID := Guid(16, this)
            return this.__SubComponentID
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ErrorStatusValue {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    AdditionalInfo1 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    AdditionalInfo2 {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
