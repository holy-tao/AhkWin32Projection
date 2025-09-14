#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_CONTROLLER_PROP structure (vdshwprv.h) defines the properties of a controller object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdscontroller-getproperties">IVdsController::GetProperties</a> 
  *     method returns this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/controller-object">controller object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_controller_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_CONTROLLER_PROP extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The GUID of the controller object.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The name of the controller; a zero-terminated, human-readable string.
     * @type {Pointer<PWSTR>}
     */
    pwszFriendlyName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The subsystem identifier, typically a serial number; a zero-terminated, human-readable string.
     * @type {Pointer<PWSTR>}
     */
    pwszIdentification {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_controller_status">VDS_CONTROLLER_STATUS</a> enumeration value that specifies the status of the controller.
     * @type {Integer}
     */
    status {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health state of the controller. The following are the valid values for this member.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b><b>VDS_H_REPLACED</b> and <b>VDS_H_DEGRADED</b> are not supported.
     * @type {Integer}
     */
    health {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * The number of ports that the controller contains. Ports are numbered from zero. Hardware providers should set this member to zero for PCI RAID cards.
     * @type {Integer}
     */
    sNumberOfPorts {
        get => NumGet(this, 32, "short")
        set => NumPut("short", value, this, 32)
    }
}
