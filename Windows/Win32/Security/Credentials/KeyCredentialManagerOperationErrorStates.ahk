#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumeration of Error states returned by the function KeyCredentialManagerGetOperationErrorStates as flags.
 * @see https://docs.microsoft.com/windows/win32/api//keycredmgr/ne-keycredmgr-keycredentialmanageroperationerrorstates
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class KeyCredentialManagerOperationErrorStates{

    /**
     * No Error  equivalent to ERROR_SUCCESS.
     * @type {Integer (Int32)}
     */
    static KeyCredentialManagerOperationErrorStateNone => 0

    /**
     * WHFB enrollment will successfully complete because the device is not properly joined to Azure or the Enterprise.
     * @type {Integer (Int32)}
     */
    static KeyCredentialManagerOperationErrorStateDeviceJoinFailure => 1

    /**
     * WHFB enrollment will not successfully complete because the user could not get a token from Azure or the Enterprise.
     * @type {Integer (Int32)}
     */
    static KeyCredentialManagerOperationErrorStateTokenFailure => 2

    /**
     * WHFB enrollment will not successfully complete because the certificate authority and/or certificate template could not be found.
     * @type {Integer (Int32)}
     */
    static KeyCredentialManagerOperationErrorStateCertificateFailure => 4

    /**
     * WHFB enrollment will not successfully complete because the current session is a remote session.
     * @type {Integer (Int32)}
     */
    static KeyCredentialManagerOperationErrorStateRemoteSessionFailure => 8

    /**
     * WHFB enrollment will not successfully complete because there was an error reading MDM or Group Policy.
     * @type {Integer (Int32)}
     */
    static KeyCredentialManagerOperationErrorStatePolicyFailure => 16

    /**
     * WHFB enrollment will not successful complete because the device does not have the required hardware.
     * @type {Integer (Int32)}
     */
    static KeyCredentialManagerOperationErrorStateHardwareFailure => 32

    /**
     * WHFB is already enrolled on this device.
     * @type {Integer (Int32)}
     */
    static KeyCredentialManagerOperationErrorStatePinExistsFailure => 64
}
