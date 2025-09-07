#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains possible values for the ConnectionRecoveryBehavior property, which indicates whether an accessible technology client adjusts provider request timeouts when the provider is non-responsive.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/ne-uiautomationclient-connectionrecoverybehavioroptions
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ConnectionRecoveryBehaviorOptions{

    /**
     * Connection recovery is disabled.
     * @type {Integer (Int32)}
     */
    static ConnectionRecoveryBehaviorOptions_Disabled => 0

    /**
     * Connection recovery is enabled.
     * @type {Integer (Int32)}
     */
    static ConnectionRecoveryBehaviorOptions_Enabled => 1
}
