#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_DRVINFO_DETAIL_DATA_A extends Win32Struct
{
    static sizeof => 808

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
                this.__InfDate := FILETIME(8, this)
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
        get => StrGet(this.ptr + 32, 255, "UTF-8")
        set => StrPut(value, this.ptr + 32, 255, "UTF-8")
    }

    /**
     * @type {String}
     */
    InfFileName {
        get => StrGet(this.ptr + 288, 259, "UTF-8")
        set => StrPut(value, this.ptr + 288, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    DrvDescription {
        get => StrGet(this.ptr + 548, 255, "UTF-8")
        set => StrPut(value, this.ptr + 548, 255, "UTF-8")
    }

    /**
     * @type {String}
     */
    HardwareID {
        get => StrGet(this.ptr + 804, 0, "UTF-8")
        set => StrPut(value, this.ptr + 804, 0, "UTF-8")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 808
    }
}
