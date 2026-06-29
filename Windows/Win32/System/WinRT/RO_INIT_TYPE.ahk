#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Determines the concurrency model used for incoming calls to the objects created by this thread.
 * @remarks
 * Pass the <b>RO_INIT_TYPE</b> enumeration to the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/nf-roapi-roinitialize">RoInitialize</a> function to initialize a thread in the Windows Runtime.
 * @see https://learn.microsoft.com/windows/win32/api/roapi/ne-roapi-ro_init_type
 * @namespace Windows.Win32.System.WinRT
 */
export default struct RO_INIT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static RO_INIT_SINGLETHREADED => 0

    /**
     * Initializes the thread for multi-threaded concurrency. The current thread is initialized in the MTA.
     * @type {Integer (Int32)}
     */
    static RO_INIT_MULTITHREADED => 1
}
