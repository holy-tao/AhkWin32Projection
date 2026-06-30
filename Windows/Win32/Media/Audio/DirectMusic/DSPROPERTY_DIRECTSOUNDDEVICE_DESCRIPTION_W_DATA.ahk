#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DIRECTSOUNDDEVICE_TYPE.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\DIRECTSOUNDDEVICE_DATAFLOW.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
class DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W_DATA extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {DIRECTSOUNDDEVICE_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {DIRECTSOUNDDEVICE_DATAFLOW}
     */
    DataFlow {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Guid}
     */
    DeviceId {
        get {
            if(!this.HasProp("__DeviceId"))
                this.__DeviceId := Guid(8, this)
            return this.__DeviceId
        }
    }

    /**
     * @type {PWSTR}
     */
    Description {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {PWSTR}
     */
    Module {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {PWSTR}
     */
    Interface {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    WaveDeviceId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
