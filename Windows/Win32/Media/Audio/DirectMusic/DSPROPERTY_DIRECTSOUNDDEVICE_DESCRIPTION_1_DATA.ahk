#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1_DATA extends Win32Struct
{
    static sizeof => 1576

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    DeviceId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Array<SByte>}
     */
    DescriptionA{
        get {
            if(!this.HasProp("__DescriptionAProxyArray"))
                this.__DescriptionAProxyArray := Win32FixedArray(this.ptr + 8, 256, Primitive, "char")
            return this.__DescriptionAProxyArray
        }
    }

    /**
     * @type {String}
     */
    DescriptionW {
        get => StrGet(this.ptr + 264, 255, "UTF-16")
        set => StrPut(value, this.ptr + 264, 255, "UTF-16")
    }

    /**
     * @type {Array<SByte>}
     */
    ModuleA{
        get {
            if(!this.HasProp("__ModuleAProxyArray"))
                this.__ModuleAProxyArray := Win32FixedArray(this.ptr + 776, 260, Primitive, "char")
            return this.__ModuleAProxyArray
        }
    }

    /**
     * @type {String}
     */
    ModuleW {
        get => StrGet(this.ptr + 1036, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1036, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 1556, "int")
        set => NumPut("int", value, this, 1556)
    }

    /**
     * @type {Integer}
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
