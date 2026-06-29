#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of work queue for the RtwqAllocateWorkQueue function to create.
 * @see https://learn.microsoft.com/windows/win32/api/rtworkq/ne-rtworkq-rtwq_workqueue_type
 * @namespace Windows.Win32.System.Threading
 */
export default struct RTWQ_WORKQUEUE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
