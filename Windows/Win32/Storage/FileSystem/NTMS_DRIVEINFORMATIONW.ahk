#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

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
 * @charset Unicode
 */
export default struct NTMS_DRIVEINFORMATIONW {
    #StructPack 4

    /**
     * Number of the drive in the library. This is set zero or one relative the value based on the drive numbering system of the device. Some changers number drives beginning with zero, and some changers begin with one.
     */
    Number : UInt32

    State : UInt32

    /**
     * Unique identifier of the drive type object containing the attributes for the drive.
     */
    DriveType : Guid

    /**
     * Name of the device used to access the drive. For a tape drive this contains the device name \\.\tape0 or \\.\tape1. Other devices provide the name of a SCSI disk drive or the root of a file system that currently has the device mounted (raw, NTFS, FAT and so forth).
     */
    szDeviceName : WCHAR[64]

    /**
     * Serial number for the drive represented as a string. Devices that do not support serial numbers report NULL for this member.
     */
    szSerialNumber : WCHAR[32]

    /**
     * Revision for the drive represented as a string.
     */
    szRevision : WCHAR[32]

    /**
     * SCSI host adapter to which the drive is connected.
     */
    ScsiPort : UInt16

    /**
     * SCSI bus to which the drive is connected.
     */
    ScsiBus : UInt16

    /**
     * SCSI target ID for the drive.
     */
    ScsiTarget : UInt16

    /**
     * SCSI logical unit ID for the drive.
     */
    ScsiLun : UInt16

    /**
     * Number of times the drive has had a medium mounted to it. If the drive supports the reporting of a unique serial number, this value is the number of times the drive has been mounted since it was installed. If the drive does not support the reporting of serial numbers, this member reflects the number of mounts to all of the drives at that location.
     */
    dwMountCount : UInt32

    /**
     * Last time the drive was cleaned.
     */
    LastCleanedTs : SYSTEMTIME

    /**
     * Partition identifier of the medium that is in the drive. If this value is NULL and the drive is found to be full, the media was loaded by a user and needs to be classified.
     */
    SavedPartitionId : Guid

    /**
     * Unique identifier of the library that contains the drive.
     */
    Library : Guid

    /**
     * Reserved.
     */
    Reserved : Guid

    /**
     * Minimum number of seconds a medium will remain in a drive of a library after a deferred dismount has been performed. The default is 5 minutes. This member does not apply to stand-alone libraries. This member is writable.
     */
    dwDeferDismountDelay : UInt32

}
