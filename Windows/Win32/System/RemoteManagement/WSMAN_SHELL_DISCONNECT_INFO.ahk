#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the maximum duration, in milliseconds, the shell will stay open after the client has disconnected.
 * @remarks
 * When the maximum duration is exceeded, the shell is automatically deleted. This value overrides the initial idle timeout that is set as part of <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_startup_info_v10">WSMAN_SHELL_STARTUP_INFO</a> structure in <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_shell_disconnect_info
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_SHELL_DISCONNECT_INFO {
    #StructPack 4

    /**
     * Specifies the maximum time  in milliseconds that the shell will stay open after the client has disconnected. When this maximum duration has been exceeded, the shell will be deleted. Specifying this value overrides the initial idle timeout value that is set as part of the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_shell_startup_info_v10">WSMAN_SHELL_STARTUP_INFO</a> structure in the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmancreateshell">WSManCreateShell</a> method.
     */
    idleTimeoutMs : UInt32

}
