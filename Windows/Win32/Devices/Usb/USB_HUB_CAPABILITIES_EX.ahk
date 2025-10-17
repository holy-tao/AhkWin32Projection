#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_HUB_CAP_FLAGS.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_HUB_CAPABILITIES_EX extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {USB_HUB_CAP_FLAGS}
     */
    CapabilityFlags{
        get {
            if(!this.HasProp("__CapabilityFlags"))
                this.__CapabilityFlags := USB_HUB_CAP_FLAGS(0, this)
            return this.__CapabilityFlags
        }
    }
}
