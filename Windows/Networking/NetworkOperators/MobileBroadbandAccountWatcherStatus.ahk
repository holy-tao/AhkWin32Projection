#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes different states of a MobileBroadbandAccountWatcherStatus object.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandaccountwatcherstatus
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandAccountWatcherStatus extends Win32Enum{

    /**
     * The watcher has been created but not started and is in its initial state.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * The watcher has been started and has yet to enumerate the existing accounts.
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * The watcher is running and has finished enumerating the existing accounts.
     * @type {Integer (Int32)}
     */
    static EnumerationCompleted => 2

    /**
     * The watcher has been stopped. No events will be delivered while the watcher is in this state.
     * @type {Integer (Int32)}
     */
    static Stopped => 3

    /**
     * The watcher has aborted its watching operation due to an unexpected error condition. No events will be delivered while the watcher is in this state.
     * @type {Integer (Int32)}
     */
    static Aborted => 4
}
