#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how closely an event must match a filter.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_pathfilter_match
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
class OFFLINEFILES_PATHFILTER_MATCH extends Win32Enum {

    /**
     * Event must be an exact match for the fully qualified UNC path associated with the filter.
     * Native name: OFFLINEFILES_PATHFILTER_SELF
     * @type {Integer (Int32)}
     */
    static SELF => 0

    /**
     * Event must be for an immediate child of the fully qualified UNC path associated with the filter.
     * Native name: OFFLINEFILES_PATHFILTER_CHILD
     * @type {Integer (Int32)}
     */
    static CHILD => 1

    /**
     * Event can be any descendant of the fully qualified UNC path associated with the filter.
     * Native name: OFFLINEFILES_PATHFILTER_DESCENDENT
     * @type {Integer (Int32)}
     */
    static DESCENDENT => 2

    /**
     * Event must be an exact match or an immediate child of the fully qualified UNC path associated with the filter.
     * Native name: OFFLINEFILES_PATHFILTER_SELFORCHILD
     * @type {Integer (Int32)}
     */
    static SELFORCHILD => 3

    /**
     * Event must be an exact match or any descendant of the fully qualified UNC path associated with the filter.
     * Native name: OFFLINEFILES_PATHFILTER_SELFORDESCENDENT
     * @type {Integer (Int32)}
     */
    static SELFORDESCENDENT => 4
}
