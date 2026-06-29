#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the exit code for a terminating process.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-exit_process_debug_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct EXIT_PROCESS_DEBUG_INFO {
    #StructPack 4

    /**
     * The exit code for the process.
     */
    dwExitCode : UInt32

}
