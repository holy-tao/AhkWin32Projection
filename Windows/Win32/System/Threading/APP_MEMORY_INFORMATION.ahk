#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents app memory usage at a single point in time. This structure is used by the PROCESS_INFORMATION_CLASS class.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-app_memory_information
 * @namespace Windows.Win32.System.Threading
 */
export default struct APP_MEMORY_INFORMATION {
    #StructPack 8

    /**
     * Total commit available to the app.
     */
    AvailableCommit : Int64

    /**
     * The app's usage of private commit.
     */
    PrivateCommitUsage : Int64

    /**
     * The app's peak usage of private commit.
     */
    PeakPrivateCommitUsage : Int64

    /**
     * The app's total usage of private plus shared commit.
     */
    TotalCommitUsage : Int64

}
