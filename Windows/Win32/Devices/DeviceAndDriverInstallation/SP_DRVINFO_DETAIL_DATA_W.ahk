#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SP_DRVINFO_DETAIL_DATA_W extends Win32Struct
{
    static sizeof => 1584

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {FILETIME}
     */
    InfDate{
        get {
            if(!this.HasProp("__InfDate"))
                this.__InfDate := FILETIME(this.ptr + 8)
            return this.__InfDate
        }
    }

    /**
     * @type {Integer}
     */
    CompatIDsOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    CompatIDsLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer}
     */
    Reserved {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {String}
     */
    SectionName {
        get => StrGet(this.ptr + 32, 255, "UTF-16")
        set => StrPut(value, this.ptr + 32, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    InfFileName {
        get => StrGet(this.ptr + 544, 259, "UTF-16")
        set => StrPut(value, this.ptr + 544, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    DrvDescription {
        get => StrGet(this.ptr + 1064, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1064, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    HardwareID {
        get => StrGet(this.ptr + 1576, 0, "UTF-16")
        set => StrPut(value, this.ptr + 1576, 0, "UTF-16")
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 1584
    }
}
