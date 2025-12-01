#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines attributes of a context.
 * @see https://learn.microsoft.com/windows/win32/api/netsh/ns-netsh-ns_context_attributes
 * @namespace Windows.Win32.NetworkManagement.NetShell
 * @version v4.0.30319
 */
class NS_CONTEXT_ATTRIBUTES extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    _ullAlign {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A unicode string that identifies the new context. This string is the command available to users. The string must not contain spaces.
     * @type {PWSTR}
     */
    pwszContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the GUID of this helper. Identical to the value passed to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nf-netsh-registerhelper">RegisterHelper</a> function as the <b>pguidHelper</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netsh/ns-netsh-ns_helper_attributes">NS_HELPER_ATTRIBUTES</a> structure.
     * @type {Pointer<Guid>}
     */
    guidHelper {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A set of flags that limit when this context is available. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMD_FLAG_INTERACTIVE"></a><a id="cmd_flag_interactive"></a><dl>
     * <dt><b>CMD_FLAG_INTERACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, context is available only when NetSh is run in interactive mode, but is not available to be passed to NetSh on the command line.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMD_FLAG_LOCAL"></a><a id="cmd_flag_local"></a><dl>
     * <dt><b>CMD_FLAG_LOCAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the context is not valid from a remote computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMD_FLAG_ONLINE"></a><a id="cmd_flag_online"></a><dl>
     * <dt><b>CMD_FLAG_ONLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the context is not valid in offline mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CMD_FLAG_PRIORITY"></a><a id="cmd_flag_priority"></a><dl>
     * <dt><b>CMD_FLAG_PRIORITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the ulPriority field is used.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A priority value used when ordering dump and commit commands. Used only when the CMD_FLAG_PRIORITY flag is set in <b>dwFlags</b>. Default value is DEFAULT_CONTEXT_PRIORITY, defined as 100 in NetSh.h. Lower values indicate higher priority.
     * @type {Integer}
     */
    ulPriority {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The number of entries in the <b>pTopCmds</b> member.
     * @type {Integer}
     */
    ulNumTopCmds {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/netsh/ns-netsh-cmd_entry">CMD_ENTRY</a> structures that contain helper commands.
     * @type {Pointer<CMD_ENTRY>}
     */
    pTopCmds {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A number of entries in the <b>pCmdGroups</b> member.
     * @type {Integer}
     */
    ulNumGroups {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/netsh/ns-netsh-cmd_group_entry">CMD_GROUP_ENTRY</a> structures that contain helper command groups.
     * @type {Pointer<CMD_GROUP_ENTRY>}
     */
    pCmdGroups {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A function called to commit changes from offline mode. Can be null. For more information about the commit function, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-ns_context_commit_fn">NS_CONTEXT_COMMIT_FN</a>.
     * @type {Pointer<PNS_CONTEXT_COMMIT_FN>}
     */
    pfnCommitFn {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A function called to dump the current configuration. Can be null. For more information about the dump function, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-ns_context_dump_fn">NS_CONTEXT_DUMP_FN</a>.
     * @type {Pointer<PNS_CONTEXT_DUMP_FN>}
     */
    pfnDumpFn {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * A function called to connect to a remote computer, or to update the set of available commands. Can be null. For more information about the connect function, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-ns_context_connect_fn">NS_CONTEXT_CONNECT_FN</a>.
     * @type {Pointer<PNS_CONTEXT_CONNECT_FN>}
     */
    pfnConnectFn {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Reserved. Must be null.
     * @type {Pointer<Void>}
     */
    pReserved {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * 
     * @type {Pointer<PNS_OSVERSIONCHECK>}
     */
    pfnOsVersionCheck {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
