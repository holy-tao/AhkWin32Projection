#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how closely an event must match a filter.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_pathfilter_match
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
export default struct OFFLINEFILES_PATHFILTER_MATCH {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
