#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a single storage tier region.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_storage_tier_region
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_STORAGE_TIER_REGION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Tier ID.
     * @type {Pointer<Guid>}
     */
    TierId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Offset from the beginning of the volume of this region, in bytes.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Length of region in bytes.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
