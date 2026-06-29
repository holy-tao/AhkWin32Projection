#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Values that identify the intended use of constant-buffer data.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_cbuffer_type
 * @namespace Windows.Win32.Graphics.Direct3D
 */
export default struct D3D_CBUFFER_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A buffer containing scalar constants.
     * @type {Integer (Int32)}
     */
    static D3D_CT_CBUFFER => 0

    /**
     * A buffer containing texture data.
     * @type {Integer (Int32)}
     */
    static D3D_CT_TBUFFER => 1

    /**
     * A buffer containing interface pointers.
     * @type {Integer (Int32)}
     */
    static D3D_CT_INTERFACE_POINTERS => 2

    /**
     * A buffer containing binding information.
     * @type {Integer (Int32)}
     */
    static D3D_CT_RESOURCE_BIND_INFO => 3

    /**
     * A buffer containing scalar constants.
     * @type {Integer (Int32)}
     */
    static D3D10_CT_CBUFFER => 0

    /**
     * A buffer containing texture data.
     * @type {Integer (Int32)}
     */
    static D3D10_CT_TBUFFER => 1

    /**
     * A buffer containing scalar constants.
     * @type {Integer (Int32)}
     */
    static D3D11_CT_CBUFFER => 0

    /**
     * A buffer containing texture data.
     * @type {Integer (Int32)}
     */
    static D3D11_CT_TBUFFER => 1

    /**
     * A buffer containing interface pointers.
     * @type {Integer (Int32)}
     */
    static D3D11_CT_INTERFACE_POINTERS => 2

    /**
     * A buffer containing binding information.
     * @type {Integer (Int32)}
     */
    static D3D11_CT_RESOURCE_BIND_INFO => 3
}
