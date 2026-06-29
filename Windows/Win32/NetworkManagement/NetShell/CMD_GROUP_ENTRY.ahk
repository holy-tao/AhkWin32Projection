#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CMD_ENTRY.ahk" { CMD_ENTRY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines a group of helper commands.
 * @remarks
 * Macros are available that can simplify the creation of the 
 * <b>CMD_GROUP_ENTRY</b> structure, as follows:
 * 
 * 
 * ``` syntax
 * @see https://learn.microsoft.com/windows/win32/api/netsh/ns-netsh-cmd_group_entry
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct CMD_GROUP_ENTRY {
    #StructPack 8

    /**
     * The token (name) for the command group
     */
    pwszCmdGroupToken : PWSTR

    /**
     * A short help message.
     */
    dwShortCmdHelpToken : UInt32

    /**
     * The number of elements in the command group.
     */
    ulCmdGroupSize : UInt32

    /**
     * Flags. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/netshell/netshell-flags">NetShell Flags</a>.
     */
    dwFlags : UInt32

    /**
     * An array of CMD_ENTRY structures.
     */
    pCmdGroup : CMD_ENTRY.Ptr

    /**
     * An operating system version check function. This is the function used to determine whether the command can be run on the operating system running on the local and/or remote context before invoking or displaying commands. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-ns_osversioncheck">NS_OSVERSIONCHECK</a>.
     */
    pOsVersionCheck : IntPtr

}
