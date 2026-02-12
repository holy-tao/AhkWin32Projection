#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the readiness of a device to connect to a wireless network.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * Mobile operator UWP app can have access to different states of the device. Access to the device states such as device readiness, account activation state, and device lock status are made available through the NetworkDeviceStatus enumeration. The radio state information is available through the [CurrentRadioState](mobilebroadbanddeviceinformation_currentradiostate.md) enumeration. Note that these are two different states. For example, a radio state **Off** does not translate to a **DeviceNotReady** state and vice versa.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkdevicestatus
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class NetworkDeviceStatus extends Win32Enum{

    /**
     * The mobile broadband device is off.
     * @type {Integer (Int32)}
     */
    static DeviceNotReady => 0

    /**
     * The device is powered on and ready for mobile broadband operations.
     * @type {Integer (Int32)}
     */
    static DeviceReady => 1

    /**
     * The mobile broadband device does not have a SIM card.
     * @type {Integer (Int32)}
     */
    static SimNotInserted => 2

    /**
     * The SIM card is not valid. This can occur when PIN Unblock Key attempts have exceeded the limit.
     * @type {Integer (Int32)}
     */
    static BadSim => 3

    /**
     * The mobile broadband device hardware is not responding.
     * @type {Integer (Int32)}
     */
    static DeviceHardwareFailure => 4

    /**
     * A subscription account for the mobile broadband device is not active.
     * @type {Integer (Int32)}
     */
    static AccountNotActivated => 5

    /**
     * The mobile broadband device is locked by a PIN or password preventing the device from initializing and registering with a wireless network.
     * @type {Integer (Int32)}
     */
    static DeviceLocked => 6

    /**
     * The mobile broadband device is blocked by a PIN or password preventing the device from initializing and registering with a wireless network.
     * @type {Integer (Int32)}
     */
    static DeviceBlocked => 7
}
