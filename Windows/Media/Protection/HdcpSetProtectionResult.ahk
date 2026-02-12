#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes whether setting HDCP was successful.
 * @remarks
 * You can call [GetResults](/uwp/api/Windows.Foundation.IAsyncOperation_TResult_#Windows_Foundation_IAsyncOperation_1_GetResults) on the HDCP operation, and then check that against this enumeration in order to determine whether it was successful or not. See [HdcpSession](hdcpsession.md) for a usage example.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.hdcpsetprotectionresult
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class HdcpSetProtectionResult extends Win32Enum{

    /**
     * HDCP was successfully set.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The HDCP operation timed out and protection was not set.
     * @type {Integer (Int32)}
     */
    static TimedOut => 1

    /**
     * The device doesn't support the HDCP level that was attempted.
     * @type {Integer (Int32)}
     */
    static NotSupported => 2

    /**
     * The HDCP operation failed for an unknown reason.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 3
}
