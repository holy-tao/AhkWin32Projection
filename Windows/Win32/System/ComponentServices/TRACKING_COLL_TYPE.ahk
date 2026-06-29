#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the type of objects in a tracking information collection.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ne-comsvcs-tracking_coll_type
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct TRACKING_COLL_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The objects in the referenced tracking information collections are processes.
     * @type {Integer (Int32)}
     */
    static TRKCOLL_PROCESSES => 0

    /**
     * The objects in the referenced tracking information collections are applications.
     * @type {Integer (Int32)}
     */
    static TRKCOLL_APPLICATIONS => 1

    /**
     * The objects in the referenced tracking information collections are components.
     * @type {Integer (Int32)}
     */
    static TRKCOLL_COMPONENTS => 2
}
