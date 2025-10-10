#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an identifier for the storage tier relative to the volume.
 * @remarks
 * 
  * The storage tier ID for a particular volume has no relationship to the storage tier ID with the same value on a different volume.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-file_storage_tier
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_STORAGE_TIER extends Win32Struct
{
    static sizeof => 1056

    static packingSize => 8

    /**
     * Tier ID.
     * @type {Pointer<Guid>}
     */
    Id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Name for the tier.
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 8, 255, "UTF-16")
        set => StrPut(value, this.ptr + 8, 255, "UTF-16")
    }

    /**
     * Note for the tier.
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 520, 255, "UTF-16")
        set => StrPut(value, this.ptr + 520, 255, "UTF-16")
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 1032, "uint")
        set => NumPut("uint", value, this, 1032)
    }

    /**
     * Provisioned capacity of the tier.
     * @type {Integer}
     */
    ProvisionedCapacity {
        get => NumGet(this, 1040, "uint")
        set => NumPut("uint", value, this, 1040)
    }

    /**
     * Media type of the tier.
     * @type {Integer}
     */
    MediaType {
        get => NumGet(this, 1048, "int")
        set => NumPut("int", value, this, 1048)
    }

    /**
     * 
     * @type {Integer}
     */
    Class {
        get => NumGet(this, 1052, "int")
        set => NumPut("int", value, this, 1052)
    }
}
