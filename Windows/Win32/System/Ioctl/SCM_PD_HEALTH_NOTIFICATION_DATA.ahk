#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_HEALTH_NOTIFICATION_DATA extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Guid}
     */
    DeviceGuid {
        get {
            if(!this.HasProp("__DeviceGuid"))
                this.__DeviceGuid := Guid(0, this)
            return this.__DeviceGuid
        }
    }
}
