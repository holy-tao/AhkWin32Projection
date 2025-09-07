#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_SMBIOS_INFO extends Win32Struct
{
    static sizeof => 1424

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SmbiosMajorVersion {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    SmbiosMinorVersion {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    DMIVersion {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    TableSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    BiosMajorRelease {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    BiosMinorRelease {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * @type {Integer}
     */
    FirmwareMajorRelease {
        get => NumGet(this, 14, "char")
        set => NumPut("char", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    FirmwareMinorRelease {
        get => NumGet(this, 15, "char")
        set => NumPut("char", value, this, 15)
    }

    /**
     * @type {String}
     */
    BaseBoardManufacturer {
        get => StrGet(this.ptr + 16, 63, "UTF-16")
        set => StrPut(value, this.ptr + 16, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    BaseBoardProduct {
        get => StrGet(this.ptr + 144, 63, "UTF-16")
        set => StrPut(value, this.ptr + 144, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    BaseBoardVersion {
        get => StrGet(this.ptr + 272, 63, "UTF-16")
        set => StrPut(value, this.ptr + 272, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    BiosReleaseDate {
        get => StrGet(this.ptr + 400, 63, "UTF-16")
        set => StrPut(value, this.ptr + 400, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    BiosVendor {
        get => StrGet(this.ptr + 528, 63, "UTF-16")
        set => StrPut(value, this.ptr + 528, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    BiosVersion {
        get => StrGet(this.ptr + 656, 63, "UTF-16")
        set => StrPut(value, this.ptr + 656, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    SystemFamily {
        get => StrGet(this.ptr + 784, 63, "UTF-16")
        set => StrPut(value, this.ptr + 784, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    SystemManufacturer {
        get => StrGet(this.ptr + 912, 63, "UTF-16")
        set => StrPut(value, this.ptr + 912, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    SystemProductName {
        get => StrGet(this.ptr + 1040, 63, "UTF-16")
        set => StrPut(value, this.ptr + 1040, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    SystemSKU {
        get => StrGet(this.ptr + 1168, 63, "UTF-16")
        set => StrPut(value, this.ptr + 1168, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    SystemVersion {
        get => StrGet(this.ptr + 1296, 63, "UTF-16")
        set => StrPut(value, this.ptr + 1296, 63, "UTF-16")
    }
}
