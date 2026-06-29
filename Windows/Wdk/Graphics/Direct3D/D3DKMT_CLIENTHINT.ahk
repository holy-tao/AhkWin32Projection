#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CLIENTHINT {
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
    static D3DKMT_CLIENTHINT_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_OPENGL => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_CDD => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_OPENCL => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_VULKAN => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_CUDA => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_RESERVED => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_DX7 => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_DX8 => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_DX9 => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_DX10 => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_DX11 => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_DX12 => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_9ON12 => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_11ON12 => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_MFT_ENCODE => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_GLON12 => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_CLON12 => 17

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_DML_TENSORFLOW => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_ONEAPI_LEVEL0 => 19

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_DML_PYTORCH => 20

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_CLIENTHINT_MAX => 21
}
