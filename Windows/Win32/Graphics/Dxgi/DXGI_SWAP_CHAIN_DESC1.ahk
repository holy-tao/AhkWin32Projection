#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\DXGI_SAMPLE_DESC.ahk

/**
 * Describes a swap chain.
 * @remarks
 * 
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">CreateSwapChainForHwnd</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">CreateSwapChainForCoreWindow</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">CreateSwapChainForComposition</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nf-dxgi1_3-idxgifactorymedia-createswapchainforcompositionsurfacehandle">CreateSwapChainForCompositionSurfaceHandle</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getdesc1">GetDesc1</a> methods.
 * 
 * <div class="alert"><b>Note</b>  You cannot cast a 
 *      <b>DXGI_SWAP_CHAIN_DESC1</b> to a 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a> and vice versa. An 
 *      application must explicitly use the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getdesc1">IDXGISwapChain1::GetDesc1</a> method to 
 *      retrieve the newer version of the swap-chain description structure.</div>
 * <div> </div>
 * In full-screen mode, there is a dedicated front buffer; in windowed mode, the desktop is the front buffer.
 * 
 * For a <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-flip-model">flip-model</a> swap chain (that is, a swap 
 *      chain that has the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL</a> 
 *      value set in the <b>SwapEffect</b> member), you must set the 
 *      <b>Format</b> member to 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R16G16B16A16_FLOAT</a>, 
 *      <b>DXGI_FORMAT_B8G8R8A8_UNORM</b>, or 
 *      <b>DXGI_FORMAT_R8G8B8A8_UNORM</b>; you must set the 
 *      <b>Count</b> member of the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a> structure that the 
 *      <b>SampleDesc</b> member specifies to one and the <b>Quality</b> member 
 *      of <b>DXGI_SAMPLE_DESC</b> to zero because multiple 
 *      sample antialiasing (MSAA) is not supported; you must set the <b>BufferCount</b> member to 
 *      from two to sixteen. For more info about flip-model swap chain, see 
 *      DXGI Flip Model.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_SWAP_CHAIN_DESC1 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A value that describes the resolution width. If you specify the width as zero when you call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a> 
     *       method to create a swap chain, the runtime obtains the width from the output window and assigns this width value 
     *       to the swap-chain description. You can subsequently call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getdesc1">IDXGISwapChain1::GetDesc1</a> method to 
     *       retrieve the assigned width value. You cannot specify the width as zero when you call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a> 
     *       method.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that describes the resolution height. If you specify the height as zero when you call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a> 
     *       method to create a swap chain, the runtime obtains the height from the output window and assigns this height 
     *       value to the swap-chain description. You can subsequently call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getdesc1">IDXGISwapChain1::GetDesc1</a> method to 
     *       retrieve the assigned height value. You cannot specify the height as zero when you call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a> 
     *       method.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> structure that describes the 
     *       display format.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Specifies whether the full-screen display mode or the swap-chain back buffer is stereo. 
     *       <b>TRUE</b> if stereo; otherwise, <b>FALSE</b>. If you specify stereo, you 
     *       must also specify a flip-model swap chain (that is, a swap chain that has the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL</a> 
     *       value set in the <b>SwapEffect</b> member).
     * @type {BOOL}
     */
    Stereo {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a> structure that 
     *       describes multi-sampling parameters. This member is valid only with bit-block transfer (bitblt) model swap 
     *       chains.
     * @type {DXGI_SAMPLE_DESC}
     */
    SampleDesc{
        get {
            if(!this.HasProp("__SampleDesc"))
                this.__SampleDesc := DXGI_SAMPLE_DESC(16, this)
            return this.__SampleDesc
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-usage">DXGI_USAGE</a>-typed value that describes the 
     *       surface usage and CPU access options for the back buffer. The back buffer can be used for shader input or 
     *       render-target output.
     * @type {Integer}
     */
    BufferUsage {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A value that describes the number of buffers in the swap chain. When you create a full-screen swap chain, 
     *       you typically include the front buffer in this value.
     * @type {Integer}
     */
    BufferCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_scaling">DXGI_SCALING</a>-typed value that identifies 
     *       resize behavior if the size of the back buffer is not equal to the target output.
     * @type {Integer}
     */
    Scaling {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT</a>-typed value 
     *       that describes the presentation model that is used by the swap chain and options for handling the contents of 
     *       the presentation buffer after presenting a surface. You must specify the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL</a> 
     *       value when you call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a> 
     *       method because this method supports only <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-flip-model">flip 
     *       presentation model</a>.
     * @type {Integer}
     */
    SwapEffect {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_alpha_mode">DXGI_ALPHA_MODE</a>-typed value that 
     *       identifies the transparency behavior of the swap-chain back buffer.
     * @type {Integer}
     */
    AlphaMode {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * A combination of 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG</a>-typed values that are 
     *      combined by using a bitwise OR operation. The resulting value specifies options for swap-chain behavior.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
