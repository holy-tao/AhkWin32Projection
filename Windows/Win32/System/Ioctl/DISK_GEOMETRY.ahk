#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the geometry of disk devices and media.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-disk_geometry
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DISK_GEOMETRY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The number of cylinders. See [**LARGE_INTEGER**](../winnt/ns-winnt-large_integer-r1.md).
     * @type {Integer}
     */
    Cylinders {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The type of media. For a list of values, see [MEDIA_TYPE](ne-winioctl-media_type.md).
     * @type {Integer}
     */
    MediaType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The number of tracks per cylinder.
     * @type {Integer}
     */
    TracksPerCylinder {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of sectors per track.
     * @type {Integer}
     */
    SectorsPerTrack {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of bytes per sector.
     * @type {Integer}
     */
    BytesPerSector {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
