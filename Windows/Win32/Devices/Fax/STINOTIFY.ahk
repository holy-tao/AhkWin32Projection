#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 */
class STINOTIFY extends Win32Struct {
    static sizeof => 84

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    guidNotificationCode {
        get {
            if(!this.HasProp("__guidNotificationCode"))
                this.__guidNotificationCode := Guid(4, this)
            return this.__guidNotificationCode
        }
    }

    /**
     * @type {Array<Integer>}
     */
    abNotificationData {
        get {
            if(!this.HasProp("__abNotificationDataProxyArray"))
                this.__abNotificationDataProxyArray := Win32FixedArray(this.ptr + 20, 64, Primitive, "char")
            return this.__abNotificationDataProxyArray
        }
    }
}
