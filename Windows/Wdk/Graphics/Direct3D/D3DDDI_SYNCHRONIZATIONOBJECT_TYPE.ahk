#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_SYNCHRONIZATIONOBJECT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_SYNCHRONIZATION_MUTEX => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_SEMAPHORE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_FENCE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_CPU_NOTIFICATION => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_MONITORED_FENCE => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_PERIODIC_MONITORED_FENCE => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_SYNCHRONIZATION_TYPE_LIMIT => 7
}
