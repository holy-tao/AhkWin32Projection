#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a buffer for a terminal failure for a resource.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ns-msclus-resource_terminal_failure_info_buffer
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class RESOURCE_TERMINAL_FAILURE_INFO_BUFFER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * <b>TRUE</b> if the resource  failure is a terminal failure; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    isTerminalFailure {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The amount of time remaining for the TBD, in seconds.
     * @type {Integer}
     */
    restartPeriodRemaining {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
