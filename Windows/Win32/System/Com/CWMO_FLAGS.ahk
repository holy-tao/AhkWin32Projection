#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides flags for the CoWaitForMultipleObjects function.
 * @see https://learn.microsoft.com/windows/win32/api/combaseapi/ne-combaseapi-cwmo_flags
 * @namespace Windows.Win32.System.Com
 */
export default struct CWMO_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No call dispatch.
     * @type {Integer (Int32)}
     */
    static CWMO_DEFAULT => 0

    /**
     * Dispatch calls from <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultipleobjects">CoWaitForMultipleObjects</a> (default is no call dispatch).
     * @type {Integer (Int32)}
     */
    static CWMO_DISPATCH_CALLS => 1

    /**
     * Enable dispatch of window messages from <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultipleobjects">CoWaitForMultipleObjects</a> in a ASTA or STA (default in ASTA is no window messages dispatched, default in STA is only a small set of special-cased messages dispatched). The value has no meaning in MTA and is ignored.
     * @type {Integer (Int32)}
     */
    static CWMO_DISPATCH_WINDOW_MESSAGES => 2
}
