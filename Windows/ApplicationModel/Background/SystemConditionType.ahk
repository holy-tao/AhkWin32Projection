#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies a system condition that must be in effect for a background task to run. If a background task with a system condition is triggered, the task will not run until the condition is met.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.systemconditiontype
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class SystemConditionType extends Win32Enum{

    /**
     * Not a valid condition type.
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * Specifies that the background task can only run when the user is present. If a background task with the **UserPresent** condition is triggered, and the user is away, the task will not run until the user is present.
     * @type {Integer (Int32)}
     */
    static UserPresent => 1

    /**
     * Specifies that background task can only run when the user is not present. If a background task with the **UserNotPresent** condition is triggered, and the user is present, the task will not run until the user becomes inactive.
     * @type {Integer (Int32)}
     */
    static UserNotPresent => 2

    /**
     * Specifies that the background task can only run when the Internet is available. If a background task with the **InternetAvailable** condition is triggered, and the Internet is not available, the task will not run until the Internet is available again. This condition saves power because the background task won't execute until the network is available. This condition does not provide real-time activation.
     * 
     * > [!Important]
     * > Set [IsNetworkRequested](backgroundtaskbuilder_isnetworkrequested.md) on your background task to ensure that the network stays up while the background task runs. This tells the background task infrastructure to keep the network up while the task is executing, even if the device has entered Connected Standby mode, so that you can call into the core networking APIs ([HttpClient](../windows.web.http/httpclient.md), [StreamSocket](../windows.networking.sockets/streamsocket.md), [DatagramSocket](../windows.networking.sockets/datagramsocket.md), etc.) If your background task does not set **IsNetworkRequested**, then your background task will not be able to access the network when in Connected Standby mode (for example, when a phone's screen is turned off.)
     * @type {Integer (Int32)}
     */
    static InternetAvailable => 3

    /**
     * Specifies that the background task can only run when the Internet is not available. If a background task with the **InternetNotAvailable** condition is triggered, and the Internet is available, the task will not run until the Internet is unavailable.
     * @type {Integer (Int32)}
     */
    static InternetNotAvailable => 4

    /**
     * Specifies that the background task can only run when the user's session is connected. If a background task with the **SessionConnected** condition is triggered, and the user session is not logged in, the task will run when the user logs in.
     * @type {Integer (Int32)}
     */
    static SessionConnected => 5

    /**
     * Specifies that the background task can only run when the user's session is disconnected. If a background task with the **SessionDisconnected** condition is triggered, and the user is logged in, the task will run when the user disconnects the remote desktop session or does fast user switching> [!NOTE]
     * > **SessionDisconnected** is primarily used in the context of remote desktop and fast user switching. It is not meant to be used as a notification that the user has logged off of the machine.
     * @type {Integer (Int32)}
     */
    static SessionDisconnected => 6

    /**
     * Specifies that the background task can only run when a free (non-metered) network connection is available.
     * @type {Integer (Int32)}
     */
    static FreeNetworkAvailable => 7

    /**
     * Specifies that the background task can only run when the cost to do background work is low.
     * @type {Integer (Int32)}
     */
    static BackgroundWorkCostNotHigh => 8
}
