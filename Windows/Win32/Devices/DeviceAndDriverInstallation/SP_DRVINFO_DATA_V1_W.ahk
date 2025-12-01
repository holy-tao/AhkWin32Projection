#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An SP_DRVINFO_DATA structure contains information about a driver. This structure is a member of a driver information list that can be associated with a particular device instance or globally with a device information set. (sp_drvinfo_data_v1_w)
 * @remarks
 * In <i>SetupAPI.h</i>, this structure equates to either SP_DRVINFO_DATA_V1 or SP_DRVINFO_DATA_V2, based on whether you include the following line in your source code:
 * 
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_drvinfo_data_v1_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SP_DRVINFO_DATA_V1_W extends Win32Struct
{
    static sizeof => 1552

    static packingSize => 8

    /**
     * The size, in bytes, of the SP_DRVINFO_DATA structure. For more information, see the Remarks section in this topic.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    DriverType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved. For internal use only.
     * @type {Pointer}
     */
    Reserved {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A NULL-terminated string that describes the device supported by this driver.
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 16, 255, "UTF-16")
        set => StrPut(value, this.ptr + 16, 255, "UTF-16")
    }

    /**
     * A NULL-terminated string that contains the name of the manufacturer of the device supported by this driver.
     * @type {String}
     */
    MfgName {
        get => StrGet(this.ptr + 528, 255, "UTF-16")
        set => StrPut(value, this.ptr + 528, 255, "UTF-16")
    }

    /**
     * A NULL-terminated string giving the provider of this driver. This is typically the name of the organization that creates the driver or INF file. <b>ProviderName</b> can be an empty string.
     * @type {String}
     */
    ProviderName {
        get => StrGet(this.ptr + 1040, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1040, 255, "UTF-16")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 1552
    }
}
