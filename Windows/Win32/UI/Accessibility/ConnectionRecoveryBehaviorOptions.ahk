#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains possible values for the ConnectionRecoveryBehavior property, which indicates whether an accessible technology client adjusts provider request timeouts when the provider is non-responsive.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/ne-uiautomationclient-connectionrecoverybehavioroptions
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ConnectionRecoveryBehaviorOptions {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
