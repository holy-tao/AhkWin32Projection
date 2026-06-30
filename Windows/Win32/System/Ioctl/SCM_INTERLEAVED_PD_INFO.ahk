#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_INTERLEAVED_PD_INFO extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    DeviceHandle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    DeviceGuid {
        get {
            if(!this.HasProp("__DeviceGuid"))
                this.__DeviceGuid := Guid(4, this)
            return this.__DeviceGuid
        }
    }
}
