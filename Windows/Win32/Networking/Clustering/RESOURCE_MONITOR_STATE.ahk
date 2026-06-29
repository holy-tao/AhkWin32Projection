#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RESOURCE_MONITOR_STATE enumeration provides a view of instrumentation activity that takes place when an application is running.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-resource_monitor_state
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct RESOURCE_MONITOR_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static RmonInitializing => 0

    /**
     * @type {Integer (Int32)}
     */
    static RmonIdle => 1

    /**
     * @type {Integer (Int32)}
     */
    static RmonStartingResource => 2

    /**
     * @type {Integer (Int32)}
     */
    static RmonInitializingResource => 3

    /**
     * @type {Integer (Int32)}
     */
    static RmonOnlineResource => 4

    /**
     * @type {Integer (Int32)}
     */
    static RmonOfflineResource => 5

    /**
     * @type {Integer (Int32)}
     */
    static RmonShutdownResource => 6

    /**
     * @type {Integer (Int32)}
     */
    static RmonDeletingResource => 7

    /**
     * @type {Integer (Int32)}
     */
    static RmonIsAlivePoll => 8

    /**
     * @type {Integer (Int32)}
     */
    static RmonLooksAlivePoll => 9

    /**
     * @type {Integer (Int32)}
     */
    static RmonArbitrateResource => 10

    /**
     * @type {Integer (Int32)}
     */
    static RmonReleaseResource => 11

    /**
     * @type {Integer (Int32)}
     */
    static RmonResourceControl => 12

    /**
     * @type {Integer (Int32)}
     */
    static RmonResourceTypeControl => 13

    /**
     * @type {Integer (Int32)}
     */
    static RmonTerminateResource => 14

    /**
     * @type {Integer (Int32)}
     */
    static RmonDeadlocked => 15
}
