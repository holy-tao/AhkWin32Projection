#Requires AutoHotkey v2.0.0 64-bit

/**
 * Provides flags for the CoWaitForMultipleObjects function.
 * @see https://docs.microsoft.com/windows/win32/api//combaseapi/ne-combaseapi-cwmo_flags
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class CWMO_FLAGS{

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
