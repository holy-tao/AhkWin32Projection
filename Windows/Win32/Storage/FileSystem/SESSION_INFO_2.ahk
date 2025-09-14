#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the session, including name of the computer; name of the user; open files, pipes, and devices on the computer; and the type of client that established the session.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-session_info_2
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SESSION_INFO_2 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Pointer to a Unicode string specifying the name of the computer that established the session. This string cannot contain a backslash (\\).
     * @type {Pointer<PWSTR>}
     */
    sesi2_cname {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a Unicode string specifying the name of the user who established the session.
     * @type {Pointer<PWSTR>}
     */
    sesi2_username {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies a DWORD value that contains the number of files, devices, and pipes opened during the session.
     * @type {Integer}
     */
    sesi2_num_opens {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies a DWORD value that contains the number of seconds the session has been active.
     * @type {Integer}
     */
    sesi2_time {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies a DWORD value that contains the number of seconds the session has been idle.
     * @type {Integer}
     */
    sesi2_idle_time {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    sesi2_user_flags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

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
     * LAN Manager for MS-DOS 1.0 clients
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DOS_LM_2.0"></a><a id="dos_lm_2.0"></a><dl>
     * <dt><b>DOS LM 2.0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * LAN Manager for MS-DOS 2.0 clients
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OS_2_LM_1.0"></a><a id="os_2_lm_1.0"></a><dl>
     * <dt><b>OS/2 LM 1.0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * LAN Manager for MS-OS/2 1.0 clients
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OS_2_LM_2.0"></a><a id="os_2_lm_2.0"></a><dl>
     * <dt><b>OS/2 LM 2.0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * LAN Manager for MS-OS/2 2.0 clients
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Sessions from LAN Manager servers running UNIX also will appear as LAN Manager 2.0.
     * @type {Pointer<PWSTR>}
     */
    sesi2_cltype_name {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
