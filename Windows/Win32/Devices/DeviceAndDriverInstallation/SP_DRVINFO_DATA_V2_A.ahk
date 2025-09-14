#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * An SP_DRVINFO_DATA structure contains information about a driver. This structure is a member of a driver information list that can be associated with a particular device instance or globally with a device information set. (sp_drvinfo_data_v2_a)
 * @remarks
 * In <i>SetupAPI.h</i>, this structure equates to either SP_DRVINFO_DATA_V1 or SP_DRVINFO_DATA_V2, based on whether you include the following line in your source code:
  * 
  * 
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_drvinfo_data_v2_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_DRVINFO_DATA_V2_A extends Win32Struct
{
    static sizeof => 800

    static packingSize => 1

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
     * @type {Array<SByte>}
     */
    Description{
        get {
            if(!this.HasProp("__DescriptionProxyArray"))
                this.__DescriptionProxyArray := Win32FixedArray(this.ptr + 16, 256, Primitive, "char")
            return this.__DescriptionProxyArray
        }
    }

    /**
     * A NULL-terminated string that contains the name of the manufacturer of the device supported by this driver.
     * @type {Array<SByte>}
     */
    MfgName{
        get {
            if(!this.HasProp("__MfgNameProxyArray"))
                this.__MfgNameProxyArray := Win32FixedArray(this.ptr + 272, 256, Primitive, "char")
            return this.__MfgNameProxyArray
        }
    }

    /**
     * A NULL-terminated string giving the provider of this driver. This is typically the name of the organization that creates the driver or INF file. <b>ProviderName</b> can be an empty string.
     * @type {Array<SByte>}
     */
    ProviderName{
        get {
            if(!this.HasProp("__ProviderNameProxyArray"))
                this.__ProviderNameProxyArray := Win32FixedArray(this.ptr + 528, 256, Primitive, "char")
            return this.__ProviderNameProxyArray
        }
    }

    /**
     * Date of the driver. From the <b>DriverVer</b> entry in the INF file. See the <a href="https://docs.microsoft.com/windows-hardware/drivers/install/inf-ddinstall-section">INF DDInstall Section</a> for more information about the <b>DriverVer</b> entry.
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
     * Version of the driver. From the <b>DriverVer</b> entry in the INF file.
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
