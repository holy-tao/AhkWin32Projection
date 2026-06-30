#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\DIRECTSOUNDDEVICE_DATAFLOW.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
class DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_W_DATA extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    DeviceName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {DIRECTSOUNDDEVICE_DATAFLOW}
     */
    DataFlow {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Guid}
     */
    DeviceId {
        get {
            if(!this.HasProp("__DeviceId"))
                this.__DeviceId := Guid(12, this)
            return this.__DeviceId
        }
    }
}
