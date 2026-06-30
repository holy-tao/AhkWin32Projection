#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INTERFACE_TYPE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class LEGACY_BUS_INFORMATION extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Guid}
     */
    BusTypeGuid {
        get {
            if(!this.HasProp("__BusTypeGuid"))
                this.__BusTypeGuid := Guid(0, this)
            return this.__BusTypeGuid
        }
    }

    /**
     * @type {INTERFACE_TYPE}
     */
    LegacyBusType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    BusNumber {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
