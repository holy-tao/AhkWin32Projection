#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the possible ways to set the NotificationLevel property of the IAutomaticUpdatesSettings interface or the IncludeRecommendedUpdates property of the IAutomaticUpdatesSettings2 interface.
 * @remarks
 * 
 * Featured update notifications are only supported on Windows Vista and above. On Windows XP systems running versions of the Windows Update Agent (WUA) that support <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdatessettings3">IAutomaticUpdatesSettings3</a>, the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings3-get_featuredupdatesenabled">IAutomaticUpdatesSettings3::FeaturedUpdatesEnabled</a> value will always be VARIANT_FALSE, and attempting to alter its value will result in an error.
 * 
 * Featured update notifications are only supported when Automatic Updates is turned on. If Automatic Updates is set to “Never check for updates (not recommended),” then the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings3-get_featuredupdatesenabled">IAutomaticUpdatesSettings3::FeaturedUpdatesEnabled</a> value will always be VARIANT_FALSE, and attempting to alter its value will result in an error.
 * 
 * Featured update notifications are only supported on certain update services. Currently, the only supported update service is Microsoft Update. If Automatic Updates is currently configured to receive updates from another service (from Windows Update, or from a WSUS server), then  the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings3-get_featuredupdatesenabled">IAutomaticUpdatesSettings3::FeaturedUpdatesEnabled</a> value will always be VARIANT_FALSE, and attempting to alter its value will result in an error.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/ne-wuapi-automaticupdatespermissiontype
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class AutomaticUpdatesPermissionType{

    /**
     * The ability to set the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_notificationlevel">IAutomaticUpdatesSettings::NotificationLevel</a> property.
     * @type {Integer (Int32)}
     */
    static auptSetNotificationLevel => 1

    /**
     * The ability to set the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_notificationlevel">IAutomaticUpdatesSettings::NotificationLevel</a> property to <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/ne-wuapi-automaticupdatesnotificationlevel">aunlDisabled</a>.
     * @type {Integer (Int32)}
     */
    static auptDisableAutomaticUpdates => 2

    /**
     * The ability to set the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings2-get_includerecommendedupdates">IAutomaticUpdatesSettings2::IncludedRecommendedUpdates</a> property.
     * @type {Integer (Int32)}
     */
    static auptSetIncludeRecommendedUpdates => 3

    /**
     * The ability to set the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings3-get_featuredupdatesenabled">IAutomaticUpdatesSettings3::FeaturedUpdatesEnabled</a> property.
     * @type {Integer (Int32)}
     */
    static auptSetFeaturedUpdatesEnabled => 4

    /**
     * The ability to set the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings3-get_nonadministratorselevated">IAutomaticUpdatesSettings3::NonAdministratorsElevated</a> property.
     * @type {Integer (Int32)}
     */
    static auptSetNonAdministratorsElevated => 5
}
