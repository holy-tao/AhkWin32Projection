#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters for the Firmware Image Download command that is used to copy a new firmware image (in whole or in part) to the controller.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_firmware_download
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW11_FIRMWARE_DOWNLOAD extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The Offset (OFST) field specifies the number of Dwords offset from the start of the firmware image being downloaded to the controller. The offset is used to construct the complete firmware image when the firmware is downloaded in multiple pieces. The piece corresponding to the start of the firmware image has an Offset of `0h`.
     * @type {Integer}
     */
    OFST {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
