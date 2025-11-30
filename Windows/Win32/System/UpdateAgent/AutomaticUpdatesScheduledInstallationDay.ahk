#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the days of the week when Automatic Updates installs or uninstalls updates.
 * @remarks
 * 
 * Updates are installed on the scheduled day. The updates depend on the settings of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_notificationlevel">NotificationLevel</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_scheduledinstallationtime">ScheduledInstallationTime</a> properties of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdatessettings">IAutomaticUpdatesSettings</a> interface.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/ne-wuapi-automaticupdatesscheduledinstallationday
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class AutomaticUpdatesScheduledInstallationDay extends Win32Enum{

    /**
     * Every day.
     * @type {Integer (Int32)}
     */
    static ausidEveryDay => 0

    /**
     * Every Sunday.
     * @type {Integer (Int32)}
     */
    static ausidEverySunday => 1

    /**
     * Every Monday.
     * @type {Integer (Int32)}
     */
    static ausidEveryMonday => 2

    /**
     * Every Tuesday.
     * @type {Integer (Int32)}
     */
    static ausidEveryTuesday => 3

    /**
     * Every Wednesday.
     * @type {Integer (Int32)}
     */
    static ausidEveryWednesday => 4

    /**
     * Every Thursday.
     * @type {Integer (Int32)}
     */
    static ausidEveryThursday => 5

    /**
     * Every Friday.
     * @type {Integer (Int32)}
     */
    static ausidEveryFriday => 6

    /**
     * Every Saturday.
     * @type {Integer (Int32)}
     */
    static ausidEverySaturday => 7
}
