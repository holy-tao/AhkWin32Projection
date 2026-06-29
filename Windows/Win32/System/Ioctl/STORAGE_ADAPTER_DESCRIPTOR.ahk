#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Used with the IOCTL_STORAGE_QUERY_PROPERTY control code to retrieve the storage adapter descriptor data for a device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_adapter_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_ADAPTER_DESCRIPTOR {
    #StructPack 4

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
     */
    Version : UInt32

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     */
    Size : UInt32

    /**
     * Specifies the maximum number of bytes the storage adapter can transfer in a single operation.
     */
    MaximumTransferLength : UInt32

    /**
     * Specifies the maximum number of discontinuous physical pages the storage adapter can manage in a single 
     *       transfer (in other words, the extent of its scatter/gather support).
     */
    MaximumPhysicalPages : UInt32

    /**
     * Specifies the storage adapter's alignment requirements for transfers. The alignment mask indicates 
     *       alignment restrictions for buffers required by the storage adapter for transfer operations. Valid mask values 
     *       are also restricted by characteristics of the memory managers on different versions of Windows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffers must be aligned on <b>BYTE</b> boundaries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffers must be aligned on <b>WORD</b> boundaries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffers must be aligned on <b>DWORD32</b> boundaries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Buffers must be aligned on <b>DWORD64</b> boundaries.
     * 
     * </td>
     * </tr>
     * </table>
     */
    AlignmentMask : UInt32

    /**
     * If this member is <b>TRUE</b>, the storage adapter uses programmed I/O (PIO) and 
     *       requires the use of system-space virtual addresses mapped to physical memory for data buffers. When this member 
     *       is <b>FALSE</b>, the storage adapter does not use PIO.
     */
    AdapterUsesPio : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the storage adapter scans down for BIOS devices, that is, 
     *       the storage adapter begins scanning with the highest device number rather than the lowest. When this member is 
     *       <b>FALSE</b>, the storage adapter begins scanning with the lowest device number. This member 
     *       is reserved for legacy miniport drivers.
     */
    AdapterScansDown : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the storage adapter supports SCSI tagged queuing and/or 
     *       per-logical-unit internal queues, or the non-SCSI equivalent. When this member is 
     *       <b>FALSE</b>, the storage adapter neither supports SCSI-tagged queuing nor per-logical-unit 
     *       internal queues.
     */
    CommandQueueing : BOOLEAN

    /**
     * If this member is <b>TRUE</b>, the storage adapter supports synchronous transfers as a 
     *       way of speeding up I/O. When this member is <b>FALSE</b>, the storage adapter does not 
     *       support synchronous transfers as a way of speeding up I/O.
     */
    AcceleratedTransfer : BOOLEAN

    /**
     * Specifies a value of type <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_bus_type">STORAGE_BUS_TYPE</a> that 
     *       indicates the type of the bus to which the device is connected.
     */
    BusType : Int8

    /**
     * Specifies the major version number, if any, of the storage adapter.
     */
    BusMajorVersion : UInt16

    /**
     * Specifies the minor version number, if any, of the storage adapter.
     */
    BusMinorVersion : UInt16

    /**
     * Specifies the SCSI request block (SRB) type used by the HBA.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SRB_TYPE_SCSI_REQUEST_BLOCK"></a><a id="srb_type_scsi_request_block"></a><dl>
     * <dt><b>SRB_TYPE_SCSI_REQUEST_BLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HBA uses SCSI request blocks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SRB_TYPE_STORAGE_REQUEST_BLOCK"></a><a id="srb_type_storage_request_block"></a><dl>
     * <dt><b>SRB_TYPE_STORAGE_REQUEST_BLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HBA uses extended SCSI request blocks.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This member is valid starting with Windows 8.
     */
    SrbType : Int8

    /**
     * Specifies the address type of the HBA.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="STORAGE_ADDRESS_TYPE_BTL8"></a><a id="storage_address_type_btl8"></a><dl>
     * <dt><b>STORAGE_ADDRESS_TYPE_BTL8</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HBA uses 8-bit bus, target, and LUN addressing.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This member is valid starting with Windows 8.
     */
    AddressType : Int8

}
