#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXGI_USAGE.ahk" { DXGI_USAGE }
#Import ".\DXGI_SWAP_EFFECT.ahk" { DXGI_SWAP_EFFECT }
#Import "Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\DXGI_SCALING.ahk" { DXGI_SCALING }
#Import "Common\DXGI_SAMPLE_DESC.ahk" { DXGI_SAMPLE_DESC }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "Common\DXGI_ALPHA_MODE.ahk" { DXGI_ALPHA_MODE }

/**
 * Describes a swap chain. (DXGI_SWAP_CHAIN_DESC1)
 * @remarks
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
 *      <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_FLIP_DISCARD</a> or 
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
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_SWAP_CHAIN_DESC1 {
    #StructPack 4

    /**
     * A value that describes the resolution width. If you specify the width as zero when you call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a> 
     *       method to create a swap chain, the runtime obtains the width from the output window and assigns this width value 
     *       to the swap-chain description. You can subsequently call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getdesc1">IDXGISwapChain1::GetDesc1</a> method to 
     *       retrieve the assigned width value. You cannot specify the width as zero when you call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a> 
     *       method.
     */
    Width : UInt32

    /**
     * A value that describes the resolution height. If you specify the height as zero when you call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a> 
     *       method to create a swap chain, the runtime obtains the height from the output window and assigns this height 
     *       value to the swap-chain description. You can subsequently call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getdesc1">IDXGISwapChain1::GetDesc1</a> method to 
     *       retrieve the assigned height value. You cannot specify the height as zero when you call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a> 
     *       method.
     */
    Height : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> structure that describes the 
     *       display format.
     */
    Format : DXGI_FORMAT

    /**
     * Specifies whether the full-screen display mode or the swap-chain back buffer is stereo. 
     *       <b>TRUE</b> if stereo; otherwise, <b>FALSE</b>. If you specify stereo, you 
     *       must also specify a flip-model swap chain (that is, a swap chain that has the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL</a> 
     *       value set in the <b>SwapEffect</b> member).
     */
    Stereo : BOOL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a> structure that 
     *       describes multi-sampling parameters. This member is valid only with bit-block transfer (bitblt) model swap 
     *       chains.
     */
    SampleDesc : DXGI_SAMPLE_DESC

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-usage">DXGI_USAGE</a>-typed value that describes the 
     *       surface usage and CPU access options for the back buffer. The back buffer can be used for shader input or 
     *       render-target output.
     */
    BufferUsage : DXGI_USAGE

    /**
     * A value that describes the number of buffers in the swap chain. When you create a full-screen swap chain, 
     *       you typically include the front buffer in this value.
     */
    BufferCount : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_scaling">DXGI_SCALING</a>-typed value that identifies 
     *       resize behavior if the size of the back buffer is not equal to the target output.
     */
    Scaling : DXGI_SCALING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT</a>-typed value 
     *       that describes the presentation model that is used by the swap chain and options for handling the contents of 
     *       the presentation buffer after presenting a surface. You must specify the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL</a> 
     *       value when you call the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a> 
     *       method because this method supports only <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-flip-model">flip 
     *       presentation model</a>.
     */
    SwapEffect : DXGI_SWAP_EFFECT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_alpha_mode">DXGI_ALPHA_MODE</a>-typed value that 
     *       identifies the transparency behavior of the swap-chain back buffer.
     */
    AlphaMode : DXGI_ALPHA_MODE

    /**
     * A combination of 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG</a>-typed values that are 
     *      combined by using a bitwise OR operation. The resulting value specifies options for swap-chain behavior.
     */
    Flags : UInt32

}
