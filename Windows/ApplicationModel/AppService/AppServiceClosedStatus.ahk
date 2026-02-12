#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the status that was set when the endpoint for the app service was closed. App service providers enable app-to-app communication by providing services that other Universal Windows app can consume.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceclosedstatus
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class AppServiceClosedStatus extends Win32Enum{

    /**
     * The endpoint for the app service closed gracefully.
     * @type {Integer (Int32)}
     */
    static Completed => 0

    /**
     * The endpoint for the app service was closed by the client or the system
     * @type {Integer (Int32)}
     */
    static Canceled => 1

    /**
     * The endpoint for the app service was closed because the endpoint ran out of resources.
     * @type {Integer (Int32)}
     */
    static ResourceLimitsExceeded => 2

    /**
     * An unknown error occurred.
     * @type {Integer (Int32)}
     */
    static Unknown => 3
}
