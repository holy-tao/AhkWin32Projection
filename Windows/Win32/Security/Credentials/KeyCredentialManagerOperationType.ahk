#Requires AutoHotkey v2.0.0 64-bit

/**
 * These are the operational enum values that are passed to KeyCredentialManagerShowUIOperation.
 * @see https://learn.microsoft.com/windows/win32/api/keycredmgr/ne-keycredmgr-keycredentialmanageroperationtype
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class KeyCredentialManagerOperationType{

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
