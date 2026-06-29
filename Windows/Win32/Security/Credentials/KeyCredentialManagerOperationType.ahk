#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * These are the operational enum values that are passed to KeyCredentialManagerShowUIOperation.
 * @see https://learn.microsoft.com/windows/win32/api/keycredmgr/ne-keycredmgr-keycredentialmanageroperationtype
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct KeyCredentialManagerOperationType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Start the Provisioning operation.
     * @type {Integer (Int32)}
     */
    static KeyCredentialManagerProvisioning => 0

    /**
     * Start the User Change PIN operation.
     * @type {Integer (Int32)}
     */
    static KeyCredentialManagerPinChange => 1

    /**
     * Start the User PIN Reset operation.
     * @type {Integer (Int32)}
     */
    static KeyCredentialManagerPinReset => 2
}
