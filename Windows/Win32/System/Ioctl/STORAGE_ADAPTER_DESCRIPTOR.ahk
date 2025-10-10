#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with the IOCTL_STORAGE_QUERY_PROPERTY control code to retrieve the storage adapter descriptor data for a device.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-storage_adapter_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_ADAPTER_DESCRIPTOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the maximum number of bytes the storage adapter can transfer in a single operation.
     * @type {Integer}
     */
    MaximumTransferLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the maximum number of discontinuous physical pages the storage adapter can manage in a single 
     *       transfer (in other words, the extent of its scatter/gather support).
     * @type {Integer}
     */
    MaximumPhysicalPages {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

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
     * @type {Integer}
     */
    AlignmentMask {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * If this member is <b>TRUE</b>, the storage adapter uses programmed I/O (PIO) and 
     *       requires the use of system-space virtual addresses mapped to physical memory for data buffers. When this member 
     *       is <b>FALSE</b>, the storage adapter does not use PIO.
     * @type {Integer}
     */
    AdapterUsesPio {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * If this member is <b>TRUE</b>, the storage adapter scans down for BIOS devices, that is, 
     *       the storage adapter begins scanning with the highest device number rather than the lowest. When this member is 
     *       <b>FALSE</b>, the storage adapter begins scanning with the lowest device number. This member 
     *       is reserved for legacy miniport drivers.
     * @type {Integer}
     */
    AdapterScansDown {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * If this member is <b>TRUE</b>, the storage adapter supports SCSI tagged queuing and/or 
     *       per-logical-unit internal queues, or the non-SCSI equivalent. When this member is 
     *       <b>FALSE</b>, the storage adapter neither supports SCSI-tagged queuing nor per-logical-unit 
     *       internal queues.
     * @type {Integer}
     */
    CommandQueueing {
        get => NumGet(this, 22, "char")
        set => NumPut("char", value, this, 22)
    }

    /**
     * If this member is <b>TRUE</b>, the storage adapter supports synchronous transfers as a 
     *       way of speeding up I/O. When this member is <b>FALSE</b>, the storage adapter does not 
     *       support synchronous transfers as a way of speeding up I/O.
     * @type {Integer}
     */
    AcceleratedTransfer {
        get => NumGet(this, 23, "char")
        set => NumPut("char", value, this, 23)
    }

    /**
     * Specifies a value of type <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_bus_type">STORAGE_BUS_TYPE</a> that 
     *       indicates the type of the bus to which the device is connected.
     * @type {Integer}
     */
    BusType {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * Specifies the major version number, if any, of the storage adapter.
     * @type {Integer}
     */
    BusMajorVersion {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * Specifies the minor version number, if any, of the storage adapter.
     * @type {Integer}
     */
    BusMinorVersion {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

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
     * @type {Integer}
     */
    SrbType {
        get => NumGet(this, 30, "char")
        set => NumPut("char", value, this, 30)
    }

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
     * @type {Integer}
     */
    AddressType {
        get => NumGet(this, 31, "char")
        set => NumPut("char", value, this, 31)
    }
}
