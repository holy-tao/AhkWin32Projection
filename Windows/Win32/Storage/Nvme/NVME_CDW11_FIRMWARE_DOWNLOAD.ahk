#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Firmware Image Download command that is used to copy a new firmware image (in whole or in part) to the controller.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_firmware_download
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FIRMWARE_DOWNLOAD {
    #StructPack 4

    /**
     * The Offset (OFST) field specifies the number of Dwords offset from the start of the firmware image being downloaded to the controller. The offset is used to construct the complete firmware image when the firmware is downloaded in multiple pieces. The piece corresponding to the start of the firmware image has an Offset of `0h`.
     */
    OFST : UInt32

}
