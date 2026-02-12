#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the result of a verification operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.userconsentverificationresult
 * @namespace Windows.Security.Credentials.UI
 * @version WindowsRuntime 1.4
 */
class UserConsentVerificationResult extends Win32Enum{

    /**
     * The user was verified.
     * @type {Integer (Int32)}
     */
    static Verified => 0

    /**
     * There is no authentication device available.
     * @type {Integer (Int32)}
     */
    static DeviceNotPresent => 1

    /**
     * An authentication verifier device is not configured for this user.
     * @type {Integer (Int32)}
     */
    static NotConfiguredForUser => 2

    /**
     * Group policy has disabled authentication device verification.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 3

    /**
     * The authentication device is performing an operation and is unavailable.
     * @type {Integer (Int32)}
     */
    static DeviceBusy => 4

    /**
     * After 10 attempts, the original verification request and all subsequent attempts at the same verification were not verified.
     * @type {Integer (Int32)}
     */
    static RetriesExhausted => 5

    /**
     * The verification operation was canceled.
     * @type {Integer (Int32)}
     */
    static Canceled => 6
}
