#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MEDIA_TYPE.ahk" { MEDIA_TYPE }

/**
 * Describes the geometry of disk devices and media.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_geometry
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DISK_GEOMETRY {
    #StructPack 8

    /**
     * The number of cylinders. See [**LARGE_INTEGER**](../winnt/ns-winnt-large_integer-r1.md).
     */
    Cylinders : Int64

    /**
     * The type of media. For a list of values, see [MEDIA_TYPE](ne-winioctl-media_type.md).
     */
    MediaType : MEDIA_TYPE

    /**
     * The number of tracks per cylinder.
     */
    TracksPerCylinder : UInt32

    /**
     * The number of sectors per track.
     */
    SectorsPerTrack : UInt32

    /**
     * The number of bytes per sector.
     */
    BytesPerSector : UInt32

}
