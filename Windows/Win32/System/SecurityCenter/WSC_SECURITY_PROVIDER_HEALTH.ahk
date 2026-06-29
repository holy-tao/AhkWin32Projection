#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the possible states for any service monitored by Windows Security Center (WSC).
 * @see https://learn.microsoft.com/windows/win32/api/wscapi/ne-wscapi-wsc_security_provider_health
 * @namespace Windows.Win32.System.SecurityCenter
 */
export default struct WSC_SECURITY_PROVIDER_HEALTH {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The status of the security provider category is good and does not need user attention.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_HEALTH_GOOD => 0

    /**
     * The status of the security provider category is not monitored by WSC.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_HEALTH_NOTMONITORED => 1

    /**
     * The status of the security provider category is poor and the computer may be at risk.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_HEALTH_POOR => 2

    /**
     * The security provider category is in snooze state. Snooze indicates that WSC is not actively protecting the computer.
     * @type {Integer (Int32)}
     */
    static WSC_SECURITY_PROVIDER_HEALTH_SNOOZE => 3
}
