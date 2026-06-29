#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_RESOURCE_PRIORITY {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_RESOURCE_PRIORITY_MINIMUM => 671088640

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_RESOURCE_PRIORITY_LOW => 1342177280

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_RESOURCE_PRIORITY_NORMAL => 2013265920

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_RESOURCE_PRIORITY_HIGH => 2684354560

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_RESOURCE_PRIORITY_MAXIMUM => 3355443200
}
