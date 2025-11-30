#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class DelayRetryAction extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DelayRetryUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DelayRetryNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static DelayRetryShort => 2

    /**
     * @type {Integer (Int32)}
     */
    static DelayRetryLong => 3

    /**
     * @type {Integer (Int32)}
     */
    static DelayRetrySuccess => 4

    /**
     * @type {Integer (Int32)}
     */
    static DelayRetryPastSuccess => 5
}
