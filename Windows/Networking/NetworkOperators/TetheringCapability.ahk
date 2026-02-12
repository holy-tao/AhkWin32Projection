#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that can be returned after calling [NetworkOperatorTetheringManager.GetTetheringCapability](networkoperatortetheringmanager_gettetheringcapability_1651407752.md) to indicate the tethering capabilities of a network account.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.tetheringcapability
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class TetheringCapability extends Win32Enum{

    /**
     * Tethering is enabled.
     * @type {Integer (Int32)}
     */
    static Enabled => 0

    /**
     * Tethering is disabled according to the current group policy.
     * @type {Integer (Int32)}
     */
    static DisabledByGroupPolicy => 1

    /**
     * Tethering not available due to hardware limitations.
     * @type {Integer (Int32)}
     */
    static DisabledByHardwareLimitation => 2

    /**
     * Tethering operations disabled for this account by the network operator.
     * @type {Integer (Int32)}
     */
    static DisabledByOperator => 3

    /**
     * Tethering is not supported by the current account services.
     * @type {Integer (Int32)}
     */
    static DisabledBySku => 4

    /**
     * An application required for tethering operations is not available.
     * @type {Integer (Int32)}
     */
    static DisabledByRequiredAppNotInstalled => 5

    /**
     * Tethering is disabled for unknown reasons.
     * @type {Integer (Int32)}
     */
    static DisabledDueToUnknownCause => 6

    /**
     * Tethering has been disabled by the system because the app lacks the necessary **DeviceCapability** entry in its manifest. See [CreateFromConnectionProfile](/uwp/api/windows.networking.networkoperators.networkoperatortetheringmanager.createfromconnectionprofile) for more information about manifest requirements.
     * @type {Integer (Int32)}
     */
    static DisabledBySystemCapability => 7
}
