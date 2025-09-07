#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * The NTMS_DRIVEINFORMATION structure defines properties specific to a drive object. (Unicode)
 * @remarks
 * The 
  * <b>NTMS_DRIVEINFORMATION</b> structure is included in the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The ntmsapi.h header defines NTMS_DRIVEINFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_driveinformationw
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset Unicode
 */
class NTMS_DRIVEINFORMATIONW extends Win32Struct
{
    static sizeof => 336

    static packingSize => 8

    /**
     * Number of the drive in the library. This is set zero or one relative the value based on the drive numbering system of the device. Some changers number drives beginning with zero, and some changers begin with one.
     * @type {Integer}
     */
    Number {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    State {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Unique identifier of the drive type object containing the attributes for the drive.
     * @type {Pointer<Guid>}
     */
    DriveType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Name of the device used to access the drive. For a tape drive this contains the device name \\.\tape0 or \\.\tape1. Other devices provide the name of a SCSI disk drive or the root of a file system that currently has the device mounted (raw, NTFS, FAT and so forth).
     * @type {String}
     */
    szDeviceName {
        get => StrGet(this.ptr + 16, 63, "UTF-16")
        set => StrPut(value, this.ptr + 16, 63, "UTF-16")
    }

    /**
     * Serial number for the drive represented as a string. Devices that do not support serial numbers report NULL for this member.
     * @type {String}
     */
    szSerialNumber {
        get => StrGet(this.ptr + 144, 31, "UTF-16")
        set => StrPut(value, this.ptr + 144, 31, "UTF-16")
    }

    /**
     * Revision for the drive represented as a string.
     * @type {String}
     */
    szRevision {
        get => StrGet(this.ptr + 208, 31, "UTF-16")
        set => StrPut(value, this.ptr + 208, 31, "UTF-16")
    }

    /**
     * SCSI host adapter to which the drive is connected.
     * @type {Integer}
     */
    ScsiPort {
        get => NumGet(this, 272, "ushort")
        set => NumPut("ushort", value, this, 272)
    }

    /**
     * SCSI bus to which the drive is connected.
     * @type {Integer}
     */
    ScsiBus {
        get => NumGet(this, 274, "ushort")
        set => NumPut("ushort", value, this, 274)
    }

    /**
     * SCSI target ID for the drive.
     * @type {Integer}
     */
    ScsiTarget {
        get => NumGet(this, 276, "ushort")
        set => NumPut("ushort", value, this, 276)
    }

    /**
     * SCSI logical unit ID for the drive.
     * @type {Integer}
     */
    ScsiLun {
        get => NumGet(this, 278, "ushort")
        set => NumPut("ushort", value, this, 278)
    }

    /**
     * Number of times the drive has had a medium mounted to it. If the drive supports the reporting of a unique serial number, this value is the number of times the drive has been mounted since it was installed. If the drive does not support the reporting of serial numbers, this member reflects the number of mounts to all of the drives at that location.
     * @type {Integer}
     */
    dwMountCount {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * Last time the drive was cleaned.
     * @type {SYSTEMTIME}
     */
    LastCleanedTs{
        get {
            if(!this.HasProp("__LastCleanedTs"))
                this.__LastCleanedTs := SYSTEMTIME(this.ptr + 288)
            return this.__LastCleanedTs
        }
    }

    /**
     * Partition identifier of the medium that is in the drive. If this value is NULL and the drive is found to be full, the media was loaded by a user and needs to be classified.
     * @type {Pointer<Guid>}
     */
    SavedPartitionId {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * Unique identifier of the library that contains the drive.
     * @type {Pointer<Guid>}
     */
    Library {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }

    /**
     * Reserved.
     * @type {Pointer<Guid>}
     */
    Reserved {
        get => NumGet(this, 320, "ptr")
        set => NumPut("ptr", value, this, 320)
    }

    /**
     * Minimum number of seconds a medium will remain in a drive of a library after a deferred dismount has been performed. The default is 5 minutes. This member does not apply to stand-alone libraries. This member is writable.
     * @type {Integer}
     */
    dwDeferDismountDelay {
        get => NumGet(this, 328, "uint")
        set => NumPut("uint", value, this, 328)
    }
}
