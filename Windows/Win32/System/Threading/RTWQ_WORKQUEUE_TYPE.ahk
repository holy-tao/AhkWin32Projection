#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of work queue for the RtwqAllocateWorkQueue function to create.
 * @see https://learn.microsoft.com/windows/win32/api/rtworkq/ne-rtworkq-rtwq_workqueue_type
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class RTWQ_WORKQUEUE_TYPE extends Win32Enum{

    /**
     * Create a work queue without a message loop.
     * @type {Integer (Int32)}
     */
    static RTWQ_STANDARD_WORKQUEUE => 0

    /**
     * Create a work queue with a message loop.
     * @type {Integer (Int32)}
     */
    static RTWQ_WINDOW_WORKQUEUE => 1

    /**
     * Create a multithreaded work queue. This type of work queue uses a thread pool to dispatch work items. The caller is responsible for serializing the work items.
     * @type {Integer (Int32)}
     */
    static RTWQ_MULTITHREADED_WORKQUEUE => 2
}
