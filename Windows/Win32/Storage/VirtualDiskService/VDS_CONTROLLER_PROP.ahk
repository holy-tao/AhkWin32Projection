#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_HEALTH.ahk
#Include .\VDS_CONTROLLER_STATUS.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The VDS_CONTROLLER_PROP structure (vdshwprv.h) defines the properties of a controller object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdscontroller-getproperties">IVdsController::GetProperties</a> 
 *     method returns this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/controller-object">controller object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_controller_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_CONTROLLER_PROP extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * The GUID of the controller object.
     * @type {Guid}
     */
    id {
        get {
            if(!this.HasProp("__id"))
                this.__id := Guid(0, this)
            return this.__id
        }
    }

    /**
     * The name of the controller; a zero-terminated, human-readable string.
     * @type {PWSTR}
     */
    pwszFriendlyName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The subsystem identifier, typically a serial number; a zero-terminated, human-readable string.
     * @type {PWSTR}
     */
    pwszIdentification {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_controller_status">VDS_CONTROLLER_STATUS</a> enumeration value that specifies the status of the controller.
     * @type {VDS_CONTROLLER_STATUS}
     */
    status {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health state of the controller. The following are the valid values for this member.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b><b>VDS_H_REPLACED</b> and <b>VDS_H_DEGRADED</b> are not supported.
     * @type {VDS_HEALTH}
     */
    health {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * The number of ports that the controller contains. Ports are numbered from zero. Hardware providers should set this member to zero for PCI RAID cards.
     * @type {Integer}
     */
    sNumberOfPorts {
        get => NumGet(this, 40, "short")
        set => NumPut("short", value, this, 40)
    }
}
