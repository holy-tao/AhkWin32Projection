#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_CLIENTHINT extends Win32Enum {

    /**
     * Native name: D3DKMT_CLIENTHINT_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: D3DKMT_CLIENTHINT_OPENGL
     * @type {Integer (Int32)}
     */
    static OPENGL => 1

    /**
     * Native name: D3DKMT_CLIENTHINT_CDD
     * @type {Integer (Int32)}
     */
    static CDD => 2

    /**
     * Native name: D3DKMT_CLIENTHINT_OPENCL
     * @type {Integer (Int32)}
     */
    static OPENCL => 3

    /**
     * Native name: D3DKMT_CLIENTHINT_VULKAN
     * @type {Integer (Int32)}
     */
    static VULKAN => 4

    /**
     * Native name: D3DKMT_CLIENTHINT_CUDA
     * @type {Integer (Int32)}
     */
    static CUDA => 5

    /**
     * Native name: D3DKMT_CLIENTHINT_RESERVED
     * @type {Integer (Int32)}
     */
    static RESERVED => 6

    /**
     * Native name: D3DKMT_CLIENTHINT_DX7
     * @type {Integer (Int32)}
     */
    static DX7 => 7

    /**
     * Native name: D3DKMT_CLIENTHINT_DX8
     * @type {Integer (Int32)}
     */
    static DX8 => 8

    /**
     * Native name: D3DKMT_CLIENTHINT_DX9
     * @type {Integer (Int32)}
     */
    static DX9 => 9

    /**
     * Native name: D3DKMT_CLIENTHINT_DX10
     * @type {Integer (Int32)}
     */
    static DX10 => 10

    /**
     * Native name: D3DKMT_CLIENTHINT_DX11
     * @type {Integer (Int32)}
     */
    static DX11 => 11

    /**
     * Native name: D3DKMT_CLIENTHINT_DX12
     * @type {Integer (Int32)}
     */
    static DX12 => 12

    /**
     * Native name: D3DKMT_CLIENTHINT_9ON12
     * @type {Integer (Int32)}
     */
    static 9ON12 => 13

    /**
     * Native name: D3DKMT_CLIENTHINT_11ON12
     * @type {Integer (Int32)}
     */
    static 11ON12 => 14

    /**
     * Native name: D3DKMT_CLIENTHINT_MFT_ENCODE
     * @type {Integer (Int32)}
     */
    static MFT_ENCODE => 15

    /**
     * Native name: D3DKMT_CLIENTHINT_GLON12
     * @type {Integer (Int32)}
     */
    static GLON12 => 16

    /**
     * Native name: D3DKMT_CLIENTHINT_CLON12
     * @type {Integer (Int32)}
     */
    static CLON12 => 17

    /**
     * Native name: D3DKMT_CLIENTHINT_DML_TENSORFLOW
     * @type {Integer (Int32)}
     */
    static DML_TENSORFLOW => 18

    /**
     * Native name: D3DKMT_CLIENTHINT_ONEAPI_LEVEL0
     * @type {Integer (Int32)}
     */
    static ONEAPI_LEVEL0 => 19

    /**
     * Native name: D3DKMT_CLIENTHINT_DML_PYTORCH
     * @type {Integer (Int32)}
     */
    static DML_PYTORCH => 20

    /**
     * Native name: D3DKMT_CLIENTHINT_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 21
}
