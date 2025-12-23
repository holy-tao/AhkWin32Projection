#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The NCB structure represents a network control block.
 * @remarks
 * Using <b>ncb_event</b> to issue asynchronous requests requires fewer system resources than using <b>ncb_post</b>. In addition, when <b>ncb_event</b> is nonzero, the pending request is canceled if the thread terminates before the request is processed. This is not true for asynchronous requests sent using <b>ncb_post</b>.
 * @see https://learn.microsoft.com/windows/win32/api/nb30/ns-nb30-ncb
 * @namespace Windows.Win32.NetworkManagement.NetBios
 * @version v4.0.30319
 */
class NCB extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Specifies the command code and a flag that indicates whether the <b>NCB</b> structure is processed asynchronously. The most significant bit contains the flag. If the ASYNCH constant is combined with a command code (by using the OR operator), the <b>NCB</b> structure is processed asynchronously. The following command codes are supported.
     * 
     * <table>
     * <tr>
     * <th>Code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>NCBACTION</td>
     * <td>
     * 
     * <b>Windows Server 2003, Windows XP, Windows 2000, and Windows NT:  </b>Enables extensions to the transport interface. NCBACTION is mapped to <b>TdiAction</b>. When this code is specified, the <b>ncb_buffer</b> member points to a buffer to be filled with an <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-action_header">ACTION_HEADER</a> structure, which is optionally followed by data. NCBACTION commands cannot be canceled by using NCBCANCEL. 
     * NCBACTION is not a standard NetBIOS 3.0 command.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBADDGRNAME  
     * </td>
     * <td>
     * Adds a group name to the local name table. This name cannot be used by another process on the network as a unique name, but it can be added by anyone as a group name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBADDNAME</td>
     * <td>
     * Adds a unique name to the local name table. The TDI driver ensures that the name is unique across the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBASTAT</td>
     * <td>
     * Retrieves the status of either a local or remote adapter. When this code is specified, the <b>ncb_buffer</b> member points to a buffer to be filled with an <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-adapter_status">ADAPTER_STATUS</a> structure, followed by an array of <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-name_buffer">NAME_BUFFER</a> structures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBCALL</td>
     * <td>
     * Opens a session with another name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBCANCEL</td>
     * <td>
     * Cancels a previous pending command.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBCHAINSEND</td>
     * <td>
     * Sends the contents of two data buffers to the specified session partner.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBCHAINSENDNA</td>
     * <td>
     * Sends the contents of two data buffers to the specified session partner and does not wait for acknowledgment. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBDELNAME</td>
     * <td>
     * Deletes a name from the local name table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBDGRECV</td>
     * <td>
     * Receives a datagram from any name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBDGRECVBC</td>
     * <td>
     * Receives a broadcast datagram from any name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBDGSEND</td>
     * <td>
     * Sends datagram to a specified name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBDGSENDBC</td>
     * <td>
     * Sends a broadcast datagram to every host on the local area network (LAN).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBENUM</td>
     * <td>
     * 
     * <b>Windows Server 2003, Windows XP, Windows 2000, and Windows NT:  </b>Enumerates LAN adapter (LANA) numbers. When this code is specified, the ncb_buffer member points to a buffer to be filled with a LANA_ENUM structure. NCBENUM is not a standard NetBIOS 3.0 command. 
     * 
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBFINDNAME</td>
     * <td>
     * Determines the location of a name on the network. When this code is specified, the <b>ncb_buffer</b> member points to a buffer to be filled with a <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-find_name_header">FIND_NAME_HEADER</a> structure followed by one or more <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-find_name_buffer">FIND_NAME_BUFFER</a> structures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBHANGUP</td>
     * <td>
     * Closes a specified session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBLANSTALERT</td>
     * <td>
     * 
     * <b>Windows Server 2003, Windows XP, Windows 2000, and Windows NT:  </b>Notifies the user of LAN failures that last for more than one minute.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBLISTEN</td>
     * <td>
     * Enables a session to be opened with another name (local or remote).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBRECV</td>
     * <td>
     * Receives data from the specified session partner.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBRECVANY</td>
     * <td>
     * Receives data from any session corresponding to a specified name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBRESET</td>
     * <td>
     * Resets a LAN adapter. An adapter must be reset before it can accept any other NCB command that specifies the same number in the <b>ncb_lana_num</b> member.
     * 
     * Use the following values to specify how resources are to be freed:
     * 
     * 
     * <ul>
     * <li>If <b>ncb_lsn</b> is not 0x00, all resources associated with <b>ncb_lana_num</b> are to be freed.</li>
     * <li>If <b>ncb_lsn</b> is 0x00, all resources associated with <b>ncb_lana_num</b> are to be freed, and new resources are to be allocated. The <b>ncb_callname</b>[0] byte specifies the maximum number of sessions, and the <b>ncb_callname</b>[2] byte specifies the maximum number of names. A nonzero value for the <b>ncb_callname</b>[3] byte requests that the application use <b>NAME_NUMBER_1</b>.  
     * </li>
     * </ul>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBSEND</td>
     * <td>
     * Sends data to the specified session partner. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBSENDNA</td>
     * <td>
     * Sends data to specified session partner and does not wait for acknowledgment. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBSSTAT</td>
     * <td>
     * Retrieves the status of the session. When this value is specified, the <b>ncb_buffer</b> member points to a buffer to be filled with a <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-session_header">SESSION_HEADER</a> structure, followed by one or more <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-session_buffer">SESSION_BUFFER</a> structures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBTRACE</td>
     * <td>
     * Activates or deactivates NCB tracing. 
     * 
     * This command is not supported. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>NCBUNLINK</td>
     * <td>
     * Unlinks the adapter.
     * 
     * This command is provided for compatibility with earlier versions of NetBIOS. It has no effect in Windows.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ncb_command {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    ncb_retcode {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Identifies the local session number. This number uniquely identifies a session within an environment. This number is returned by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/nb30/nf-nb30-netbios">Netbios</a> function after a successful NCBCALL command.
     * @type {Integer}
     */
    ncb_lsn {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Specifies the number for the local network name. This number is returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/nb30/nf-nb30-netbios">Netbios</a> after a successful <b>NCBADDNAME</b> or <b>NCBADDGRNAME</b> command. This number, not the name, must be used with all datagram commands and for <b>NCBRECVANY</b> commands.
     * 
     * The number for <b>NAME_NUMBER_1</b> is always 0x01. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/nb30/nf-nb30-netbios">Netbios</a> function assigns values in the range 0x02 to 0xFE for the remaining names.
     * @type {Integer}
     */
    ncb_num {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Pointer to the message buffer. The buffer must have write access. Its uses are as follows:
     * 
     * <table>
     * <tr>
     * <th>Command</th>
     * <th>Purpose</th>
     * </tr>
     * <tr>
     * <td>NCBSEND</td>
     * <td>Contains the message to be sent. </td>
     * </tr>
     * <tr>
     * <td>NCBRECV</td>
     * <td>Receives the message. </td>
     * </tr>
     * <tr>
     * <td>NCBSSTAT</td>
     * <td>Receives the requested status information.</td>
     * </tr>
     * </table>
     * @type {Pointer<Integer>}
     */
    ncb_buffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the size, in bytes, of the message buffer. For receive commands, this member is set by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/nb30/nf-nb30-netbios">Netbios</a> function to indicate the number of bytes received.
     * 
     * If the buffer length is incorrect, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/nb30/nf-nb30-netbios">Netbios</a> function returns the <b>NRC_BUFLEN</b> error code.
     * @type {Integer}
     */
    ncb_length {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Specifies the name of the remote application. Trailing-space characters should be supplied to make the length of the string equal to <b>NCBNAMSZ</b>.
     * @type {Array<Byte>}
     */
    ncb_callname{
        get {
            if(!this.HasProp("__ncb_callnameProxyArray"))
                this.__ncb_callnameProxyArray := Win32FixedArray(this.ptr + 18, 16, Primitive, "char")
            return this.__ncb_callnameProxyArray
        }
    }

    /**
     * Specifies the name by which the application is known. Trailing-space characters should be supplied to make the length of the string equal to <b>NCBNAMSZ</b>.
     * @type {Array<Byte>}
     */
    ncb_name{
        get {
            if(!this.HasProp("__ncb_nameProxyArray"))
                this.__ncb_nameProxyArray := Win32FixedArray(this.ptr + 34, 16, Primitive, "char")
            return this.__ncb_nameProxyArray
        }
    }

    /**
     * Specifies the time-out period for receive operations, in 500-millisecond units, for the session. A value of zero implies no time-out. Specify with the <b>NCBCALL</b> or <b>NCBLISTEN</b> command. Affects subsequent <b>NCBRECV</b> commands.
     * @type {Integer}
     */
    ncb_rto {
        get => NumGet(this, 50, "char")
        set => NumPut("char", value, this, 50)
    }

    /**
     * Specifies the time-out period for send operations, in 500-millisecond units, for the session. A value of zero implies no time-out. Specify with the <b>NCBCALL</b> or <b>NCBLISTEN</b> command. Affects subsequent <b>NCBSEND</b> and <b>NCBCHAINSEND</b> commands.
     * @type {Integer}
     */
    ncb_sto {
        get => NumGet(this, 51, "char")
        set => NumPut("char", value, this, 51)
    }

    /**
     * Specifies the address of the post routine to call when the asynchronous command is completed. The post routine is defined as:
     * 
     *   NCB_POST PostRoutine( PNCB <i>pncb</i> );
     * 
     * where the <i>pncb</i> parameter is a pointer to the completed <b>NCB</b> structure.
     * @type {Pointer}
     */
    ncb_post {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Specifies the LAN adapter number. This zero-based number corresponds to a particular transport provider using a particular LAN adapter board.
     * @type {Integer}
     */
    ncb_lana_num {
        get => NumGet(this, 64, "char")
        set => NumPut("char", value, this, 64)
    }

    /**
     * Specifies the command complete flag. This value is the same as the <b>ncb_retcode</b> member.
     * @type {Integer}
     */
    ncb_cmd_cplt {
        get => NumGet(this, 65, "char")
        set => NumPut("char", value, this, 65)
    }

    /**
     * Reserved; must be zero.
     * 
     * The length, X,  of the <b>ncb_reserve</b>  array is dependent upon the system architecture. For 64-bit systems, the  array contains 18 elements. Otherwise, the array contains 10 elements.
     * @type {Array<Byte>}
     */
    ncb_reserve{
        get {
            if(!this.HasProp("__ncb_reserveProxyArray"))
                this.__ncb_reserveProxyArray := Win32FixedArray(this.ptr + 66, 18, Primitive, "char")
            return this.__ncb_reserveProxyArray
        }
    }

    /**
     * Specifies a handle to an event object that is set to the nonsignaled state when an asynchronous command is accepted, and it is set to the signaled state when the asynchronous command is completed. The event is signaled if the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/nb30/nf-nb30-netbios">Netbios</a> function returns a nonzero value. Only manual reset events should be used for synchronization. A specified event should not be associated with more than one active asynchronous command.
     * 
     * The <b>ncb_event</b> member must be zero if the <b>ncb_command</b> member does not have the <b>ASYNCH</b> flag set or if <b>ncb_post</b> is nonzero. Otherwise, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/nb30/nf-nb30-netbios">Netbios</a> returns the <b>NRC_ILLCMD</b> error code.
     * @type {HANDLE}
     */
    ncb_event{
        get {
            if(!this.HasProp("__ncb_event"))
                this.__ncb_event := HANDLE(88, this)
            return this.__ncb_event
        }
    }
}
