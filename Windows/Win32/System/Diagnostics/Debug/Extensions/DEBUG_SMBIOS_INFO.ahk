#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_SMBIOS_INFO extends Win32Struct
{
    static sizeof => 720

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
     * @type {Array<SByte>}
     */
    BaseBoardManufacturer{
        get {
            if(!this.HasProp("__BaseBoardManufacturerProxyArray"))
                this.__BaseBoardManufacturerProxyArray := Win32FixedArray(this.ptr + 16, 64, Primitive, "char")
            return this.__BaseBoardManufacturerProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    BaseBoardProduct{
        get {
            if(!this.HasProp("__BaseBoardProductProxyArray"))
                this.__BaseBoardProductProxyArray := Win32FixedArray(this.ptr + 80, 64, Primitive, "char")
            return this.__BaseBoardProductProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    BaseBoardVersion{
        get {
            if(!this.HasProp("__BaseBoardVersionProxyArray"))
                this.__BaseBoardVersionProxyArray := Win32FixedArray(this.ptr + 144, 64, Primitive, "char")
            return this.__BaseBoardVersionProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    BiosReleaseDate{
        get {
            if(!this.HasProp("__BiosReleaseDateProxyArray"))
                this.__BiosReleaseDateProxyArray := Win32FixedArray(this.ptr + 208, 64, Primitive, "char")
            return this.__BiosReleaseDateProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    BiosVendor{
        get {
            if(!this.HasProp("__BiosVendorProxyArray"))
                this.__BiosVendorProxyArray := Win32FixedArray(this.ptr + 272, 64, Primitive, "char")
            return this.__BiosVendorProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    BiosVersion{
        get {
            if(!this.HasProp("__BiosVersionProxyArray"))
                this.__BiosVersionProxyArray := Win32FixedArray(this.ptr + 336, 64, Primitive, "char")
            return this.__BiosVersionProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    SystemFamily{
        get {
            if(!this.HasProp("__SystemFamilyProxyArray"))
                this.__SystemFamilyProxyArray := Win32FixedArray(this.ptr + 400, 64, Primitive, "char")
            return this.__SystemFamilyProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    SystemManufacturer{
        get {
            if(!this.HasProp("__SystemManufacturerProxyArray"))
                this.__SystemManufacturerProxyArray := Win32FixedArray(this.ptr + 464, 64, Primitive, "char")
            return this.__SystemManufacturerProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    SystemProductName{
        get {
            if(!this.HasProp("__SystemProductNameProxyArray"))
                this.__SystemProductNameProxyArray := Win32FixedArray(this.ptr + 528, 64, Primitive, "char")
            return this.__SystemProductNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    SystemSKU{
        get {
            if(!this.HasProp("__SystemSKUProxyArray"))
                this.__SystemSKUProxyArray := Win32FixedArray(this.ptr + 592, 64, Primitive, "char")
            return this.__SystemSKUProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    SystemVersion{
        get {
            if(!this.HasProp("__SystemVersionProxyArray"))
                this.__SystemVersionProxyArray := Win32FixedArray(this.ptr + 656, 64, Primitive, "char")
            return this.__SystemVersionProxyArray
        }
    }
}
