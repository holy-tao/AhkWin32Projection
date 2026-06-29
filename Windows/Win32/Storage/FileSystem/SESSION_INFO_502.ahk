#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SESSION_INFO_USER_FLAGS.ahk" { SESSION_INFO_USER_FLAGS }

/**
 * Contains information about the session, including name of the computer; name of the user; open files, pipes, and devices on the computer; and the name of the transport the client is using.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-session_info_502
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SESSION_INFO_502 {
    #StructPack 8

    /**
     * Pointer to a Unicode string specifying the name of the computer that established the session. This string cannot contain a backslash (\\).
     */
    sesi502_cname : PWSTR

    /**
     * Pointer to a Unicode string specifying the name of the user who established the session.
     */
    sesi502_username : PWSTR

    /**
     * Specifies the number of files, devices, and pipes opened during the session.
     */
    sesi502_num_opens : UInt32

    /**
     * Specifies the number of seconds the session has been active.
     */
    sesi502_time : UInt32

    /**
     * Specifies the number of seconds the session has been idle.
     */
    sesi502_idle_time : UInt32

    sesi502_user_flags : SESSION_INFO_USER_FLAGS

    /**
     * Pointer to a Unicode string that specifies the type of client that established the session. Following are the defined types for LAN Manager servers. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DOS_LM_1.0"></a><a id="dos_lm_1.0"></a><dl>
     * <dt><b>DOS LM 1.0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * LAN Manager for MS-DOS 1.0 clients.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DOS_LM_2.0"></a><a id="dos_lm_2.0"></a><dl>
     * <dt><b>DOS LM 2.0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * LAN Manager for MS-DOS 2.0 clients.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OS_2_LM_1.0"></a><a id="os_2_lm_1.0"></a><dl>
     * <dt><b>OS/2 LM 1.0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * LAN Manager for MS-OS/2 1.0 clients.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OS_2_LM_2.0"></a><a id="os_2_lm_2.0"></a><dl>
     * <dt><b>OS/2 LM 2.0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * LAN Manager for MS-OS/2 2.0 clients.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Sessions from LAN Manager servers running UNIX also will appear as LAN Manager 2.0.
     */
    sesi502_cltype_name : PWSTR

    /**
     * Specifies the name of the transport that the client is using to communicate with the server.
     */
    sesi502_transport : PWSTR

}
