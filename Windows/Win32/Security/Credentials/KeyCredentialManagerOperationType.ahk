#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * These are the operational enum values that are passed to KeyCredentialManagerShowUIOperation.
 * @see https://learn.microsoft.com/windows/win32/api/keycredmgr/ne-keycredmgr-keycredentialmanageroperationtype
 * @namespace Windows.Win32.Security.Credentials
 */
class KeyCredentialManagerOperationType extends Win32Enum {

    /**
     * Start the Provisioning operation.
     * Native name: KeyCredentialManagerProvisioning
     * @type {Integer (Int32)}
     */
    static Provisioning => 0

    /**
     * Start the User Change PIN operation.
     * Native name: KeyCredentialManagerPinChange
     * @type {Integer (Int32)}
     */
    static PinChange => 1

    /**
     * Start the User PIN Reset operation.
     * Native name: KeyCredentialManagerPinReset
     * @type {Integer (Int32)}
     */
    static PinReset => 2
}
