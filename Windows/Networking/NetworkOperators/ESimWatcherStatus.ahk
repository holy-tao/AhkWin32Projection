#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the status of an [ESimWatcher](esimwatcher.md).
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimwatcherstatus
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimWatcherStatus extends Win32Enum{

    /**
     * Indicates that the watcher has been created.
     * @type {Integer (Int32)}
     */
    static Created => 0

    /**
     * Indicates that the watcher has been started.
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * Indicates that the watcher has finished enumerating eSIMS.
     * @type {Integer (Int32)}
     */
    static EnumerationCompleted => 2

    /**
     * Indicates that the watcher is stopping.
     * @type {Integer (Int32)}
     */
    static Stopping => 3

    /**
     * Indicates that the watcher has been stopped.
     * @type {Integer (Int32)}
     */
    static Stopped => 4
}
