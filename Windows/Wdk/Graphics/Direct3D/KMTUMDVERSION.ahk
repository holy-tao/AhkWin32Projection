#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct KMTUMDVERSION {
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
    static KMTUMDVERSION_DX9 => 0

    /**
     * @type {Integer (Int32)}
     */
    static KMTUMDVERSION_DX10 => 1

    /**
     * @type {Integer (Int32)}
     */
    static KMTUMDVERSION_DX11 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KMTUMDVERSION_DX12 => 3

    /**
     * @type {Integer (Int32)}
     */
    static KMTUMDVERSION_DX12_WSA32 => 4

    /**
     * @type {Integer (Int32)}
     */
    static KMTUMDVERSION_DX12_WSA64 => 5

    /**
     * @type {Integer (Int32)}
     */
    static NUM_KMTUMDVERSIONS => 6
}
