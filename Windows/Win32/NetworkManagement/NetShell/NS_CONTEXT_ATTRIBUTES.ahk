#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CMD_ENTRY.ahk" { CMD_ENTRY }
#Import ".\CMD_GROUP_ENTRY.ahk" { CMD_GROUP_ENTRY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines attributes of a context.
 * @see https://learn.microsoft.com/windows/win32/api/netsh/ns-netsh-ns_context_attributes
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct NS_CONTEXT_ATTRIBUTES {
    #StructPack 8

    dwVersion : UInt32

    dwReserved : UInt32

    /**
     * A unicode string that identifies the new context. This string is the command available to users. The string must not contain spaces.
     */
    pwszContext : PWSTR

    /**
     * A pointer to the GUID of this helper. Identical to the value passed to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nf-netsh-registerhelper">RegisterHelper</a> function as the <b>pguidHelper</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netsh/ns-netsh-ns_helper_attributes">NS_HELPER_ATTRIBUTES</a> structure.
     */
    guidHelper : Guid

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
     */
    dwFlags : UInt32

    /**
     * A priority value used when ordering dump and commit commands. Used only when the CMD_FLAG_PRIORITY flag is set in <b>dwFlags</b>. Default value is DEFAULT_CONTEXT_PRIORITY, defined as 100 in NetSh.h. Lower values indicate higher priority.
     */
    ulPriority : UInt32

    /**
     * The number of entries in the <b>pTopCmds</b> member.
     */
    ulNumTopCmds : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/netsh/ns-netsh-cmd_entry">CMD_ENTRY</a> structures that contain helper commands.
     */
    pTopCmds : CMD_ENTRY.Ptr

    /**
     * A number of entries in the <b>pCmdGroups</b> member.
     */
    ulNumGroups : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/netsh/ns-netsh-cmd_group_entry">CMD_GROUP_ENTRY</a> structures that contain helper command groups.
     */
    pCmdGroups : CMD_GROUP_ENTRY.Ptr

    /**
     * A function called to commit changes from offline mode. Can be null. For more information about the commit function, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-ns_context_commit_fn">NS_CONTEXT_COMMIT_FN</a>.
     */
    pfnCommitFn : IntPtr

    /**
     * A function called to dump the current configuration. Can be null. For more information about the dump function, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-ns_context_dump_fn">NS_CONTEXT_DUMP_FN</a>.
     */
    pfnDumpFn : IntPtr

    /**
     * A function called to connect to a remote computer, or to update the set of available commands. Can be null. For more information about the connect function, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-ns_context_connect_fn">NS_CONTEXT_CONNECT_FN</a>.
     */
    pfnConnectFn : IntPtr

    /**
     * Reserved. Must be null.
     */
    pReserved : IntPtr

    pfnOsVersionCheck : IntPtr

    static __New() {
        DefineProp(this.Prototype, '_ullAlign', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
