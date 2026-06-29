#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the state of an application installation.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/ne-slpublic-sl_genuine_state
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SL_GENUINE_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The installation is genuine.
     * @type {Integer (Int32)}
     */
    static SL_GEN_STATE_IS_GENUINE => 0

    /**
     * The application does not have a valid license.
     * @type {Integer (Int32)}
     */
    static SL_GEN_STATE_INVALID_LICENSE => 1

    /**
     * The <b>Tampered</b> flag of the license associated with the application is set.
     * @type {Integer (Int32)}
     */
    static SL_GEN_STATE_TAMPERED => 2

    /**
     * The <b>Offline</b> flag of the license associated with the application is set.
     * @type {Integer (Int32)}
     */
    static SL_GEN_STATE_OFFLINE => 3

    /**
     * The state of the installation has not changed since the last time it was checked.
     * @type {Integer (Int32)}
     */
    static SL_GEN_STATE_LAST => 4
}
