#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the states of a [UserActivity](useractivity.md).
 * @remarks
 * Whenever the app modifies a property of the [UserActivity](useractivity.md), you must call [UserActivity.SaveAsync()](useractivity_saveasync_2143735121.md) to publish the change and push the updated activity to other devices.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitystate
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class UserActivityState extends Win32Enum{

    /**
     * The **UserActivity** has not yet been published.
     * @type {Integer (Int32)}
     */
    static New => 0

    /**
     * The **UserActivity** has been published on this (or another) device.
     * @type {Integer (Int32)}
     */
    static Published => 1
}
