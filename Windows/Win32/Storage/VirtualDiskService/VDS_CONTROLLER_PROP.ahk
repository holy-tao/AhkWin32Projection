#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\VDS_CONTROLLER_STATUS.ahk" { VDS_CONTROLLER_STATUS }
#Import ".\VDS_HEALTH.ahk" { VDS_HEALTH }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_CONTROLLER_PROP structure (vdshwprv.h) defines the properties of a controller object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdscontroller-getproperties">IVdsController::GetProperties</a> 
 *     method returns this structure to report the properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/controller-object">controller object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_controller_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_CONTROLLER_PROP {
    #StructPack 8

    /**
     * The GUID of the controller object.
     */
    id : Guid

    /**
     * The name of the controller; a zero-terminated, human-readable string.
     */
    pwszFriendlyName : PWSTR

    /**
     * The subsystem identifier, typically a serial number; a zero-terminated, human-readable string.
     */
    pwszIdentification : PWSTR

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_controller_status">VDS_CONTROLLER_STATUS</a> enumeration value that specifies the status of the controller.
     */
    status : VDS_CONTROLLER_STATUS

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_health">VDS_HEALTH</a> enumeration value that specifies the health state of the controller. The following are the valid values for this member.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b><b>VDS_H_REPLACED</b> and <b>VDS_H_DEGRADED</b> are not supported.
     */
    health : VDS_HEALTH

    /**
     * The number of ports that the controller contains. Ports are numbered from zero. Hardware providers should set this member to zero for PCI RAID cards.
     */
    sNumberOfPorts : Int16

}
