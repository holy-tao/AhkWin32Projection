#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the current stage in the lifecycle of the Out-of-Box Experience (OOBE).
 * @remarks
 * The Out-of-Box Experience (OOBE) is the flow that occurs the first time the user turns on a Windows 10 device. The OOBE obtains acceptance of the EULA, sets the system default locale, and helps set up the initial user account.
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemoutofboxexperiencestate
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class SystemOutOfBoxExperienceState extends Win32Enum{

    /**
     * Indicates that the OOBE has not yet started on this device.
     * @type {Integer (Int32)}
     */
    static NotStarted => 0

    /**
     * Indicates that the OOBE has started and is in progress on this device.
     * @type {Integer (Int32)}
     */
    static InProgress => 1

    /**
     * Indicates that the OOBE has completed on this device. This is the value reported for devices that have no OOBE.
     * @type {Integer (Int32)}
     */
    static Completed => 2
}
