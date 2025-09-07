#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_A_DATA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DataFlow {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Pointer<Guid>}
     */
    DeviceId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PSTR}
     */
    Description{
        get {
            if(!this.HasProp("__Description"))
                this.__Description := PSTR(this.ptr + 16)
            return this.__Description
        }
    }

    /**
     * @type {PSTR}
     */
    Module{
        get {
            if(!this.HasProp("__Module"))
                this.__Module := PSTR(this.ptr + 24)
            return this.__Module
        }
    }

    /**
     * @type {PSTR}
     */
    Interface{
        get {
            if(!this.HasProp("__Interface"))
                this.__Interface := PSTR(this.ptr + 32)
            return this.__Interface
        }
    }

    /**
     * @type {Integer}
     */
    WaveDeviceId {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
