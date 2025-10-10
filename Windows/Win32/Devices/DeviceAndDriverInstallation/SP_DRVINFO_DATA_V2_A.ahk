#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_DRVINFO_DATA_V2_A extends Win32Struct
{
    static sizeof => 800

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DriverType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer}
     */
    Reserved {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 16, 255, "UTF-8")
        set => StrPut(value, this.ptr + 16, 255, "UTF-8")
    }

    /**
     * @type {String}
     */
    MfgName {
        get => StrGet(this.ptr + 272, 255, "UTF-8")
        set => StrPut(value, this.ptr + 272, 255, "UTF-8")
    }

    /**
     * @type {String}
     */
    ProviderName {
        get => StrGet(this.ptr + 528, 255, "UTF-8")
        set => StrPut(value, this.ptr + 528, 255, "UTF-8")
    }

    /**
     * @type {FILETIME}
     */
    DriverDate{
        get {
            if(!this.HasProp("__DriverDate"))
                this.__DriverDate := FILETIME(this.ptr + 784)
            return this.__DriverDate
        }
    }

    /**
     * @type {Integer}
     */
    DriverVersion {
        get => NumGet(this, 792, "uint")
        set => NumPut("uint", value, this, 792)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 800
    }
}
