#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
 * @version v4.0.30319
 */
class CMD_ENTRY extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The token (name) for the command.
     * @type {PWSTR}
     */
    pwszCmdToken{
        get {
            if(!this.HasProp("__pwszCmdToken"))
                this.__pwszCmdToken := PWSTR(this.ptr + 0)
            return this.__pwszCmdToken
        }
    }

    /**
     * A function that handles the command. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-fn_handle_cmd">FN_HANDLE_CMD</a>.
     * @type {Pointer<Ptr>}
     */
    pfnCmdHandler {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A short help message. This is the message identifier from the resource file of the helper DLL.
     * @type {Integer}
     */
    dwShortCmdHelpToken {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The message to display if the command is followed only by a help token (HELP, /?, -?, or ?). This is the message identifier from the resource file of the helper DLL.
     * @type {Integer}
     */
    dwCmdHlpToken {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The flags for the command. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/netshell/netshell-flags">Netshell Flags</a>.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The operating system version check function. This is the function used to determine whether the command can be run on the operating system running on the local and/or remote context before invoking or displaying commands. For more information, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-ns_osversioncheck">NS_OSVERSIONCHECK</a>.
     * @type {Pointer<Ptr>}
     */
    pOsVersionCheck {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    pfnCustomHelpFn {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
