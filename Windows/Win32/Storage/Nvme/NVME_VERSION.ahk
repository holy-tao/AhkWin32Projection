#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains fields that specify the version number of the NVM Express specification that the controller implementation supports.
 * @remarks
 * Valid versions of the NVM Express specification are: 1.0, 1.1, and 1.2.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_version
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_VERSION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
