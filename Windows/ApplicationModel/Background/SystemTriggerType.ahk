#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the system events that can be used to trigger a background task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.systemtriggertype
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class SystemTriggerType extends Win32Enum{

    /**
     * Not a valid trigger type.
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * The background task is triggered when a new SMS message is received by an installed mobile broadband device.
     * @type {Integer (Int32)}
     */
    static SmsReceived => 1

    /**
     * The background task is triggered when the user becomes present.
     * 
     * > **Windows 8, Windows Server 2012, Windows 8.1, Windows Server 2012 R2, Windows Phone 8.1**
     * > An app must be placed on the lock screen before it can successfully register background tasks using this trigger type.
     * 
     * 
     * 
     * > **Windows 10, Windows Server 2016, Windows 10 Mobile**
     * > You do not need to place an app on the lock screen before the app can successfully register background tasks using this trigger type.
     * @type {Integer (Int32)}
     */
    static UserPresent => 2

    /**
     * The background task is triggered when the user becomes absent.
     * 
     * > **Windows 8, Windows Server 2012, Windows 8.1, Windows Server 2012 R2, Windows Phone 8.1**
     * > An app must be placed on the lock screen before it can successfully register background tasks using this trigger type.
     * 
     * 
     * 
     * > **Windows 10, Windows Server 2016, Windows 10 Mobile**
     * > You do not need to place an app on the lock screen before the app can successfully register background tasks using this trigger type.
     * @type {Integer (Int32)}
     */
    static UserAway => 3

    /**
     * The background task is triggered when a network change occurs, such as a change in cost or connectivity.
     * @type {Integer (Int32)}
     */
    static NetworkStateChange => 4

    /**
     * The background task is triggered when a control channel is reset.
     * 
     * > [!NOTE]
     * > This trigger type does not support a [OneShot](systemtrigger_oneshot.md) mode. So the *OneShot* parameter must be false when using the [SystemTrigger](systemtrigger_systemtrigger_1157162657.md) constructor.
     * 
     * 
     * 
     * > **Windows 8, Windows Server 2012, Windows 8.1, Windows Server 2012 R2, Windows Phone 8.1**
     * > An app must be placed on the lock screen before it can successfully register background tasks using this trigger type.
     * 
     * 
     * 
     * > **Windows 10, Windows Server 2016, Windows 10 Mobile**
     * > You do not need to place an app on the lock screen before the app can successfully register background tasks using this trigger type.
     * @type {Integer (Int32)}
     */
    static ControlChannelReset => 5

    /**
     * The background task is triggered when the Internet becomes available.
     * @type {Integer (Int32)}
     */
    static InternetAvailable => 6

    /**
     * The background task is triggered when the session is connected.
     * 
     * > **Windows 8, Windows Server 2012, Windows 8.1, Windows Server 2012 R2, Windows Phone 8.1**
     * > An app must be placed on the lock screen before it can successfully register background tasks using this trigger type.
     * 
     * 
     * 
     * > **Windows 10, Windows Server 2016, Windows 10 Mobile**
     * > You do not need to place an app on the lock screen before the app can successfully register background tasks using this trigger type.
     * @type {Integer (Int32)}
     */
    static SessionConnected => 7

    /**
     * The background task is triggered when the system has finished updating an app.
     * @type {Integer (Int32)}
     */
    static ServicingComplete => 8

    /**
     * The background task is triggered when a tile is added to the lock screen.
     * @type {Integer (Int32)}
     */
    static LockScreenApplicationAdded => 9

    /**
     * The background task is triggered when a tile is removed from the lock screen.
     * @type {Integer (Int32)}
     */
    static LockScreenApplicationRemoved => 10

    /**
     * The background task is triggered when the time zone changes on the device (for example, when the system adjusts the clock for daylight saving time).
     * 
     * > [!NOTE]
     * > This trigger only fires if the new time zone actually changes the system time.
     * @type {Integer (Int32)}
     */
    static TimeZoneChange => 11

    /**
     * The background task is triggered when the Microsoft account connected to the account changes.
     * @type {Integer (Int32)}
     */
    static OnlineIdConnectedStateChange => 12

    /**
     * The background task is triggered when the cost of background work changes.
     * 
     * > **Windows 8, Windows Server 2012, Windows 8.1, Windows Server 2012 R2, Windows Phone 8.1**
     * > An app must be placed on the lock screen before it can successfully register background tasks using this trigger type.
     * 
     * 
     * 
     * > **Windows 10, Windows Server 2016, Windows 10 Mobile**
     * > You do not need to place an app on the lock screen before the app can successfully register background tasks using this trigger type.
     * @type {Integer (Int32)}
     */
    static BackgroundWorkCostChange => 13

    /**
     * The background task is triggered when the status of the battery, [BatteryStatus](../windows.system.power/powermanager_batterystatus.md), changes.
     * 
     * > [!NOTE]
     * > This value was introduced in Windows 10.
     * @type {Integer (Int32)}
     */
    static PowerStateChange => 14

    /**
     * The background task is triggered when the default sign-in account changes.
     * 
     * > [!NOTE]
     * > This value was introduced in Windows 10, version 1607.
     * @type {Integer (Int32)}
     */
    static DefaultSignInAccountChange => 15
}
