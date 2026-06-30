#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FILE_STORAGE_TIER_CLASS.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FILE_STORAGE_TIER_MEDIA_TYPE.ahk

/**
 * Represents an identifier for the storage tier relative to the volume.
 * @remarks
 * The storage tier ID for a particular volume has no relationship to the storage tier ID with the same value on a different volume.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_storage_tier
 * @namespace Windows.Win32.System.Ioctl
 */
class FILE_STORAGE_TIER extends Win32Struct {
    static sizeof => 1064

    static packingSize => 8

    /**
     * Tier ID.
     * @type {Guid}
     */
    Id {
        get {
            if(!this.HasProp("__Id"))
                this.__Id := Guid(0, this)
            return this.__Id
        }
    }

    /**
     * Name for the tier.
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 16, 255, "UTF-16")
        set => StrPut(value, this.ptr + 16, 255, "UTF-16")
    }

    /**
     * Note for the tier.
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 528, 255, "UTF-16")
        set => StrPut(value, this.ptr + 528, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 1040, "uint")
        set => NumPut("uint", value, this, 1040)
    }

    /**
     * Provisioned capacity of the tier.
     * @type {Integer}
     */
    ProvisionedCapacity {
        get => NumGet(this, 1048, "uint")
        set => NumPut("uint", value, this, 1048)
    }

    /**
     * Media type of the tier.
     * @type {FILE_STORAGE_TIER_MEDIA_TYPE}
     */
    MediaType {
        get => NumGet(this, 1056, "int")
        set => NumPut("int", value, this, 1056)
    }

    /**
     * @type {FILE_STORAGE_TIER_CLASS}
     */
    Class {
        get => NumGet(this, 1060, "int")
        set => NumPut("int", value, this, 1060)
    }
}
