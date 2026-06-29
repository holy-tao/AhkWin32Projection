#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class NETWORK_APP_INSTANCE_EA extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Guid}
     */
    AppInstanceID {
        get {
            if(!this.HasProp("__AppInstanceID"))
                this.__AppInstanceID := Guid(0, this)
            return this.__AppInstanceID
        }
    }

    /**
     * @type {Integer}
     */
    CsvFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
