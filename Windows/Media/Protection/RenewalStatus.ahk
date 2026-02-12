#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the possible values returned from [RenewSystemComponentsAsync](componentrenewal_renewsystemcomponentsasync_1438723694.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.renewalstatus
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class RenewalStatus extends Win32Enum{

    /**
     * Specifies that renewal has not started.
     * @type {Integer (Int32)}
     */
    static NotStarted => 0

    /**
     * Specifies that there are updates and the user has allowed updated to proceed
     * @type {Integer (Int32)}
     */
    static UpdatesInProgress => 1

    /**
     * Specifies that the user declined to allow updates to proceed.
     * @type {Integer (Int32)}
     */
    static UserCancelled => 2

    /**
     * Specifies that no system components were detected that need updating. But app components may need to be updated, in which case the user may need to get an updated application from the store.
     * @type {Integer (Int32)}
     */
    static AppComponentsMayNeedUpdating => 3

    /**
     * Specifies that no components were found that need to be updated.
     * @type {Integer (Int32)}
     */
    static NoComponentsFound => 4
}
