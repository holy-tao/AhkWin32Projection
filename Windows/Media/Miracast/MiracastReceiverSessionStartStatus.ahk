#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The status of a [Start](miracastreceiversession_start_1587696324.md) or [StartAsync](miracastreceiversession_startasync_1931900819.md) operation.
 * @remarks
 * Store apps must declare the PrivateNetworkClientServer capability in their manifest in order to be allowed to start a Miracast Receiver Session. If the capability is missing, it results in an AccessDenied error.
 * 
 * Use [MiracastReceiverStatus.ListeningStatus](miracastreceiverstatus_listeningstatus.md) to determine if the Miracast Receiver is actually listening for incoming connections, as starting a MiracastReceiverSession does not guarantee that the Miracast Receiver is listening for connections.
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiversessionstartstatus
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverSessionStartStatus extends Win32Enum{

    /**
     * The Miracast Receiver started successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The Miracast Receiver Session could not be started due an unknown error.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 1

    /**
     * The Miracast Receiver Session cannot start because Miracast is not supported on the current device.
     * @type {Integer (Int32)}
     */
    static MiracastNotSupported => 2

    /**
     * The app is not allowed to start a Miracast Receiver Session.
     * @type {Integer (Int32)}
     */
    static AccessDenied => 3
}
