#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the readiness of an SMS device to engage in cellular network traffic operations.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevicestatus
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsDeviceStatus extends Win32Enum{

    /**
     * The device is powered off.
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * The device is powered on and ready to be used.
     * @type {Integer (Int32)}
     */
    static Ready => 1

    /**
     * The SIM card is not inserted into the device.
     * @type {Integer (Int32)}
     */
    static SimNotInserted => 2

    /**
     * The SIM is invalid; PIN unblock key retrials have exceeded the limit.
     * @type {Integer (Int32)}
     */
    static BadSim => 3

    /**
     * General device failure.
     * @type {Integer (Int32)}
     */
    static DeviceFailure => 4

    /**
     * The service subscription is not activated.
     * @type {Integer (Int32)}
     */
    static SubscriptionNotActivated => 5

    /**
     * The device is locked by a PIN or password that prevents the device from initializing and registering on the network.
     * @type {Integer (Int32)}
     */
    static DeviceLocked => 6

    /**
     * The device is blocked by a PIN or password that prevents the device from initializing and registering on the nework.
     * @type {Integer (Int32)}
     */
    static DeviceBlocked => 7
}
