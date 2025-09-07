#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the possible states for an update service.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-updateserviceregistrationstate
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class UpdateServiceRegistrationState{

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
