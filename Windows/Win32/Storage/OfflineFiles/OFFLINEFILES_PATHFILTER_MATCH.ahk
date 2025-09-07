#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how closely an event must match a filter.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_pathfilter_match
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class OFFLINEFILES_PATHFILTER_MATCH{

    /**
     * Event must be an exact match for the fully qualified UNC path associated with the filter.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_PATHFILTER_SELF => 0

    /**
     * Event must be for an immediate child of the fully qualified UNC path associated with the filter.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_PATHFILTER_CHILD => 1

    /**
     * Event can be any descendant of the fully qualified UNC path associated with the filter.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_PATHFILTER_DESCENDENT => 2

    /**
     * Event must be an exact match or an immediate child of the fully qualified UNC path associated with the filter.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_PATHFILTER_SELFORCHILD => 3

    /**
     * Event must be an exact match or any descendant of the fully qualified UNC path associated with the filter.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_PATHFILTER_SELFORDESCENDENT => 4
}
