#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines options for placing the cluster.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-placement_options
 * @namespace Windows.Win32.Networking.Clustering
 */
class PLACEMENT_OPTIONS extends Win32Enum {

    /**
     * Minimum value
     * Native name: PLACEMENT_OPTIONS_MIN_VALUE
     * @type {Integer (Int32)}
     */
    static MIN_VALUE => 0

    /**
     * Default value
     * Native name: PLACEMENT_OPTIONS_DEFAULT_PLACEMENT_OPTIONS
     * @type {Integer (Int32)}
     */
    static DEFAULT_PLACEMENT_OPTIONS => 0

    /**
     * Disable VM cependency
     * Native name: PLACEMENT_OPTIONS_DISABLE_CSV_VM_DEPENDENCY
     * @type {Integer (Int32)}
     */
    static DISABLE_CSV_VM_DEPENDENCY => 1

    /**
     * Consider offline VMS
     * Native name: PLACEMENT_OPTIONS_CONSIDER_OFFLINE_VMS
     * @type {Integer (Int32)}
     */
    static CONSIDER_OFFLINE_VMS => 2

    /**
     * Don't use memory
     * Native name: PLACEMENT_OPTIONS_DONT_USE_MEMORY
     * @type {Integer (Int32)}
     */
    static DONT_USE_MEMORY => 4

    /**
     * Don't use CPU
     * Native name: PLACEMENT_OPTIONS_DONT_USE_CPU
     * @type {Integer (Int32)}
     */
    static DONT_USE_CPU => 8

    /**
     * Native name: PLACEMENT_OPTIONS_DONT_USE_LOCAL_TEMP_DISK
     * @type {Integer (Int32)}
     */
    static DONT_USE_LOCAL_TEMP_DISK => 16

    /**
     * Native name: PLACEMENT_OPTIONS_DONT_RESUME_VMS_WITH_EXISTING_TEMP_DISK
     * @type {Integer (Int32)}
     */
    static DONT_RESUME_VMS_WITH_EXISTING_TEMP_DISK => 32

    /**
     * Native name: PLACEMENT_OPTIONS_SAVE_VMS_WITH_LOCAL_DISK_ON_DRAIN_OVERWRITE
     * @type {Integer (Int32)}
     */
    static SAVE_VMS_WITH_LOCAL_DISK_ON_DRAIN_OVERWRITE => 64

    /**
     * Native name: PLACEMENT_OPTIONS_DONT_RESUME_AVAILABILTY_SET_VMS_WITH_EXISTING_TEMP_DISK
     * @type {Integer (Int32)}
     */
    static DONT_RESUME_AVAILABILTY_SET_VMS_WITH_EXISTING_TEMP_DISK => 128

    /**
     * Native name: PLACEMENT_OPTIONS_SAVE_AVAILABILTY_SET_VMS_WITH_LOCAL_DISK_ON_DRAIN_OVERWRITE
     * @type {Integer (Int32)}
     */
    static SAVE_AVAILABILTY_SET_VMS_WITH_LOCAL_DISK_ON_DRAIN_OVERWRITE => 256

    /**
     * Native name: PLACEMENT_OPTIONS_AVAILABILITY_SET_DOMAIN_AFFINITY
     * @type {Integer (Int32)}
     */
    static AVAILABILITY_SET_DOMAIN_AFFINITY => 512

    /**
     * Maximum value
     * Native name: PLACEMENT_OPTIONS_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 1023
}
