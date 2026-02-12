#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies how the content is treated, based on the user's content settings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.contentrestrictions.contentaccessrestrictionlevel
 * @namespace Windows.Media.ContentRestrictions
 * @version WindowsRuntime 1.4
 */
class ContentAccessRestrictionLevel extends Win32Enum{

    /**
     * Can be shown in the content catalog and consumed.
     * @type {Integer (Int32)}
     */
    static Allow => 0

    /**
     * (Xbox only) If multiple users are logged in and the content is blocked for at least one user, content is allowed with a warning displayed.
     * @type {Integer (Int32)}
     */
    static Warn => 1

    /**
     * Can be shown in the content catalog, but will be blocked by [RequestContentAccessAsync](ratedcontentrestrictions_requestcontentaccessasync_637668410.md).
     * @type {Integer (Int32)}
     */
    static Block => 2

    /**
     * Can't be shown in the content catalog. It's rating is higher than the user's settings, determined by [MaxBrowsableAgeRating](contentrestrictionsbrowsepolicy_maxbrowsableagerating.md).
     * @type {Integer (Int32)}
     */
    static Hide => 3
}
