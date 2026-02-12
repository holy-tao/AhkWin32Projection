#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * This API is for internal use only and should not be used in your code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorserviceresponse
 * @namespace Windows.Security.Authentication.Identity.Core
 * @version WindowsRuntime 1.4
 */
class MicrosoftAccountMultiFactorServiceResponse extends Win32Enum{

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static Error => 1

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static NoNetworkConnection => 2

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static ServiceUnavailable => 3

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static TotpSetupDenied => 4

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static NgcNotSetup => 5

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static SessionAlreadyDenied => 6

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static SessionAlreadyApproved => 7

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static SessionExpired => 8

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static NgcNonceExpired => 9

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static InvalidSessionId => 10

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static InvalidSessionType => 11

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static InvalidOperation => 12

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static InvalidStateTransition => 13

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static DeviceNotFound => 14

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static FlowDisabled => 15

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static SessionNotApproved => 16

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static OperationCanceledByUser => 17

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static NgcDisabledByServer => 18

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static NgcKeyNotFoundOnServer => 19

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static UIRequired => 20

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static DeviceIdChanged => 21
}
