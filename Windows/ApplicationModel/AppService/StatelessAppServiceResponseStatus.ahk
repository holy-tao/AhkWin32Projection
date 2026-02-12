#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates success or failure of a SendStatelessMessageAsync operation.
 * @remarks
 * Indicates success or failure of a SendStatelessMessageAsync operation.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.statelessappserviceresponsestatus
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class StatelessAppServiceResponseStatus extends Win32Enum{

    /**
     * The operation completed succesfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The operation failed due to the app not being presented on the remote system.
     * @type {Integer (Int32)}
     */
    static AppNotInstalled => 1

    /**
     * The operation failed due to the app failing to start.
     * @type {Integer (Int32)}
     */
    static AppUnavailable => 2

    /**
     * The operation failed due to the app not supporting the requested app service.
     * @type {Integer (Int32)}
     */
    static AppServiceUnavailable => 3

    /**
     * The operation failed due to the remote system being unavailable.
     * @type {Integer (Int32)}
     */
    static RemoteSystemUnavailable => 4

    /**
     * The operation failed due to the app service on the remote system missing the SupportsRemoteSystems flag.
     * @type {Integer (Int32)}
     */
    static RemoteSystemNotSupportedByApp => 5

    /**
     * The operation failed due to authorization.
     * @type {Integer (Int32)}
     */
    static NotAuthorized => 6

    /**
     * The operation failed due to resource limits being exceeded.
     * @type {Integer (Int32)}
     */
    static ResourceLimitsExceeded => 7

    /**
     * The operation failed due to the message size being too large.
     * @type {Integer (Int32)}
     */
    static MessageSizeTooLarge => 8

    /**
     * The operation failed.
     * @type {Integer (Int32)}
     */
    static Failure => 9

    /**
     * An unknown error occurred.
     * @type {Integer (Int32)}
     */
    static Unknown => 10

    /**
     * The operation failed due to unsuccessful account authentication. The user must re-validate the account to continue.
     * @type {Integer (Int32)}
     */
    static AuthenticationError => 11

    /**
     * The operation failed due to lack of an internet connection.
     * @type {Integer (Int32)}
     */
    static NetworkNotAvailable => 12

    /**
     * The operation failed, as the app service needed service or capabilities disabled by some policies on the local or remote device.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 13

    /**
     * The operation failed because one or more necessary cloud services were temporarily unavailable.
     * @type {Integer (Int32)}
     */
    static WebServiceUnavailable => 14
}
