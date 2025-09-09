#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class STINOTIFY extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidNotificationCode {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    abNotificationData{
        get {
            if(!this.HasProp("__abNotificationDataProxyArray"))
                this.__abNotificationDataProxyArray := Win32FixedArray(this.ptr + 16, 64, Primitive, "char")
            return this.__abNotificationDataProxyArray
        }
    }
}
