#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the information to request an opportunistic lock (oplock) or to acknowledge an oplock break with the FSCTL_REQUEST_OPLOCK control code.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-request_oplock_input_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class REQUEST_OPLOCK_INPUT_BUFFER extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The version of the 
     *       <b>REQUEST_OPLOCK_INPUT_BUFFER</b> structure that 
     *       is being used. Set this member to <b>REQUEST_OPLOCK_CURRENT_VERSION</b>.
     * @type {Integer}
     */
    StructureVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The length of this structure, in bytes. Must be set to 
     *       <c>sizeof(REQUEST_OPLOCK_INPUT_BUFFER)</c>.
     * @type {Integer}
     */
    StructureLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * A valid combination of the following oplock level values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPLOCK_LEVEL_CACHE_READ"></a><a id="oplock_level_cache_read"></a><dl>
     * <dt><b>OPLOCK_LEVEL_CACHE_READ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows clients to cache reads. May be granted to multiple clients.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPLOCK_LEVEL_CACHE_HANDLE"></a><a id="oplock_level_cache_handle"></a><dl>
     * <dt><b>OPLOCK_LEVEL_CACHE_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows clients to cache open handles. May be granted to multiple clients.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPLOCK_LEVEL_CACHE_WRITE"></a><a id="oplock_level_cache_write"></a><dl>
     * <dt><b>OPLOCK_LEVEL_CACHE_WRITE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows clients to cache writes and byte range locks. May be granted only to a single client.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Valid combinations of these values are as follows:
     * 
     * <ul>
     * <li><c>OPLOCK_LEVEL_CACHE_READ</c></li>
     * <li><c>OPLOCK_LEVEL_CACHE_READ | OPLOCK_LEVEL_CACHE_HANDLE</c></li>
     * <li><c>OPLOCK_LEVEL_CACHE_READ | OPLOCK_LEVEL_CACHE_WRITE</c></li>
     * <li><c>OPLOCK_LEVEL_CACHE_READ | OPLOCK_LEVEL_CACHE_WRITE | OPLOCK_LEVEL_CACHE_HANDLE</c></li>
     * </ul>
     * For more information about these value combinations, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_request_oplock">FSCTL_REQUEST_OPLOCK</a>.
     * @type {Integer}
     */
    RequestedOplockLevel {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A valid combination of the following request flag values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REQUEST_OPLOCK_INPUT_FLAG_REQUEST"></a><a id="request_oplock_input_flag_request"></a><dl>
     * <dt><b>REQUEST_OPLOCK_INPUT_FLAG_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Request for a new oplock.  Setting this flag together with 
     *         <b>REQUEST_OPLOCK_INPUT_FLAG_ACK</b> is not valid and will cause the request to fail with 
     *         <b>ERROR_INVALID_PARAMETER</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REQUEST_OPLOCK_INPUT_FLAG_ACK"></a><a id="request_oplock_input_flag_ack"></a><dl>
     * <dt><b>REQUEST_OPLOCK_INPUT_FLAG_ACK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Acknowledgment of an oplock break.  Setting this flag together with 
     *          <b>REQUEST_OPLOCK_ INPUT_FLAG_REQUEST</b> is not valid and will cause the request to fail 
     *          with <b>ERROR_INVALID_PARAMETER</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
