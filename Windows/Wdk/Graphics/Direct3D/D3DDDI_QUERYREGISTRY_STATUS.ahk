#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_QUERYREGISTRY_STATUS {
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
    static D3DDDI_QUERYREGISTRY_STATUS_SUCCESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_QUERYREGISTRY_STATUS_BUFFER_OVERFLOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_QUERYREGISTRY_STATUS_FAIL => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_QUERYREGISTRY_STATUS_MAX => 3
}
