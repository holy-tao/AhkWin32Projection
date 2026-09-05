#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides flags for the CoWaitForMultipleObjects function.
 * @see https://learn.microsoft.com/windows/win32/api/combaseapi/ne-combaseapi-cwmo_flags
 * @namespace Windows.Win32.System.Com
 */
class CWMO_FLAGS extends Win32BitflagEnum {

    /**
     * No call dispatch.
     * Native name: CWMO_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Dispatch calls from <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultipleobjects">CoWaitForMultipleObjects</a> (default is no call dispatch).
     * Native name: CWMO_DISPATCH_CALLS
     * @type {Integer (Int32)}
     */
    static DISPATCH_CALLS => 1

    /**
     * Enable dispatch of window messages from <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultipleobjects">CoWaitForMultipleObjects</a> in a ASTA or STA (default in ASTA is no window messages dispatched, default in STA is only a small set of special-cased messages dispatched). The value has no meaning in MTA and is ignored.
     * Native name: CWMO_DISPATCH_WINDOW_MESSAGES
     * @type {Integer (Int32)}
     */
    static DISPATCH_WINDOW_MESSAGES => 2
}
