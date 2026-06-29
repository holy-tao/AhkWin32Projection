#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_INTERCONNECT_ADDRESS_TYPE.ahk" { VDS_INTERCONNECT_ADDRESS_TYPE }

/**
 * Defines the address data of a physical interconnect.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure includes this 
 *     structure as a member to specify an interconnect by which a LUN can be accessed.
 * @see https://learn.microsoft.com/windows/win32/api/vdslun/ns-vdslun-vds_interconnect
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_INTERCONNECT {
    #StructPack 8

    /**
     * The interconnect address type enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_interconnect_address_type">VDS_INTERCONNECT_ADDRESS_TYPE</a>.
     */
    m_addressType : VDS_INTERCONNECT_ADDRESS_TYPE

    /**
     * The size of the interconnect address data for the LUN port (<b>m_pbPort</b>), in bytes.
     */
    m_cbPort : UInt32

    /**
     * Pointer to the interconnect address data for the LUN port.
     */
    m_pbPort : IntPtr

    /**
     * The size of the interconnect address data for the LUN (<b>m_pbAddress</b>), in bytes.
     */
    m_cbAddress : UInt32

    /**
     * Pointer to the interconnect address data for the LUN.
     */
    m_pbAddress : IntPtr

}
