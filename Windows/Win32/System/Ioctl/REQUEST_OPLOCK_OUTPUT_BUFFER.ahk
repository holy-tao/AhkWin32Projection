#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the opportunistic lock (oplock) information returned by the FSCTL_REQUEST_OPLOCK control code.
 * @remarks
 * 
  * The <b>REQUEST_OPLOCK_OUTPUT_FLAG_MODES_PROVIDED</b> flag indicates that the 
  *     <b>ShareMode</b> and <b>AccessMode</b> fields contain the share and access 
  *     flags, respectively, of the request causing the oplock break. This information may be provided on breaks where the 
  *     <b>OPLOCK_LEVEL_CACHE_HANDLE</b> level is being lost and may be useful to callers who can close 
  *     handles whose share and access modes conflict with the handle causing the break. This may enable them to maintain 
  *     at least some handle cache state. Note that not all breaks where the 
  *     <b>OPLOCK_LEVEL_CACHE_HANDLE</b> level is being lost will have this flag set. The primary case 
  *     where this flag will be set is if the break is a result of a create operation that needs the 
  *     <b>OPLOCK_LEVEL_CACHE_HANDLE</b> oplock to be broken to avoid failing with 
  *     <b>ERROR_SHARING_VIOLATION</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-request_oplock_output_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class REQUEST_OPLOCK_OUTPUT_BUFFER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The version of the 
     *       <b>REQUEST_OPLOCK_OUTPUT_BUFFER</b> structure that 
     *       is being used.
     * @type {Integer}
     */
    StructureVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The length of this structure, in bytes.
     * @type {Integer}
     */
    StructureLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * One or more <b>OPLOCK_LEVEL_CACHE_</b><i>XXX</i> values that indicate 
     *        the level of the oplock that was broken.
     * 
     * For possible values, see the <b>RequestedOplockLevel</b> member of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-request_oplock_input_buffer">REQUEST_OPLOCK_INPUT_BUFFER</a> structure.
     * @type {Integer}
     */
    OriginalOplockLevel {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * One or more <b>OPLOCK_LEVEL_CACHE_</b><i>XXX</i> values that indicate 
     *        the level to which an oplock is being broken, or an oplock level that may be available for granting, depending 
     *        on the operation returning this buffer.
     * 
     * For possible values, see the <b>RequestedOplockLevel</b> member of the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-request_oplock_input_buffer">REQUEST_OPLOCK_INPUT_BUFFER</a> structure.
     * @type {Integer}
     */
    NewOplockLevel {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * One or more <b>REQUEST_OPLOCK_OUTPUT_FLAG_</b><i>XXX</i> values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REQUEST_OPLOCK_OUTPUT_FLAG_ACK_REQUIRED"></a><a id="request_oplock_output_flag_ack_required"></a><dl>
     * <dt><b>REQUEST_OPLOCK_OUTPUT_FLAG_ACK_REQUIRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that an acknowledgment is required, and the oplock described in 
     *         <b>OriginalOplockLevel</b> will continue to remain in force until the break is 
     *         successfully acknowledged.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REQUEST_OPLOCK_OUTPUT_FLAG_MODES_PROVIDED"></a><a id="request_oplock_output_flag_modes_provided"></a><dl>
     * <dt><b>REQUEST_OPLOCK_OUTPUT_FLAG_MODES_PROVIDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the <b>ShareMode</b> and <b>AccessMode</b> members 
     *         contain the share and access flags, respectively, of the request causing the oplock break. For more 
     *         information, see the Remarks section.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * If the <b>REQUEST_OPLOCK_OUTPUT_FLAG_MODES_PROVIDED</b> flag is set and the 
     *       <b>OPLOCK_LEVEL_CACHE_HANDLE</b> level is being lost in an oplock break, contains the access 
     *       mode mode of the request that is causing the break.
     * @type {Integer}
     */
    AccessMode {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * If the <b>REQUEST_OPLOCK_OUTPUT_FLAG_MODES_PROVIDED</b> flag is set and the 
     *       <b>OPLOCK_LEVEL_CACHE_HANDLE</b> level is being lost in an oplock break, contains the share 
     *       mode of the request that is causing the break.
     * @type {Integer}
     */
    ShareMode {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }
}
