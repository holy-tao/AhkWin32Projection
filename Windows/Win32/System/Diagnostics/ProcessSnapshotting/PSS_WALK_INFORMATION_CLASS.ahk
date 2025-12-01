#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies what information the PssWalkSnapshot function returns.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ne-processsnapshot-pss_walk_information_class
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_WALK_INFORMATION_CLASS extends Win32Enum{

    /**
     * Returns a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_auxiliary_page_entry">PSS_AUXILIARY_PAGE_ENTRY</a> structure, which contains the address, page attributes and contents of an auxiliary copied page.
     * @type {Integer (Int32)}
     */
    static PSS_WALK_AUXILIARY_PAGES => 0

    /**
     * Returns a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_va_space_entry">PSS_VA_SPACE_ENTRY</a> structure, which contains the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a> structure for every distinct VA region.
     * @type {Integer (Int32)}
     */
    static PSS_WALK_VA_SPACE => 1

    /**
     * Returns a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_handle_entry">PSS_HANDLE_ENTRY</a> structure, with information specifying the handle value, its type name, object name (if captured), basic information (if captured), and type-specific information (if captured).
     * @type {Integer (Int32)}
     */
    static PSS_WALK_HANDLES => 2

    /**
     * Returns a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_thread_entry">PSS_THREAD_ENTRY</a> structure, with basic information about the thread, as well as its termination state, suspend count and Win32 start address.
     * @type {Integer (Int32)}
     */
    static PSS_WALK_THREADS => 3

    /**
     * @type {Integer (Int32)}
     */
    static PSS_WALK_THREAD_NAME => 4
}
