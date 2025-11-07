#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the maximum duration, in milliseconds, the shell will stay open after the client has disconnected.
 * @remarks
 * 
 * When the maximum duration is exceeded, the shell is automatically deleted. This value overrides the initial idle timeout that is set as part of <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_startup_info_v10">WSMAN_SHELL_STARTUP_INFO</a> structure in <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ns-wsman-wsman_shell_disconnect_info
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_SHELL_DISCONNECT_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the maximum time  in milliseconds that the shell will stay open after the client has disconnected. When this maximum duration has been exceeded, the shell will be deleted. Specifying this value overrides the initial idle timeout value that is set as part of the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_startup_info_v10">WSMAN_SHELL_STARTUP_INFO</a> structure in the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> method.
     * @type {Integer}
     */
    idleTimeoutMs {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
