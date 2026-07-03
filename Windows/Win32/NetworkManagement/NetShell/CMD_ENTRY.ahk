#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines a helper command.
 * @remarks
 * Macros are available that can simplify the creation of the 
 * <b>CMD_ENTRY</b> structure, as follows:
 * 
 * 
 * ``` syntax
 * @see https://learn.microsoft.com/windows/win32/api/netsh/ns-netsh-cmd_entry
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct CMD_ENTRY {
    #StructPack 8

    /**
     * The token (name) for the command.
     */
    pwszCmdToken : PWSTR

    /**
     * A function that handles the command. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-fn_handle_cmd">FN_HANDLE_CMD</a>.
     */
    pfnCmdHandler : IntPtr

    /**
     * A short help message. This is the message identifier from the resource file of the helper DLL.
     */
    dwShortCmdHelpToken : UInt32

    /**
     * The message to display if the command is followed only by a help token (HELP, /?, -?, or ?). This is the message identifier from the resource file of the helper DLL.
     */
    dwCmdHlpToken : UInt32

    /**
     * The flags for the command. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/netshell/netshell-flags">Netshell Flags</a>.
     */
    dwFlags : UInt32

    /**
     * The operating system version check function. This is the function used to determine whether the command can be run on the operating system running on the local and/or remote context before invoking or displaying commands. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-ns_osversioncheck">NS_OSVERSIONCHECK</a>.
     */
    pOsVersionCheck : IntPtr

}
