#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * An SP_DRVINFO_DATA structure contains information about a driver. This structure is a member of a driver information list that can be associated with a particular device instance or globally with a device information set. (sp_drvinfo_data_v1_w)
 * @remarks
 * In <i>SetupAPI.h</i>, this structure equates to either SP_DRVINFO_DATA_V1 or SP_DRVINFO_DATA_V2, based on whether you include the following line in your source code:
 * 
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_drvinfo_data_v1_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct SP_DRVINFO_DATA_V1_W {
    #StructPack 8

    /**
     * The size, in bytes, of the SP_DRVINFO_DATA structure. For more information, see the Remarks section in this topic.
     */
    cbSize : UInt32 := this.Size

    DriverType : UInt32

    /**
     * Reserved. For internal use only.
     */
    Reserved : IntPtr

    /**
     * A NULL-terminated string that describes the device supported by this driver.
     */
    Description : WCHAR[256]

    /**
     * A NULL-terminated string that contains the name of the manufacturer of the device supported by this driver.
     */
    MfgName : WCHAR[256]

    /**
     * A NULL-terminated string giving the provider of this driver. This is typically the name of the organization that creates the driver or INF file. <b>ProviderName</b> can be an empty string.
     */
    ProviderName : WCHAR[256]

}
