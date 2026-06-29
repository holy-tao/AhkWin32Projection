#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_PORT_STATUS.ahk" { VDS_PORT_STATUS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_PORT_PROP structure (vdshwprv.h) defines the properties of a port on a controller object.
 * @remarks
 * The 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdscontroller-getportproperties">IVdsController::GetPortProperties</a> 
 *     method returns this structure to report the property details of a port on a controller object.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_port_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_PORT_PROP {
    #StructPack 8

    /**
     * The <b>VDS_OBJECT_ID</b> assigned to the port.
     */
    id : Guid

    /**
     * The name of the port; a zero-terminated, human-readable string.
     */
    pwszFriendlyName : PWSTR

    /**
     * The port identifier or address, typically a world wide name (WWN); a zero-terminated, human-readable 
     *       string.
     * 
     * For Fibre Channel networks, this member should be the WWN for the port, formatted as a hexadecimal string (16 characters long), most significant byte first. For example, a WWN address of 01:23:45:67:89:AB:CD:EF should be represented as "0123456789ABCDEF".
     */
    pwszIdentification : PWSTR

    /**
     * The status of the port enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_port_status">VDS_PORT_STATUS</a>.
     */
    status : VDS_PORT_STATUS

}
