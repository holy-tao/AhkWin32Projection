#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the status of a Quality of Service (QoS) measurement.
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurementstatus
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveQualityOfServiceMeasurementStatus extends Win32Enum{

    /**
     * The measurement has not been started.
     * @type {Integer (Int32)}
     */
    static NotStarted => 0

    /**
     * The measurement is in progress.
     * @type {Integer (Int32)}
     */
    static InProgress => 1

    /**
     * The measurement is in progress, and provisional results are available.
     * @type {Integer (Int32)}
     */
    static InProgressWithProvisionalResults => 2

    /**
     * The measurement has completed successfully.
     * @type {Integer (Int32)}
     */
    static Succeeded => 3

    /**
     * The measurement failed because the local device has no network connections.
     * @type {Integer (Int32)}
     */
    static NoLocalNetworks => 4

    /**
     * The measurement failed because there are no compatible network paths to the target device.
     * @type {Integer (Int32)}
     */
    static NoCompatibleNetworkPaths => 5

    /**
     * Creation failed because the local system's authorization was deemed unacceptable by the remote system.
     * @type {Integer (Int32)}
     */
    static LocalSystemNotAuthorized => 6

    /**
     * The measurement was canceled.
     * @type {Integer (Int32)}
     */
    static Canceled => 7

    /**
     * The measurement timed out.
     * @type {Integer (Int32)}
     */
    static TimedOut => 8

    /**
     * Creation failed because the remote system's authorization was deemed unacceptable by the local system or by your app.
     * @type {Integer (Int32)}
     */
    static RemoteSystemNotAuthorized => 9

    /**
     * Creation failed because the remote system has a different, incompatible configuration, and has actively refused the connection.
     * @type {Integer (Int32)}
     */
    static RefusedDueToConfiguration => 10

    /**
     * The measurement failed due to an internal system error.
     * @type {Integer (Int32)}
     */
    static UnexpectedInternalError => 11
}
