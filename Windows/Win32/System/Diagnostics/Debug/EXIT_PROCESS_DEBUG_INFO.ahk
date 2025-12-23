#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the exit code for a terminating process.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-exit_process_debug_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class EXIT_PROCESS_DEBUG_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The exit code for the process.
     * @type {Integer}
     */
    dwExitCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
