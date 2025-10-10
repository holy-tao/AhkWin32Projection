#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents app memory usage at a single point in time. This structure is used by the PROCESS_INFORMATION_CLASS class.
 * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/ns-processthreadsapi-app_memory_information
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class APP_MEMORY_INFORMATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Total commit available to the app.
     * @type {Integer}
     */
    AvailableCommit {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The app's usage of private commit.
     * @type {Integer}
     */
    PrivateCommitUsage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The app's peak usage of private commit.
     * @type {Integer}
     */
    PeakPrivateCommitUsage {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The app's total usage of private plus shared commit.
     * @type {Integer}
     */
    TotalCommitUsage {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
