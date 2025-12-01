#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SP_INF_INFORMATION structure stores information about an INF file, including the style, number of constituent INF files, and version data.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_inf_information
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SP_INF_INFORMATION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    InfStyle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of constituent INF files.
     * @type {Integer}
     */
    InfCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Stores information from the <b>Version</b> section of an INF file in an array of <b>ANYSIZE_ARRAY</b> bytes.
     * @type {Array<Byte>}
     */
    VersionData{
        get {
            if(!this.HasProp("__VersionDataProxyArray"))
                this.__VersionDataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__VersionDataProxyArray
        }
    }
}
