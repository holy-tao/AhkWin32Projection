#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_MONITOR_CAPABILITIES_ORIGIN {
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
    static D3DKMDT_MCO_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MCO_DEFAULTMONITORPROFILE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MCO_MONITORDESCRIPTOR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MCO_MONITORDESCRIPTOR_REGISTRYOVERRIDE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MCO_SPECIFICCAP_REGISTRYOVERRIDE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MCO_DRIVER => 5
}
