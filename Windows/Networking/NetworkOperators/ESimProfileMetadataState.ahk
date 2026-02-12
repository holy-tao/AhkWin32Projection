#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the state of eSIM profile metadata.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilemetadatastate
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimProfileMetadataState extends Win32Enum{

    /**
     * Indicates that the state of the eSIM profile metadata is not known.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Indicates that the eSIM profile metadata is waiting to be installed.
     * @type {Integer (Int32)}
     */
    static WaitingForInstall => 1

    /**
     * Indicates that the eSIM profile metadata is being downloaded.
     * @type {Integer (Int32)}
     */
    static Downloading => 2

    /**
     * Indicates that the eSIM profile metadata is being installed.
     * @type {Integer (Int32)}
     */
    static Installing => 3

    /**
     * Indicates that the eSIM profile metadata has expired.
     * @type {Integer (Int32)}
     */
    static Expired => 4

    /**
     * Indicates that download of the eSIM profile metadata is being rejected.
     * @type {Integer (Int32)}
     */
    static RejectingDownload => 5

    /**
     * Indicates that the eSIM profile metadata is no longer available.
     * @type {Integer (Int32)}
     */
    static NoLongerAvailable => 6

    /**
     * Indicates that the eSIM profile metadata has been denied by policy.
     * @type {Integer (Int32)}
     */
    static DeniedByPolicy => 7
}
