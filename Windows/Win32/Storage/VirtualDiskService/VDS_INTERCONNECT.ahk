#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the address data of a physical interconnect.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_lun_information">VDS_LUN_INFORMATION</a> structure includes this 
 *     structure as a member to specify an interconnect by which a LUN can be accessed.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vdslun/ns-vdslun-vds_interconnect
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_INTERCONNECT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The interconnect address type enumerated by 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_interconnect_address_type">VDS_INTERCONNECT_ADDRESS_TYPE</a>.
     * @type {Integer}
     */
    m_addressType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The size of the interconnect address data for the LUN port (<b>m_pbPort</b>), in bytes.
     * @type {Integer}
     */
    m_cbPort {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to the interconnect address data for the LUN port.
     * @type {Pointer<Integer>}
     */
    m_pbPort {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size of the interconnect address data for the LUN (<b>m_pbAddress</b>), in bytes.
     * @type {Integer}
     */
    m_cbAddress {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to the interconnect address data for the LUN.
     * @type {Pointer<Integer>}
     */
    m_pbAddress {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
