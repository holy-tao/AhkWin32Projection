#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RAW_SCSI_VIRTUAL_DISK_VERSION.ahk" { RAW_SCSI_VIRTUAL_DISK_VERSION }

/**
 * Contains raw SCSI virtual disk response parameters.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-raw_scsi_virtual_disk_response
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct RAW_SCSI_VIRTUAL_DISK_RESPONSE {
    #StructPack 4


    struct _Version1 {
        ScsiStatus : Int8

        SenseInfoLength : Int8

        DataTransferLength : UInt32

    }

    /**
     * A [RAW_SCSI_VIRTUAL_DISK_PARAMETERS](./ns-virtdisk-raw_scsi_virtual_disk_parameters.md) structure being passed to or from the VHD functions.
     */
    Version : RAW_SCSI_VIRTUAL_DISK_VERSION

    Version1 : RAW_SCSI_VIRTUAL_DISK_RESPONSE._Version1

}
