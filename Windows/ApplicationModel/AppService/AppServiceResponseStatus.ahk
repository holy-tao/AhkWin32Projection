#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the status when an app tries to send a message to an app service by calling the [AppServiceConnection.SendMessageAsync](appserviceconnection_sendmessageasync_1777128850.md) method. App service providers enable app-to-app communication by providing services that other Universal Windows app can consume.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceresponsestatus
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class AppServiceResponseStatus extends Win32Enum{

    /**
     * The app service successfully received and processed the message.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The app service failed to receive and process the message.
     * @type {Integer (Int32)}
     */
    static Failure => 1

    /**
     * The app service exited because not enough resources were available.
     * @type {Integer (Int32)}
     */
    static ResourceLimitsExceeded => 2

    /**
     * An unknown error occurred.
     * @type {Integer (Int32)}
     */
    static Unknown => 3

    /**
     * The device to which the message was sent is not available.
     * @type {Integer (Int32)}
     */
    static RemoteSystemUnavailable => 4

    /**
     * The app service failed to process the message because it is too large.
     * @type {Integer (Int32)}
     */
    static MessageSizeTooLarge => 5

    /**
     * The operation failed due to the app failing to start.
     * @type {Integer (Int32)}
     */
    static AppUnavailable => 6

    /**
     * The operation failed due to unsuccessful account authentication. The user must re-validate the account to continue.
     * @type {Integer (Int32)}
     */
    static AuthenticationError => 7

    /**
     * The operation failed due to lack of an internet connection.
     * @type {Integer (Int32)}
     */
    static NetworkNotAvailable => 8

    /**
     * The operation failed, as the app service needed service or capabilities disabled by some policies on the local or remote device.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 9

    /**
     * The operation failed because one or more necessary cloud services were temporarily unavailable.
     * @type {Integer (Int32)}
     */
    static WebServiceUnavailable => 10
}
