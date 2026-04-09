#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that is used to construct the SCSI name string identifier.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_scsi_name_string
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_SCSI_NAME_STRING extends Win32Struct {
    static sizeof => 68

    static packingSize => 2

    /**
     * The company vendor identifier that is assigned by the [Peripheral Component Interconnect - Special Interest Group (PCI-SIG)](https://pcisig.com/).
     * 
     * This value is also in the **VID** field of the [NVME_IDENTIFY_CONTROLLER_DATA](ns-nvme-nvme_identify_controller_data.md) data structure.
     * @type {String}
     */
    PCIVendorID {
        get => StrGet(this.ptr + 0, 3, "UTF-8")
        set => StrPut(value, this.ptr + 0, 3, "UTF-8")
    }

    /**
     * The model number for the NVM subsystem that is assigned by the vendor as an ASCII string.
     * 
     * This value is also in the **MN** field of the [NVME_IDENTIFY_CONTROLLER_DATA](ns-nvme-nvme_identify_controller_data.md) data structure.
     * @type {String}
     */
    ModelNumber {
        get => StrGet(this.ptr + 4, 39, "UTF-8")
        set => StrPut(value, this.ptr + 4, 39, "UTF-8")
    }

    /**
     * The namespace identifier.
     * 
     * This value is also in the **NSID** field of the [NVME_COMMAND](ns-nvme-nvme_command.md) structure.
     * @type {String}
     */
    NamespaceID {
        get => StrGet(this.ptr + 44, 3, "UTF-8")
        set => StrPut(value, this.ptr + 44, 3, "UTF-8")
    }

    /**
     * The serial number for the NVM subsystem that is assigned by the vendor as an ASCII string.
     * 
     * This value is also in the **SN** field of the [NVME_IDENTIFY_CONTROLLER_DATA](ns-nvme-nvme_identify_controller_data.md) data structure.
     * @type {String}
     */
    SerialNumber {
        get => StrGet(this.ptr + 48, 19, "UTF-8")
        set => StrPut(value, this.ptr + 48, 19, "UTF-8")
    }
}
