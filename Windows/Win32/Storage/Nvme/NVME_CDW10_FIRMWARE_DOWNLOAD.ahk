#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NVME_CDW10_FIRMWARE_DOWNLOAD structure contains parameters for the Firmware Image Download command that copies a new firmware image to the controller.
 * @remarks
 * The Firmware Image Download command may be submitted while other commands on the Admin Submission Queue or I/O Submission Queues are outstanding.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_firmware_download
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_FIRMWARE_DOWNLOAD {
    #StructPack 4

    /**
     * The Number of Dwords (NUMD) field specifies the number of Dwords to transfer for this portion of the firmware. This is a 0’s based value.
     */
    NUMD : UInt32

}
