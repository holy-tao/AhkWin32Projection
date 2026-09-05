#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_SYNCHRONIZATIONOBJECT_TYPE extends Win32Enum {

    /**
     * Native name: D3DDDI_SYNCHRONIZATION_MUTEX
     * @type {Integer (Int32)}
     */
    static SYNCHRONIZATION_MUTEX => 1

    /**
     * Native name: D3DDDI_SEMAPHORE
     * @type {Integer (Int32)}
     */
    static SEMAPHORE => 2

    /**
     * Native name: D3DDDI_FENCE
     * @type {Integer (Int32)}
     */
    static FENCE => 3

    /**
     * Native name: D3DDDI_CPU_NOTIFICATION
     * @type {Integer (Int32)}
     */
    static CPU_NOTIFICATION => 4

    /**
     * Native name: D3DDDI_MONITORED_FENCE
     * @type {Integer (Int32)}
     */
    static MONITORED_FENCE => 5

    /**
     * Native name: D3DDDI_PERIODIC_MONITORED_FENCE
     * @type {Integer (Int32)}
     */
    static PERIODIC_MONITORED_FENCE => 6

    /**
     * Native name: D3DDDI_SYNCHRONIZATION_TYPE_LIMIT
     * @type {Integer (Int32)}
     */
    static SYNCHRONIZATION_TYPE_LIMIT => 7
}
