#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_HBAPORT_TYPE.ahk" { VDS_HBAPORT_TYPE }
#Import ".\VDS_WWN.ahk" { VDS_WWN }
#Import ".\VDS_HBAPORT_STATUS.ahk" { VDS_HBAPORT_STATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The VDS_HBAPORT_PROP structure (vdshwprv.h) defines the properties of an HBA port.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_hbaport_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_HBAPORT_PROP {
    #StructPack 4

    /**
     * The GUID assigned to the HBA port. This ID is used by the VDS service only; hardware providers should 
     *       ignore this field.
     */
    id : Guid

    /**
     * The node WWN of the HBA port.
     */
    wwnNode : VDS_WWN

    /**
     * The port WWN of the HBA port.
     */
    wwnPort : VDS_WWN

    /**
     * The type of the HBA port enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hbaport_type">VDS_HBAPORT_TYPE</a>.
     */
    type : VDS_HBAPORT_TYPE

    /**
     * The status of the HBA port enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hbaport_status">VDS_HBAPORT_STATUS</a>.
     */
    status : VDS_HBAPORT_STATUS

    /**
     * The speed of the HBA port enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hbaport_speed_flag">VDS_HBAPORT_SPEED_FLAG</a>.
     */
    ulPortSpeed : UInt32

    /**
     * The set of supported speeds of the HBA port, one bit set for each of the supported speeds  enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_hbaport_speed_flag">VDS_HBAPORT_SPEED_FLAG</a>.
     */
    ulSupportedPortSpeed : UInt32

}
