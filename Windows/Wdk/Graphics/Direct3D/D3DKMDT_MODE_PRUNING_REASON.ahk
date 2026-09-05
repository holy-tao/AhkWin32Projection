#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_MODE_PRUNING_REASON extends Win32Enum {

    /**
     * Native name: D3DKMDT_MPR_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static MPR_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_MPR_ALLCAPS
     * @type {Integer (Int32)}
     */
    static MPR_ALLCAPS => 1

    /**
     * Native name: D3DKMDT_MPR_DESCRIPTOR_MONITOR_SOURCE_MODE
     * @type {Integer (Int32)}
     */
    static MPR_DESCRIPTOR_MONITOR_SOURCE_MODE => 2

    /**
     * Native name: D3DKMDT_MPR_DESCRIPTOR_MONITOR_FREQUENCY_RANGE
     * @type {Integer (Int32)}
     */
    static MPR_DESCRIPTOR_MONITOR_FREQUENCY_RANGE => 3

    /**
     * Native name: D3DKMDT_MPR_DESCRIPTOR_OVERRIDE_MONITOR_SOURCE_MODE
     * @type {Integer (Int32)}
     */
    static MPR_DESCRIPTOR_OVERRIDE_MONITOR_SOURCE_MODE => 4

    /**
     * Native name: D3DKMDT_MPR_DESCRIPTOR_OVERRIDE_MONITOR_FREQUENCY_RANGE
     * @type {Integer (Int32)}
     */
    static MPR_DESCRIPTOR_OVERRIDE_MONITOR_FREQUENCY_RANGE => 5

    /**
     * Native name: D3DKMDT_MPR_DEFAULT_PROFILE_MONITOR_SOURCE_MODE
     * @type {Integer (Int32)}
     */
    static MPR_DEFAULT_PROFILE_MONITOR_SOURCE_MODE => 6

    /**
     * Native name: D3DKMDT_MPR_DRIVER_RECOMMENDED_MONITOR_SOURCE_MODE
     * @type {Integer (Int32)}
     */
    static MPR_DRIVER_RECOMMENDED_MONITOR_SOURCE_MODE => 7

    /**
     * Native name: D3DKMDT_MPR_MONITOR_FREQUENCY_RANGE_OVERRIDE
     * @type {Integer (Int32)}
     */
    static MPR_MONITOR_FREQUENCY_RANGE_OVERRIDE => 8

    /**
     * Native name: D3DKMDT_MPR_CLONE_PATH_PRUNED
     * @type {Integer (Int32)}
     */
    static MPR_CLONE_PATH_PRUNED => 9

    /**
     * Native name: D3DKMDT_MPR_MAXVALID
     * @type {Integer (Int32)}
     */
    static MPR_MAXVALID => 10
}
