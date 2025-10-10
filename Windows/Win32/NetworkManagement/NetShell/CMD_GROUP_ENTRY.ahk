#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a group of helper commands.
 * @remarks
 * 
  * Macros are available that can simplify the creation of the 
  * <b>CMD_GROUP_ENTRY</b> structure, as follows:
  * 
  * <pre class="syntax" xml:space="preserve"><code>#define CREATE_CMD_GROUP_ENTRY_EX(t,s,i)       {CMD_##t, HLP_##t, sizeof(s)/sizeof(CMD_ENTRY), i, s, NULL }
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netsh/ns-netsh-cmd_group_entry
 * @namespace Windows.Win32.NetworkManagement.NetShell
 * @version v4.0.30319
 */
class CMD_GROUP_ENTRY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The token (name) for the command group
     * @type {Pointer<Char>}
     */
    pwszCmdGroupToken {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A short help message.
     * @type {Integer}
     */
    dwShortCmdHelpToken {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of elements in the command group.
     * @type {Integer}
     */
    ulCmdGroupSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Flags. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/netshell/netshell-flags">NetShell Flags</a>.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An array of CMD_ENTRY structures.
     * @type {Pointer<CMD_ENTRY>}
     */
    pCmdGroup {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * An operating system version check function. This is the function used to determine whether the command can be run on the operating system running on the local and/or remote context before invoking or displaying commands. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-ns_osversioncheck">NS_OSVERSIONCHECK</a>.
     * @type {Pointer<PNS_OSVERSIONCHECK>}
     */
    pOsVersionCheck {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
