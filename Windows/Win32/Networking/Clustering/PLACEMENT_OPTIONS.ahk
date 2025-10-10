#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines options for placing the cluster.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ne-clusapi-placement_options
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PLACEMENT_OPTIONS{

    /**
     * Minimum value
     * @type {Integer (Int32)}
     */
    static PLACEMENT_OPTIONS_MIN_VALUE => 0

    /**
     * Default value
     * @type {Integer (Int32)}
     */
    static PLACEMENT_OPTIONS_DEFAULT_PLACEMENT_OPTIONS => 0

    /**
     * Disable VM cependency
     * @type {Integer (Int32)}
     */
    static PLACEMENT_OPTIONS_DISABLE_CSV_VM_DEPENDENCY => 1

    /**
     * Consider offline VMS
     * @type {Integer (Int32)}
     */
    static PLACEMENT_OPTIONS_CONSIDER_OFFLINE_VMS => 2

    /**
     * Don't use memory
     * @type {Integer (Int32)}
     */
    static PLACEMENT_OPTIONS_DONT_USE_MEMORY => 4

    /**
     * Don't use CPU
     * @type {Integer (Int32)}
     */
    static PLACEMENT_OPTIONS_DONT_USE_CPU => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PLACEMENT_OPTIONS_DONT_USE_LOCAL_TEMP_DISK => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PLACEMENT_OPTIONS_DONT_RESUME_VMS_WITH_EXISTING_TEMP_DISK => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PLACEMENT_OPTIONS_SAVE_VMS_WITH_LOCAL_DISK_ON_DRAIN_OVERWRITE => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PLACEMENT_OPTIONS_DONT_RESUME_AVAILABILTY_SET_VMS_WITH_EXISTING_TEMP_DISK => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PLACEMENT_OPTIONS_SAVE_AVAILABILTY_SET_VMS_WITH_LOCAL_DISK_ON_DRAIN_OVERWRITE => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PLACEMENT_OPTIONS_AVAILABILITY_SET_DOMAIN_AFFINITY => 512

    /**
     * Maximum value
     * @type {Integer (Int32)}
     */
    static PLACEMENT_OPTIONS_ALL => 1023
}
