#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the status of the Miracast Receiver as it pertains to its ability to listen for incoming conections.
 * @remarks
 * Attempting to use the PC as a Miracast Transmitter will cause the Miracast Receiver on the same PC, if enabled, to enter TemporarilyDisabled state. The Miracast Receiver will revert to its previous state once the PC is no longer transmitting.
 * If the MiracastReceiverListeningStatus is Connected or ConnectionPending, the Miracast Receiver may also be listening for additional connections, if the Wi-Fi hardware supports multiple simulatenous connections, and if that functionality has been enabled.
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverlisteningstatus
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverListeningStatus extends Win32Enum{

    /**
     * The Miracast Receiver is not currently listening for incoming connections.
     * @type {Integer (Int32)}
     */
    static NotListening => 0

    /**
     * The Miracast Receiver is listening for incoming connections.
     * @type {Integer (Int32)}
     */
    static Listening => 1

    /**
     * The Miracast Receiver has received an incoming connection and is waiting for the app to accept or reject the connection.
     * @type {Integer (Int32)}
     */
    static ConnectionPending => 2

    /**
     * At least one Miracast Transmitter is currently connected.
     * @type {Integer (Int32)}
     */
    static Connected => 3

    /**
     * The Miracast Receiver has been disabled by administrative policy.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 4

    /**
     * The Miracast Receiver is temporarily disabled while other network activity is in progress.
     * @type {Integer (Int32)}
     */
    static TemporarilyDisabled => 5
}
