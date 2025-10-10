#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the tape drive. It is used by the GetTapeParameters function.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-tape_get_drive_parameters
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class TAPE_GET_DRIVE_PARAMETERS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * If this member is <b>TRUE</b>, the device supports hardware error correction. Otherwise, it does not.
     * @type {Integer}
     */
    ECC {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * If this member is <b>TRUE</b>, hardware data compression is enabled. Otherwise, it is disabled.
     * @type {Integer}
     */
    Compression {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * If this member is <b>TRUE</b>, data padding is enabled. Otherwise, it is disabled. Data padding keeps the tape streaming at a constant speed.
     * @type {Integer}
     */
    DataPadding {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * If this member is <b>TRUE</b>, setmark reporting is enabled. Otherwise, it is disabled.
     * @type {Integer}
     */
    ReportSetmarks {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Device's default fixed block size, in bytes.
     * @type {Integer}
     */
    DefaultBlockSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Device's maximum block size, in bytes.
     * @type {Integer}
     */
    MaximumBlockSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Device's minimum block size, in bytes.
     * @type {Integer}
     */
    MinimumBlockSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Maximum number of partitions that can be created on the device.
     * @type {Integer}
     */
    MaximumPartitionCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Low-order bits of the device features flag. This member can be one or more of following values. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_COMPRESSION"></a><a id="tape_drive_compression"></a><dl>
     * <dt><b>TAPE_DRIVE_COMPRESSION</b></dt>
     * <dt>0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports hardware data compression.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_CLEAN_REQUESTS"></a><a id="tape_drive_clean_requests"></a><dl>
     * <dt><b>TAPE_DRIVE_CLEAN_REQUESTS</b></dt>
     * <dt>0x02000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device can report if cleaning is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_ECC"></a><a id="tape_drive_ecc"></a><dl>
     * <dt><b>TAPE_DRIVE_ECC</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports hardware error correction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_EJECT_MEDIA"></a><a id="tape_drive_eject_media"></a><dl>
     * <dt><b>TAPE_DRIVE_EJECT_MEDIA</b></dt>
     * <dt>0x01000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device physically ejects the tape on a software eject.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_ERASE_BOP_ONLY"></a><a id="tape_drive_erase_bop_only"></a><dl>
     * <dt><b>TAPE_DRIVE_ERASE_BOP_ONLY</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device performs the erase operation from the beginning-of-partition marker only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_ERASE_LONG"></a><a id="tape_drive_erase_long"></a><dl>
     * <dt><b>TAPE_DRIVE_ERASE_LONG</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device performs a long erase operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_ERASE_IMMEDIATE"></a><a id="tape_drive_erase_immediate"></a><dl>
     * <dt><b>TAPE_DRIVE_ERASE_IMMEDIATE</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device performs an immediate erase operation — that is, it returns when the erase operation begins.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_ERASE_SHORT"></a><a id="tape_drive_erase_short"></a><dl>
     * <dt><b>TAPE_DRIVE_ERASE_SHORT</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device performs a short erase operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_FIXED"></a><a id="tape_drive_fixed"></a><dl>
     * <dt><b>TAPE_DRIVE_FIXED</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device creates fixed data partitions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_FIXED_BLOCK"></a><a id="tape_drive_fixed_block"></a><dl>
     * <dt><b>TAPE_DRIVE_FIXED_BLOCK</b></dt>
     * <dt>0x00000400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports fixed-length block mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_GET_ABSOLUTE_BLK"></a><a id="tape_drive_get_absolute_blk"></a><dl>
     * <dt><b>TAPE_DRIVE_GET_ABSOLUTE_BLK</b></dt>
     * <dt>0x00100000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device provides the current device-specific block address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_GET_LOGICAL_BLK"></a><a id="tape_drive_get_logical_blk"></a><dl>
     * <dt><b>TAPE_DRIVE_GET_LOGICAL_BLK</b></dt>
     * <dt>0x00200000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device provides the current logical block address (and logical tape partition).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_INITIATOR"></a><a id="tape_drive_initiator"></a><dl>
     * <dt><b>TAPE_DRIVE_INITIATOR</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device creates initiator-defined partitions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_PADDING"></a><a id="tape_drive_padding"></a><dl>
     * <dt><b>TAPE_DRIVE_PADDING</b></dt>
     * <dt>0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports data padding.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_REPORT_SMKS"></a><a id="tape_drive_report_smks"></a><dl>
     * <dt><b>TAPE_DRIVE_REPORT_SMKS</b></dt>
     * <dt>0x00080000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports setmark reporting.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_SELECT"></a><a id="tape_drive_select"></a><dl>
     * <dt><b>TAPE_DRIVE_SELECT</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device creates select data partitions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_SET_CMP_BOP_ONLY"></a><a id="tape_drive_set_cmp_bop_only"></a><dl>
     * <dt><b>TAPE_DRIVE_SET_CMP_BOP_ONLY</b></dt>
     * <dt>0x04000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device must be at the beginning of a partition before it can set compression on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_SET_EOT_WZ_SIZE"></a><a id="tape_drive_set_eot_wz_size"></a><dl>
     * <dt><b>TAPE_DRIVE_SET_EOT_WZ_SIZE</b></dt>
     * <dt>0x00400000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports setting the end-of-medium warning size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_TAPE_CAPACITY"></a><a id="tape_drive_tape_capacity"></a><dl>
     * <dt><b>TAPE_DRIVE_TAPE_CAPACITY</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device returns the maximum capacity of the tape.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_TAPE_REMAINING"></a><a id="tape_drive_tape_remaining"></a><dl>
     * <dt><b>TAPE_DRIVE_TAPE_REMAINING</b></dt>
     * <dt>0x00000200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device returns the remaining capacity of the tape.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_VARIABLE_BLOCK"></a><a id="tape_drive_variable_block"></a><dl>
     * <dt><b>TAPE_DRIVE_VARIABLE_BLOCK</b></dt>
     * <dt>0x00000800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device supports variable-length block mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TAPE_DRIVE_WRITE_PROTECT"></a><a id="tape_drive_write_protect"></a><dl>
     * <dt><b>TAPE_DRIVE_WRITE_PROTECT</b></dt>
     * <dt>0x00001000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device returns an error if the tape is write-enabled or write-protected.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    FeaturesLow {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    FeaturesHigh {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Indicates the number of bytes between the end-of-tape warning and the physical end of the tape.
     * @type {Integer}
     */
    EOTWarningZoneSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
