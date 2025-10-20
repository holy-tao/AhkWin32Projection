#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_drvinfo_data_v2_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SP_DRVINFO_DATA_V2_W extends Win32Struct
{
    static sizeof => 1568

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
        get => StrGet(this.ptr + 16, 255, "UTF-16")
        set => StrPut(value, this.ptr + 16, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    MfgName {
        get => StrGet(this.ptr + 528, 255, "UTF-16")
        set => StrPut(value, this.ptr + 528, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    ProviderName {
        get => StrGet(this.ptr + 1040, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1040, 255, "UTF-16")
    }

    /**
     * @type {FILETIME}
     */
    DriverDate{
        get {
            if(!this.HasProp("__DriverDate"))
                this.__DriverDate := FILETIME(1552, this)
            return this.__DriverDate
        }
    }

    /**
     * @type {Integer}
     */
    DriverVersion {
        get => NumGet(this, 1560, "uint")
        set => NumPut("uint", value, this, 1560)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 1568
    }
}
