#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the status of a [DisconnectAllAndApplySettings](miracastreceiver_disconnectallandapplysettings_1413841516.md) or [DisconnectAllAndApplySettingsAsync](miracastreceiver_disconnectallandapplysettingsasync_404771925.md) operation.
 * @remarks
 * Store apps must declare the **PrivateNetworkClientServer** capability in their app manifest in order to be allowed to change the Miracast settings. If the capability is missing, it results in an *AccessDenied* status value.
 * If Miracast has been enabled by the system, such as through Windows Settings, other apps are not allowed to change the settings, and attempts to do so will result in the *AccessDenied* status value.
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverapplysettingsstatus
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverApplySettingsStatus extends Win32Enum{

    /**
     * The operation succeeded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The operation failed for an unknown reason.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 1

    /**
     * The operation failed because Miracast is not supported on the current device.
     * @type {Integer (Int32)}
     */
    static MiracastNotSupported => 2

    /**
     * The operation failed because the app is not allowed to change the settings.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 3

    /**
     * The operation failed because the number of characters in the *FriendlyName* parameter exceeded the maximum allowed value.
     * @type {Integer (Int32)}
     */
    static FriendlyNameTooLong => 4

    /**
     * The operation failed because the number of characters in the *ModelName* parameter exceeded the maximum allowed value.
     * @type {Integer (Int32)}
     */
    static ModelNameTooLong => 5

    /**
     * The operation failed because the number of characters in the *ModelNumber* parameter exceeded the maximum allowed value.
     * @type {Integer (Int32)}
     */
    static ModelNumberTooLong => 6

    /**
     * The operation failed because one or more parameters were set to an invalid value.
     * @type {Integer (Int32)}
     */
    static InvalidSettings => 7
}
