#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DIRECTSOUNDDEVICE_TYPE.ahk
#Include .\DIRECTSOUNDDEVICE_DATAFLOW.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
class DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA extends Win32Struct {
    static sizeof => 1576

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    DeviceId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {String}
     */
    DescriptionA {
        get => StrGet(this.ptr + 8, 255, "UTF-8")
        set => StrPut(value, this.ptr + 8, 255, "UTF-8")
    }

    /**
     * @type {String}
     */
    DescriptionW {
        get => StrGet(this.ptr + 264, 255, "UTF-16")
        set => StrPut(value, this.ptr + 264, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    ModuleA {
        get => StrGet(this.ptr + 776, 259, "UTF-8")
        set => StrPut(value, this.ptr + 776, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    ModuleW {
        get => StrGet(this.ptr + 1036, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1036, 259, "UTF-16")
    }

    /**
     * @type {DIRECTSOUNDDEVICE_TYPE}
     */
    Type {
        get => NumGet(this, 1556, "int")
        set => NumPut("int", value, this, 1556)
    }

    /**
     * @type {DIRECTSOUNDDEVICE_DATAFLOW}
     */
    DataFlow {
        get => NumGet(this, 1560, "int")
        set => NumPut("int", value, this, 1560)
    }

    /**
     * @type {Integer}
     */
    WaveDeviceId {
        get => NumGet(this, 1564, "uint")
        set => NumPut("uint", value, this, 1564)
    }

    /**
     * @type {Integer}
     */
    Devnode {
        get => NumGet(this, 1568, "uint")
        set => NumPut("uint", value, this, 1568)
    }
}
