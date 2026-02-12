#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the time period for subsequent polls of the tile or badge data source for new content.
  * Used by [BadgeUpdater.StartPeriodicUpdate](badgeupdater_startperiodicupdate_1369986471.md), [TileUpdater.StartPeriodicUpdate](tileupdater_startperiodicupdate_1369986471.md), and [TileUpdater.StartPeriodicUpdateBatch](tileupdater_startperiodicupdatebatch_1331011351.md).
 * @remarks
 * Windows can delay the polling of your URL by up to 15 minutes if necessary to optimize power and performance.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.periodicupdaterecurrence
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class PeriodicUpdateRecurrence extends Win32Enum{

    /**
     * Poll every half an hour.
     * @type {Integer (Int32)}
     */
    static HalfHour => 0

    /**
     * Poll every hour.
     * @type {Integer (Int32)}
     */
    static Hour => 1

    /**
     * Poll every 6 hours.
     * @type {Integer (Int32)}
     */
    static SixHours => 2

    /**
     * Poll every 12 hours.
     * @type {Integer (Int32)}
     */
    static TwelveHours => 3

    /**
     * Poll once a day.
     * @type {Integer (Int32)}
     */
    static Daily => 4
}
