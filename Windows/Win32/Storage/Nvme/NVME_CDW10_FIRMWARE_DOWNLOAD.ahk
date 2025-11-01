#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_firmware_download
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW10_FIRMWARE_DOWNLOAD extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NUMD {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
