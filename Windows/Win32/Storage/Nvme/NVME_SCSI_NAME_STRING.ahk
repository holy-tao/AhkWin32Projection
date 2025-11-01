#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_scsi_name_string
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_SCSI_NAME_STRING extends Win32Struct
{
    static sizeof => 136

    static packingSize => 2

    /**
     * @type {String}
     */
    PCIVendorID {
        get => StrGet(this.ptr + 0, 3, "UTF-16")
        set => StrPut(value, this.ptr + 0, 3, "UTF-16")
    }

    /**
     * @type {String}
     */
    ModelNumber {
        get => StrGet(this.ptr + 8, 39, "UTF-16")
        set => StrPut(value, this.ptr + 8, 39, "UTF-16")
    }

    /**
     * @type {String}
     */
    NamespaceID {
        get => StrGet(this.ptr + 88, 3, "UTF-16")
        set => StrPut(value, this.ptr + 88, 3, "UTF-16")
    }

    /**
     * @type {String}
     */
    SerialNumber {
        get => StrGet(this.ptr + 96, 19, "UTF-16")
        set => StrPut(value, this.ptr + 96, 19, "UTF-16")
    }
}
