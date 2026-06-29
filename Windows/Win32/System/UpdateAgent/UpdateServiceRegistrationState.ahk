#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the possible states for an update service.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-updateserviceregistrationstate
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct UpdateServiceRegistrationState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The service is not registered.
     * @type {Integer (Int32)}
     */
    static usrsNotRegistered => 1

    /**
     * The service is pending registration. Registration will be attempted the next time the update agent contacts an update service.
     * @type {Integer (Int32)}
     */
    static usrsRegistrationPending => 2

    /**
     * The service is registered.
     * @type {Integer (Int32)}
     */
    static usrsRegistered => 3
}
