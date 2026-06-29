#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct D3D_FORMAT_COMPONENT_INTERPRETATION {
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
    static D3DFCI_TYPELESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DFCI_FLOAT => -4

    /**
     * @type {Integer (Int32)}
     */
    static D3DFCI_SNORM => -3

    /**
     * @type {Integer (Int32)}
     */
    static D3DFCI_UNORM => -2

    /**
     * @type {Integer (Int32)}
     */
    static D3DFCI_SINT => -1

    /**
     * @type {Integer (Int32)}
     */
    static D3DFCI_UINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DFCI_UNORM_SRGB => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DFCI_BIASED_FIXED_2_8 => 3
}
