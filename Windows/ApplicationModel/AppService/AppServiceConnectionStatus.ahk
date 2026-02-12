#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the status for the attempt that an app makes to open a connection to an app service by calling the [AppServiceConnection.OpenAsync](appserviceconnection_openasync_171309613.md) method. App service providers enable app-to-app communication by providing services that other Universal Windows app can consume.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceconnectionstatus
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class AppServiceConnectionStatus extends Win32Enum{

    /**
     * The connection to the app service was opened successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The package for the app service to which a connection was attempted is not installed on the device. Check that the package is installed before trying to open a connection to the app service.
     * @type {Integer (Int32)}
     */
    static AppNotInstalled => 1

    /**
     * The package for the app service to which a connection was attempted is temporarily unavailable. Try to connect again later.
     * @type {Integer (Int32)}
     */
    static AppUnavailable => 2

    /**
     * The app with the specified package family name is installed and available, but the app does not declare support for the specified app service. Check that the name of the app service and the version of the app are correct.
     * @type {Integer (Int32)}
     */
    static AppServiceUnavailable => 3

    /**
     * An unknown error occurred.
     * @type {Integer (Int32)}
     */
    static Unknown => 4

    /**
     * The device to which a connection was attempted is not available.
     * @type {Integer (Int32)}
     */
    static RemoteSystemUnavailable => 5

    /**
     * The app on the remote device does not support remote connections. It needs to specify SupportsRemoteSystems="true" on the appService extension in its AppXManifest to accept remote connections.
     * @type {Integer (Int32)}
     */
    static RemoteSystemNotSupportedByApp => 6

    /**
     * The user for your app is not authorized to connect to the service.
     * @type {Integer (Int32)}
     */
    static NotAuthorized => 7

    /**
     * The operation failed due to unsuccessful account authentication. The user must re-validate the account to continue.
     * @type {Integer (Int32)}
     */
    static AuthenticationError => 8

    /**
     * The operation failed due to lack of an internet connection.
     * @type {Integer (Int32)}
     */
    static NetworkNotAvailable => 9

    /**
     * The operation failed, as the app service needed service or capabilities disabled by some policies on the local or remote device.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 10

    /**
     * The operation failed because one or more necessary cloud services were temporarily unavailable.
     * @type {Integer (Int32)}
     */
    static WebServiceUnavailable => 11
}
