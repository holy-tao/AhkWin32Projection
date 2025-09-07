#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA extends Win32Struct
{
    static sizeof => 2088

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    DeviceId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {String}
     */
    DescriptionA {
        get => StrGet(this.ptr + 8, 255, "UTF-16")
        set => StrPut(value, this.ptr + 8, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    DescriptionW {
        get => StrGet(this.ptr + 520, 255, "UTF-16")
        set => StrPut(value, this.ptr + 520, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    ModuleA {
        get => StrGet(this.ptr + 1032, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1032, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    ModuleW {
        get => StrGet(this.ptr + 1552, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1552, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 2072, "int")
        set => NumPut("int", value, this, 2072)
    }

    /**
     * @type {Integer}
     */
    DataFlow {
        get => NumGet(this, 2076, "int")
        set => NumPut("int", value, this, 2076)
    }

    /**
     * @type {Integer}
     */
    WaveDeviceId {
        get => NumGet(this, 2080, "uint")
        set => NumPut("uint", value, this, 2080)
    }

    /**
     * @type {Integer}
     */
    Devnode {
        get => NumGet(this, 2084, "uint")
        set => NumPut("uint", value, this, 2084)
    }
}
