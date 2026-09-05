#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumeration of Error states returned by the function KeyCredentialManagerGetOperationErrorStates as flags.
 * @see https://learn.microsoft.com/windows/win32/api/keycredmgr/ne-keycredmgr-keycredentialmanageroperationerrorstates
 * @namespace Windows.Win32.Security.Credentials
 */
class KeyCredentialManagerOperationErrorStates extends Win32BitflagEnum {

    /**
     * No Error  equivalent to ERROR_SUCCESS.
     * Native name: KeyCredentialManagerOperationErrorStateNone
     * @type {Integer (Int32)}
     */
    static StateNone => 0

    /**
     * WHFB enrollment will successfully complete because the device is not properly joined to Azure or the Enterprise.
     * Native name: KeyCredentialManagerOperationErrorStateDeviceJoinFailure
     * @type {Integer (Int32)}
     */
    static StateDeviceJoinFailure => 1

    /**
     * WHFB enrollment will not successfully complete because the user could not get a token from Azure or the Enterprise.
     * Native name: KeyCredentialManagerOperationErrorStateTokenFailure
     * @type {Integer (Int32)}
     */
    static StateTokenFailure => 2

    /**
     * WHFB enrollment will not successfully complete because the certificate authority and/or certificate template could not be found.
     * Native name: KeyCredentialManagerOperationErrorStateCertificateFailure
     * @type {Integer (Int32)}
     */
    static StateCertificateFailure => 4

    /**
     * WHFB enrollment will not successfully complete because the current session is a remote session.
     * Native name: KeyCredentialManagerOperationErrorStateRemoteSessionFailure
     * @type {Integer (Int32)}
     */
    static StateRemoteSessionFailure => 8

    /**
     * WHFB enrollment will not successfully complete because there was an error reading MDM or Group Policy.
     * Native name: KeyCredentialManagerOperationErrorStatePolicyFailure
     * @type {Integer (Int32)}
     */
    static StatePolicyFailure => 16

    /**
     * WHFB enrollment will not successful complete because the device does not have the required hardware.
     * Native name: KeyCredentialManagerOperationErrorStateHardwareFailure
     * @type {Integer (Int32)}
     */
    static StateHardwareFailure => 32

    /**
     * WHFB is already enrolled on this device.
     * Native name: KeyCredentialManagerOperationErrorStatePinExistsFailure
     * @type {Integer (Int32)}
     */
    static StatePinExistsFailure => 64
}
