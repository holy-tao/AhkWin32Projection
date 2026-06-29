#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_GDISURFACETYPE {
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
    static D3DKMDT_GDISURFACE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_TEXTURE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_STAGING_CPUVISIBLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_STAGING => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_LOOKUPTABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_EXISTINGSYSMEM => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_TEXTURE_CPUVISIBLE => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_TEXTURE_CROSSADAPTER => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_GDISURFACE_TEXTURE_CPUVISIBLE_CROSSADAPTER => 8
}
