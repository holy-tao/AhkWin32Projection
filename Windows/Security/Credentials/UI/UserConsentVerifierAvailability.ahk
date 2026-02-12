#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the result of a check for an an authentication device such as a fingerprint reader.
 * @remarks
 * You can use the [CheckAvailabilityAsync](userconsentverifier_checkavailabilityasync_167910294.md) method to determine if fingerprint authentication is supported for the current computer.
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.ui.userconsentverifieravailability
 * @namespace Windows.Security.Credentials.UI
 * @version WindowsRuntime 1.4
 */
class UserConsentVerifierAvailability extends Win32Enum{

    /**
     * An authentication device is available.
     * @type {Integer (Int32)}
     */
    static Available => 0

    /**
     * There is no authentication device available.
     * @type {Integer (Int32)}
     */
    static DeviceNotPresent => 1

    /**
     * An authentication device is not configured for this user.
     * @type {Integer (Int32)}
     */
    static NotConfiguredForUser => 2

    /**
     * Group policy has disabled the authentication device.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 3

    /**
     * The authentication device is performing an operation and is unavailable.
     * @type {Integer (Int32)}
     */
    static DeviceBusy => 4
}
