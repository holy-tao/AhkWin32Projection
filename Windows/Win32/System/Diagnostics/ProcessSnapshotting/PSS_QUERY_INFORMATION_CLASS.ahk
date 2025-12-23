#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies what information PssQuerySnapshot function returns.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ne-processsnapshot-pss_query_information_class
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_QUERY_INFORMATION_CLASS extends Win32Enum{

    /**
     * Returns a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_process_information">PSS_PROCESS_INFORMATION</a> structure, with information about the original process.
     * @type {Integer (Int32)}
     */
    static PSS_QUERY_PROCESS_INFORMATION => 0

    /**
     * Returns a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_va_clone_information">PSS_VA_CLONE_INFORMATION</a> structure, with a handle to the VA clone.
     * @type {Integer (Int32)}
     */
    static PSS_QUERY_VA_CLONE_INFORMATION => 1

    /**
     * Returns a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_auxiliary_pages_information">PSS_AUXILIARY_PAGES_INFORMATION</a> structure, which contains the count of auxiliary pages captured.
     * @type {Integer (Int32)}
     */
    static PSS_QUERY_AUXILIARY_PAGES_INFORMATION => 2

    /**
     * Returns a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_va_space_information">PSS_VA_SPACE_INFORMATION</a> structure, which contains the count of regions captured.
     * @type {Integer (Int32)}
     */
    static PSS_QUERY_VA_SPACE_INFORMATION => 3

    /**
     * Returns a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_handle_information">PSS_HANDLE_INFORMATION</a> structure, which contains the count of handles captured.
     * @type {Integer (Int32)}
     */
    static PSS_QUERY_HANDLE_INFORMATION => 4

    /**
     * Returns a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_thread_information">PSS_THREAD_INFORMATION</a> structure, which contains the count of threads captured.
     * @type {Integer (Int32)}
     */
    static PSS_QUERY_THREAD_INFORMATION => 5

    /**
     * Returns a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_handle_trace_information">PSS_HANDLE_TRACE_INFORMATION</a> structure, which contains a handle to the handle trace section, and its size.
     * @type {Integer (Int32)}
     */
    static PSS_QUERY_HANDLE_TRACE_INFORMATION => 6

    /**
     * Returns a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_performance_counters">PSS_PERFORMANCE_COUNTERS</a> structure, which contains various performance counters.
     * @type {Integer (Int32)}
     */
    static PSS_QUERY_PERFORMANCE_COUNTERS => 7
}
