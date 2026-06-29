#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains information that is used to construct the SCSI name string identifier.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_scsi_name_string
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_SCSI_NAME_STRING {
    #StructPack 2

    /**
     * The company vendor identifier that is assigned by the [Peripheral Component Interconnect - Special Interest Group (PCI-SIG)](https://pcisig.com/).
     * 
     * This value is also in the **VID** field of the [NVME_IDENTIFY_CONTROLLER_DATA](ns-nvme-nvme_identify_controller_data.md) data structure.
     */
    PCIVendorID : CHAR[4]

    /**
     * The model number for the NVM subsystem that is assigned by the vendor as an ASCII string.
     * 
     * This value is also in the **MN** field of the [NVME_IDENTIFY_CONTROLLER_DATA](ns-nvme-nvme_identify_controller_data.md) data structure.
     */
    ModelNumber : CHAR[40]

    /**
     * The namespace identifier.
     * 
     * This value is also in the **NSID** field of the [NVME_COMMAND](ns-nvme-nvme_command.md) structure.
     */
    NamespaceID : CHAR[4]

    /**
     * The serial number for the NVM subsystem that is assigned by the vendor as an ASCII string.
     * 
     * This value is also in the **SN** field of the [NVME_IDENTIFY_CONTROLLER_DATA](ns-nvme-nvme_identify_controller_data.md) data structure.
     */
    SerialNumber : CHAR[20]

}
