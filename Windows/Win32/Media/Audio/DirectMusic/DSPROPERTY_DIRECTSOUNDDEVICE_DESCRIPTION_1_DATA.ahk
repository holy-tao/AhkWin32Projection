#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DIRECTSOUNDDEVICE_TYPE.ahk
#Include .\DIRECTSOUNDDEVICE_DATAFLOW.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
class DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA extends Win32Struct {
    static sizeof => 1580

    static packingSize => 4

    /**
     * @type {Guid}
     */
    DeviceId {
        get {
            if(!this.HasProp("__DeviceId"))
                this.__DeviceId := Guid(0, this)
            return this.__DeviceId
        }
    }

    /**
     * @type {String}
     */
    DescriptionA {
        get => StrGet(this.ptr + 16, 255, "UTF-8")
        set => StrPut(value, this.ptr + 16, 255, "UTF-8")
    }

    /**
     * @type {String}
     */
    DescriptionW {
        get => StrGet(this.ptr + 272, 255, "UTF-16")
        set => StrPut(value, this.ptr + 272, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    ModuleA {
        get => StrGet(this.ptr + 784, 259, "UTF-8")
        set => StrPut(value, this.ptr + 784, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    ModuleW {
        get => StrGet(this.ptr + 1044, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1044, 259, "UTF-16")
    }

    /**
     * @type {DIRECTSOUNDDEVICE_TYPE}
     */
    Type {
        get => NumGet(this, 1564, "int")
        set => NumPut("int", value, this, 1564)
    }

    /**
     * @type {DIRECTSOUNDDEVICE_DATAFLOW}
     */
    DataFlow {
        get => NumGet(this, 1568, "int")
        set => NumPut("int", value, this, 1568)
    }

    /**
     * @type {Integer}
     */
    WaveDeviceId {
        get => NumGet(this, 1572, "uint")
        set => NumPut("uint", value, this, 1572)
    }

    /**
     * @type {Integer}
     */
    Devnode {
        get => NumGet(this, 1576, "uint")
        set => NumPut("uint", value, this, 1576)
    }
}
