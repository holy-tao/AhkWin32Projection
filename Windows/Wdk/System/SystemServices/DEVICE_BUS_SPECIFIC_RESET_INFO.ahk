#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DEVICE_BUS_SPECIFIC_RESET_INFO extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

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
     * @type {Pointer}
     */
    ResetTypeSupported {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
