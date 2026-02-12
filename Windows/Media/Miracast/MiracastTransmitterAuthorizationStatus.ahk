#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the authorization status of a Miracast Transmitter.
 * @remarks
 * When a new Miracast connection is received, [MiracastReceiverAuthorizationMethod](miracastreceiverauthorizationmethod.md) controls which type of authorization, if any, should be applied. (E.g., whether to display a PIN, or ask the user to approve the connection attempt.)
 * 
 * But the MiracastTransmitterAuthorizationStatus value can override the [MiracastReceiverAuthorizationMethod](miracastreceiverauthorizationmethod.md).
 * A value of MiracastTransmitterAuthorizationStatus.Blocked causes incoming connections from the specified Transmitter to be automatically rejected without prompting the user.
 * 
 * When the value is MiracastTransmitterAuthorizationStatus.Allowed, the effective [MiracastReceiverAuthorizationMethod](miracastreceiverauthorizationmethod.md) value becomes MiracastReceiverAuthorizationMethod.None, i.e., the user is not prompted and no PIN is displayed.
 * 
 * When the value is MiracastTransmitterAuthorizationStatus.AlwaysPrompt, the effective [MiracastReceiverAuthorizationMethod](miracastreceiverauthorizationmethod.md) value becomes MiracastReceiverAuthorizationMethod.ConfirmConnection, i.e., the user is prompted even if a PIN authorization is requested.
 * 
 * [MiracastReceiverSettings.RequireAuthorizationFromKnownTransmitters](miracastreceiversettings_requireauthorizationfromknowntransmitters.md) overrides the above if the value has been set to true.
 * In that case, values of MiracastTransmitterAuthorizationStatus.Allowed and MiracastTransmitterAuthorizationStatus.AlwaysPrompt are treated the same way as the value MiracastTransmitterAuthorizationStatus.Undecided, which means that the [MiracastReceiverAuthorizationMethod](miracastreceiverauthorizationmethod.md) value controls the authorization method.
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracasttransmitterauthorizationstatus
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastTransmitterAuthorizationStatus extends Win32Enum{

    /**
     * A decision has not yet been made about whether to allow or block this transmitter.
     * @type {Integer (Int32)}
     */
    static Undecided => 0

    /**
     * Connections from this transmitter are allowed.
     * @type {Integer (Int32)}
     */
    static Allowed => 1

    /**
     * Connections from this transmitter are allowed, but always ask the user to confirm a new connection.
     * @type {Integer (Int32)}
     */
    static AlwaysPrompt => 2

    /**
     * All connection attempts from this transmitter are automatically rejected.
     * @type {Integer (Int32)}
     */
    static Blocked => 3
}
