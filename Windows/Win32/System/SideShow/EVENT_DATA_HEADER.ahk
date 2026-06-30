#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 */
class EVENT_DATA_HEADER extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbEventDataHeader {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    guidEventType {
        get {
            if(!this.HasProp("__guidEventType"))
                this.__guidEventType := Guid(4, this)
            return this.__guidEventType
        }
    }

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    cbEventDataSid {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
