#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes different types of Mobile Broadband devices.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddevicetype
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandDeviceType extends Win32Enum{

    /**
     * The device type is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The device is embedded in the system.
     * @type {Integer (Int32)}
     */
    static Embedded => 1

    /**
     * The device is removable.
     * @type {Integer (Int32)}
     */
    static Removable => 2

    /**
     * The device is remote. For example, a tethered cellular phone modem.
     * @type {Integer (Int32)}
     */
    static Remote => 3
}
