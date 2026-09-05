#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class DelayRetryAction extends Win32Enum {

    /**
     * Native name: DelayRetryUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: DelayRetryNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: DelayRetryShort
     * @type {Integer (Int32)}
     */
    static Short => 2

    /**
     * Native name: DelayRetryLong
     * @type {Integer (Int32)}
     */
    static Long => 3

    /**
     * Native name: DelayRetrySuccess
     * @type {Integer (Int32)}
     */
    static Success => 4

    /**
     * Native name: DelayRetryPastSuccess
     * @type {Integer (Int32)}
     */
    static PastSuccess => 5
}
