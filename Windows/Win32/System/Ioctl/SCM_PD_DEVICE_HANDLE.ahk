#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_PD_DEVICE_HANDLE extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Guid}
     */
    DeviceGuid {
        get {
            if(!this.HasProp("__DeviceGuid"))
                this.__DeviceGuid := Guid(8, this)
            return this.__DeviceGuid
        }
    }

    /**
     * @type {Integer}
     */
    DeviceHandle {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
