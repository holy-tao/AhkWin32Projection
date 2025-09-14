#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that is used to construct the SCSI name string identifier.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_scsi_name_string
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_SCSI_NAME_STRING extends Win32Struct
{
    static sizeof => 68

    static packingSize => 1

    /**
     * The company vendor identifier that is assigned by the [Peripheral Component Interconnect - Special Interest Group (PCI-SIG)](https://pcisig.com/).
     * 
     * This value is also in the **VID** field of the [NVME_IDENTIFY_CONTROLLER_DATA](ns-nvme-nvme_identify_controller_data.md) data structure.
     * @type {Array<SByte>}
     */
    PCIVendorID{
        get {
            if(!this.HasProp("__PCIVendorIDProxyArray"))
                this.__PCIVendorIDProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__PCIVendorIDProxyArray
        }
    }

    /**
     * The model number for the NVM subsystem that is assigned by the vendor as an ASCII string.
     * 
     * This value is also in the **MN** field of the [NVME_IDENTIFY_CONTROLLER_DATA](ns-nvme-nvme_identify_controller_data.md) data structure.
     * @type {Array<SByte>}
     */
    ModelNumber{
        get {
            if(!this.HasProp("__ModelNumberProxyArray"))
                this.__ModelNumberProxyArray := Win32FixedArray(this.ptr + 4, 40, Primitive, "char")
            return this.__ModelNumberProxyArray
        }
    }

    /**
     * The namespace identifier.
     * 
     * This value is also in the **NSID** field of the [NVME_COMMAND](ns-nvme-nvme_command.md) structure.
     * @type {Array<SByte>}
     */
    NamespaceID{
        get {
            if(!this.HasProp("__NamespaceIDProxyArray"))
                this.__NamespaceIDProxyArray := Win32FixedArray(this.ptr + 44, 4, Primitive, "char")
            return this.__NamespaceIDProxyArray
        }
    }

    /**
     * The serial number for the NVM subsystem that is assigned by the vendor as an ASCII string.
     * 
     * This value is also in the **SN** field of the [NVME_IDENTIFY_CONTROLLER_DATA](ns-nvme-nvme_identify_controller_data.md) data structure.
     * @type {Array<SByte>}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumberProxyArray"))
                this.__SerialNumberProxyArray := Win32FixedArray(this.ptr + 48, 20, Primitive, "char")
            return this.__SerialNumberProxyArray
        }
    }
}
