#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_SYNCHRONIZATIONOBJECT_TYPE {
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
