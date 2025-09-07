#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the various forms of device media.
 * @remarks
 * The **MediaType** member of the [DISK_GEOMETRY](ns-winioctl-disk_geometry.md) data structure is of type **MEDIA_TYPE**. The [DeviceIoControl](../ioapiset/nf-ioapiset-deviceiocontrol.md) function receives a **DISK_GEOMETRY** structure in response to an [IOCTL_DISK_GET_DRIVE_GEOMETRY](ni-winioctl-ioctl_disk_get_drive_geometry.md) control code. The **DeviceIoControl** function receives an array of **DISK_GEOMETRY** structures in response to an [IOCTL_STORAGE_GET_MEDIA_TYPES](ni-winioctl-ioctl_storage_get_media_types.md) control code. The [STORAGE_MEDIA_TYPE](ne-winioctl-storage_media_type.md) enumeration type extends this enumeration type.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-media_type
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class MEDIA_TYPE{

    /**
     * Format is unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * A 5.25" floppy, with 1.2MB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F5_1Pt2_512 => 1

    /**
     * A 3.5" floppy, with 1.44MB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F3_1Pt44_512 => 2

    /**
     * A 3.5" floppy, with 2.88MB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F3_2Pt88_512 => 3

    /**
     * A 3.5" floppy, with 20.8MB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F3_20Pt8_512 => 4

    /**
     * A 3.5" floppy, with 720KB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F3_720_512 => 5

    /**
     * A 5.25" floppy, with 360KB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F5_360_512 => 6

    /**
     * A 5.25" floppy, with 320KB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F5_320_512 => 7

    /**
     * A 5.25" floppy, with 320KB and 1024 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F5_320_1024 => 8

    /**
     * A 5.25" floppy, with 180KB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F5_180_512 => 9

    /**
     * A 5.25" floppy, with 160KB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F5_160_512 => 10

    /**
     * Removable media other than floppy.
     * @type {Integer (Int32)}
     */
    static RemovableMedia => 11

    /**
     * Fixed hard disk media.
     * @type {Integer (Int32)}
     */
    static FixedMedia => 12

    /**
     * A 3.5" floppy, with 120MB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F3_120M_512 => 13

    /**
     * A 3.5" floppy, with 640KB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F3_640_512 => 14

    /**
     * A 5.25" floppy, with 640KB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F5_640_512 => 15

    /**
     * A 5.25" floppy, with 720KB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F5_720_512 => 16

    /**
     * A 3.5" floppy, with 1.2MB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F3_1Pt2_512 => 17

    /**
     * A 3.5" floppy, with 1.23MB and 1024 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F3_1Pt23_1024 => 18

    /**
     * A 5.25" floppy, with 1.23MB and 1024 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F5_1Pt23_1024 => 19

    /**
     * A 3.5" floppy, with 128MB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F3_128Mb_512 => 20

    /**
     * A 3.5" floppy, with 230MB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F3_230Mb_512 => 21

    /**
     * An 8" floppy, with 256KB and 128 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F8_256_128 => 22

    /**
     * A 3.5" floppy, with 200MB and 512 bytes/sector. (HiFD).
     * @type {Integer (Int32)}
     */
    static F3_200Mb_512 => 23

    /**
     * A 3.5" floppy, with 240MB and 512 bytes/sector. (HiFD).
     * @type {Integer (Int32)}
     */
    static F3_240M_512 => 24

    /**
     * A 3.5" floppy, with 32MB and 512 bytes/sector.
     * @type {Integer (Int32)}
     */
    static F3_32M_512 => 25
}
