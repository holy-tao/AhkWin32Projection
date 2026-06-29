#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RAW_SCSI_VIRTUAL_DISK_VERSION.ahk" { RAW_SCSI_VIRTUAL_DISK_VERSION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains raw SCSI virtual disk request parameters.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-raw_scsi_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct RAW_SCSI_VIRTUAL_DISK_PARAMETERS {
    #StructPack 8


    struct _Version1 {
        RSVDHandle : BOOL

        DataIn : Int8

        CdbLength : Int8

        SenseInfoLength : Int8

        SrbFlags : UInt32

        DataTransferLength : UInt32

        DataBuffer : IntPtr

        SenseInfo : IntPtr

        Cdb : IntPtr

    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-raw_scsi_virtual_disk_version">RAW_SCSI_VIRTUAL_DISK_VERSION</a> enumeration that specifies the version of the <b>RAW_SCSI_VIRTUAL_DISK_PARAMETERS</b> structure being passed to or from the VHD functions.
     */
    Version : RAW_SCSI_VIRTUAL_DISK_VERSION

    Version1 : RAW_SCSI_VIRTUAL_DISK_PARAMETERS._Version1

}
