#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_DOORBELL_MATCH_DATA.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_NOTIFICATION_PORT_PARAMETERS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NotificationPortType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {WHV_DOORBELL_MATCH_DATA}
     */
    Doorbell{
        get {
            if(!this.HasProp("__Doorbell"))
                this.__Doorbell := WHV_DOORBELL_MATCH_DATA(this.ptr + 8)
            return this.__Doorbell
        }
    }

    /**
     * @type {Integer}
     */
    Event {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
