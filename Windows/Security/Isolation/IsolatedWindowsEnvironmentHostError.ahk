#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Enumerator that represents possible list of errors that are needed to be resolved before Isolated Windows Environment can be created on a host.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmenthosterror
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentHostError extends Win32Enum{

    /**
     * Admin policy for feature is not configured or disabled
     * @type {Integer (Int32)}
     */
    static AdminPolicyIsDisabledOrNotPresent => 0

    /**
     * Feature has not been installed on device
     * @type {Integer (Int32)}
     */
    static FeatureNotInstalled => 1

    /**
     * Device does not meet hardware requirements
     * @type {Integer (Int32)}
     */
    static HardwareRequirementsNotMet => 2

    /**
     * Reboot required
     * @type {Integer (Int32)}
     */
    static RebootRequired => 3

    /**
     * Unknown error
     * @type {Integer (Int32)}
     */
    static UnknownError => 4
}
