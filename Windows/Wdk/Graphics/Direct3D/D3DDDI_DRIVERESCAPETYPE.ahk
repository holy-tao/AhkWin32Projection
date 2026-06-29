#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_DRIVERESCAPETYPE {
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
    static D3DDDI_DRIVERESCAPETYPE_TRANSLATEALLOCATIONHANDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_DRIVERESCAPETYPE_TRANSLATERESOURCEHANDLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_DRIVERESCAPETYPE_CPUEVENTUSAGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_DRIVERESCAPETYPE_MAX => 3
}
