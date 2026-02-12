#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the status of an **XboxLiveEndpointPair** creation operation. 
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpaircreationstatus
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveEndpointPairCreationStatus extends Win32Enum{

    /**
     * Creating succeeded.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * Creation failed because the local device is not connected to a network.
     * @type {Integer (Int32)}
     */
    static NoLocalNetworks => 1

    /**
     * Creation failed because there are no compatible network paths.
     * @type {Integer (Int32)}
     */
    static NoCompatibleNetworkPaths => 2

    /**
     * Creation failed because the local system's authorization was deemed unacceptable by the remote system.
     * @type {Integer (Int32)}
     */
    static LocalSystemNotAuthorized => 3

    /**
     * Creation failed because the user chose to cancel it.
     * @type {Integer (Int32)}
     */
    static Canceled => 4

    /**
     * Creation failed because it did not complete within the timeout period.
     * @type {Integer (Int32)}
     */
    static TimedOut => 5

    /**
     * Creation failed because the remote system's authorization was deemed unacceptable by the local system or by your app.
     * @type {Integer (Int32)}
     */
    static RemoteSystemNotAuthorized => 6

    /**
     * Creation failed because the remote system has a different, incompatible configuration (mismatched template definitions), and has actively refused the connection.
     * @type {Integer (Int32)}
     */
    static RefusedDueToConfiguration => 7

    /**
     * Creation failed due to an internal error.
     * @type {Integer (Int32)}
     */
    static UnexpectedInternalError => 8
}
