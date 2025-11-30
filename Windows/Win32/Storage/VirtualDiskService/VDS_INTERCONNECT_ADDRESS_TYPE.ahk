#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of the valid address types of a physical interconnect.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ns-vdslun-vds_interconnect">VDS_INTERCONNECT</a> structure includes a <b>VDS_INTERCONNECT_ADDRESS_TYPE</b> value as a member to indicate an interconnect address type.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_INTERCONNECT_ADDRESS_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_INTERCONNECT_ADDRESS_TYPE</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vdslun/ne-vdslun-vds_interconnect_address_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_INTERCONNECT_ADDRESS_TYPE extends Win32Enum{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_IA_UNKNOWN => 0

    /**
     * The address type is FCFS.
     * @type {Integer (Int32)}
     */
    static VDS_IA_FCFS => 1

    /**
     * The address type is FCPH.
     * @type {Integer (Int32)}
     */
    static VDS_IA_FCPH => 2

    /**
     * The address type is FCPH3.
     * @type {Integer (Int32)}
     */
    static VDS_IA_FCPH3 => 3

    /**
     * The address type is MAC.
     * @type {Integer (Int32)}
     */
    static VDS_IA_MAC => 4

    /**
     * The address type is SCSI.
     * @type {Integer (Int32)}
     */
    static VDS_IA_SCSI => 5
}
