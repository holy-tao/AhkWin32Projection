#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of work queue for the MFAllocateWorkQueueEx function to create.
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ne-mfapi-mfasync_workqueue_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFASYNC_WORKQUEUE_TYPE{

    /**
     * Create a work queue without a message loop.
     * @type {Integer (Int32)}
     */
    static MF_STANDARD_WORKQUEUE => 0

    /**
     * Create a work queue with a message loop.
     * @type {Integer (Int32)}
     */
    static MF_WINDOW_WORKQUEUE => 1

    /**
     * Create a multithreaded work queue. This type of work queue uses a thread pool to dispatch work items. The caller is responsible for serializing the work items.
     * @type {Integer (Int32)}
     */
    static MF_MULTITHREADED_WORKQUEUE => 2
}
