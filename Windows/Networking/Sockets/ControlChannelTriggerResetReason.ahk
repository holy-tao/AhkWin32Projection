#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The reason why a [ControlChannelTrigger](controlchanneltrigger.md) was reset.
 * @remarks
 * This ControlChannelTriggerResetReason enumeration is used to indicate the reason why a [ControlChannelTrigger](controlchanneltrigger.md) was reset and needs to be reestablished. The reset reason provides details to the app about the reason for the reset which could be a result of fast user switching or a low power exit (the computer entering Connected standby mode). This allows the app to recreate the connection to the remote destination by re-establishing the [ControlChannelTrigger](controlchanneltrigger.md) and the underlying transport connection.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltriggerresetreason
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class ControlChannelTriggerResetReason extends Win32Enum{

    /**
     * The [ControlChannelTrigger](controlchanneltrigger.md) was reset as a result of fast user switching.
     * @type {Integer (Int32)}
     */
    static FastUserSwitched => 0

    /**
     * The [ControlChannelTrigger](controlchanneltrigger.md) was reset as a result of a low power exit (Connected Standby exit).
     * @type {Integer (Int32)}
     */
    static LowPowerExit => 1

    /**
     * The [ControlChannelTrigger](controlchanneltrigger.md) was reset as a result of quiet hours being set on the device and quiet hours having ended.
     * 
     * This value is supported on Windows 8.1, Windows Server 2012 R2, and later.
     * @type {Integer (Int32)}
     */
    static QuietHoursExit => 2

    /**
     * he [ControlChannelTrigger](controlchanneltrigger.md) was reset as a result of an app restart.
     * 
     * This value is supported on Windows 8.1, Windows Server 2012 R2, and later.
     * @type {Integer (Int32)}
     */
    static ApplicationRestart => 3
}
