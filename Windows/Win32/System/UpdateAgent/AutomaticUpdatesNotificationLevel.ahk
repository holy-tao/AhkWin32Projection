#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible ways in which elevated users are notified about Automatic Updates events.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-automaticupdatesnotificationlevel
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class AutomaticUpdatesNotificationLevel extends Win32Enum{

    /**
     * Automatic Updates is not configured by the user or by a Group Policy administrator. Users are periodically prompted to configure Automatic Updates.
     * @type {Integer (Int32)}
     */
    static aunlNotConfigured => 0

    /**
     * Automatic Updates is disabled. Users are not  notified of important updates for the computer.
     * @type {Integer (Int32)}
     */
    static aunlDisabled => 1

    /**
     * Automatic Updates  prompts users to approve updates before it downloads or installs the updates.
     * @type {Integer (Int32)}
     */
    static aunlNotifyBeforeDownload => 2

    /**
     * Automatic Updates  automatically downloads updates, but  prompts users to approve the updates before installation.
     * @type {Integer (Int32)}
     */
    static aunlNotifyBeforeInstallation => 3

    /**
     * Automatic Updates  automatically installs updates according to the schedule that is specified by the user or by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_scheduledinstallationday">IAutomaticUpdatesSettings.ScheduledInstallationDay</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_scheduledinstallationtime">IAutomaticUPdatesSettings.ScheduledInstallationTime</a> properties. This setting is the recommended setting.
     * @type {Integer (Int32)}
     */
    static aunlScheduledInstallation => 4
}
