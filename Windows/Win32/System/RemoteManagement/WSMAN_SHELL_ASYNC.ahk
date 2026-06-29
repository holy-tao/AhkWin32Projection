#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines an asynchronous structure to be passed to all shell operations.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_shell_async
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_SHELL_ASYNC {
    #StructPack 8

    /**
     * Specifies the optional user context associated with the operation.
     */
    operationContext : IntPtr

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nc-wsman-wsman_shell_completion_function">WSMAN_SHELL_COMPLETION_FUNCTION</a> callback function for the operation.
     */
    completionFunction : IntPtr

}
