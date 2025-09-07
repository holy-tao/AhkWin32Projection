#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a parameter for the Identify command.
 * @remarks
 * The Identify command returns information about the controller in the [NVME_IDENTIFY_CONTROLLER_DATA](ns-nvme-nvme_identify_controller_data.md) data structure, and namespace information in the [NVME_IDENTIFY_NAMESPACE_DATA](../nvme/ns-nvme-nvme_identify_namespace_data.md) data structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_identify
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW11_IDENTIFY extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NVMSETID {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Anonymous2 {
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
