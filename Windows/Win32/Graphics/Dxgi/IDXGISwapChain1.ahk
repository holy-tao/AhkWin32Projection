#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_SWAP_CHAIN_DESC1.ahk
#Include .\DXGI_SWAP_CHAIN_FULLSCREEN_DESC.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\IDXGIOutput.ahk
#Include .\DXGI_RGBA.ahk
#Include .\IDXGISwapChain.ahk

/**
 * Provides presentation capabilities that are enhanced from IDXGISwapChain. These presentation capabilities consist of specifying dirty rectangles and scroll rectangle to optimize the presentation.
 * @remarks
 * You can create a swap chain by 
 * calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">IDXGIFactory2::CreateSwapChainForCoreWindow</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a>. You can also create a swap chain when you call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdeviceandswapchain">D3D11CreateDeviceAndSwapChain</a>; however, you can then only access the sub-set of swap-chain functionality that the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a> interface provides.
 * 
 * <b>IDXGISwapChain1</b> provides the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-istemporarymonosupported">IsTemporaryMonoSupported</a> method that you can use to determine whether the swap chain supports "temporary mono” presentation. This type of swap chain is a stereo swap chain that can be used to present mono content.
 * 
 * 
 * <div class="alert"><b>Note</b>  Some stereo features like the advanced presentation flags are not represented by an explicit interface change.  Furthermore, the original (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>) and new (<b>IDXGISwapChain1</b>) swap chain interfaces generally have the same behavior. For information about how <b>IDXGISwapChain</b> methods are translated into <b>IDXGISwapChain1</b> methods, see the descriptions of the <b>IDXGISwapChain1</b> methods.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgiswapchain1
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGISwapChain1 extends IDXGISwapChain{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGISwapChain1
     * @type {Guid}
     */
    static IID => Guid("{790a45f7-0d42-4876-983a-0a55cfe6f4aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc1", "GetFullscreenDesc", "GetHwnd", "GetCoreWindow", "Present1", "IsTemporaryMonoSupported", "GetRestrictToOutput", "SetBackgroundColor", "GetBackgroundColor", "SetRotation", "GetRotation"]

    /**
     * Gets a description of the swap chain.
     * @returns {DXGI_SWAP_CHAIN_DESC1} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a>  structure that describes the swap chain.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getdesc1
     */
    GetDesc1() {
        pDesc := DXGI_SWAP_CHAIN_DESC1()
        result := ComCall(18, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets a description of a full-screen swap chain.
     * @remarks
     * The semantics of <b>GetFullscreenDesc</b> are identical to that of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-getdesc">IDXGISwapchain::GetDesc</a> method for <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a>-based swap chains.
     * @returns {DXGI_SWAP_CHAIN_FULLSCREEN_DESC} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_fullscreen_desc">DXGI_SWAP_CHAIN_FULLSCREEN_DESC</a>  structure that describes the full-screen swap chain.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getfullscreendesc
     */
    GetFullscreenDesc() {
        pDesc := DXGI_SWAP_CHAIN_FULLSCREEN_DESC()
        result := ComCall(19, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Retrieves the underlying HWND for this swap-chain object.
     * @remarks
     * Applications call the  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a> method to create a swap chain that is associated with an <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a>.
     * @returns {HWND} A pointer to a variable that receives the <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a> for the swap-chain object.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-gethwnd
     */
    GetHwnd() {
        pHwnd := HWND()
        result := ComCall(20, this, "ptr", pHwnd, "HRESULT")
        return pHwnd
    }

    /**
     * Retrieves the underlying CoreWindow object for this swap-chain object.
     * @remarks
     * Applications call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">IDXGIFactory2::CreateSwapChainForCoreWindow</a> method to create a swap chain that is associated with an <a href="https://docs.microsoft.com/uwp/api/Windows.UI.Core.CoreWindow">CoreWindow</a> object.
     * @param {Pointer<Guid>} refiid A pointer to the globally unique identifier (GUID) of the <a href="https://docs.microsoft.com/uwp/api/Windows.UI.Core.CoreWindow">CoreWindow</a> object that is referenced by 
     *           the <i>ppUnk</i> parameter.
     * @returns {Pointer<Void>} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/uwp/api/Windows.UI.Core.CoreWindow">CoreWindow</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getcorewindow
     */
    GetCoreWindow(refiid) {
        result := ComCall(21, this, "ptr", refiid, "ptr*", &ppUnk := 0, "HRESULT")
        return ppUnk
    }

    /**
     * Presents a frame on the display screen.
     * @remarks
     * An app can use <b>Present1</b> to optimize presentation by specifying scroll and dirty rectangles. When the runtime has information about these rectangles, the runtime can then perform necessary bitblts during presentation more efficiently and pass this metadata to the Desktop Window Manager (DWM). The DWM can then use the metadata to optimize presentation and pass the metadata to indirect displays and terminal servers to optimize traffic over the wire. An app must confine its modifications to only the dirty regions that it passes to <b>Present1</b>, as well as modify the entire dirty region to avoid undefined resource contents from being exposed.
     * 
     * For flip presentation model swap chains that you create with the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL</a> value set, a successful presentation results in an unbind of back buffer 0 from the graphics pipeline, except for when you pass the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT_DO_NOT_SEQUENCE</a> flag in the <i>Flags</i> parameter.
     * 
     * For info about how data values change when you present content to the screen, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/converting-data-color-space">Converting data for the color space</a>.
     * 
     * For info about calling <b>Present1</b> when your app uses multiple threads, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/d3d10-graphics-programming-guide-dxgi">Multithread Considerations</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-render-multi-thread-intro">Multithreading and DXGI</a>.
     * 
     * <h3><a id="Flip_presentation_model_queue"></a><a id="flip_presentation_model_queue"></a><a id="FLIP_PRESENTATION_MODEL_QUEUE"></a>Flip presentation model queue</h3>
     * Suppose the following frames with sync-interval values are queued from oldest (A) to newest (E) before you call <b>Present1</b>.
     * 
     * A: 3, B: 0, C: 0, D: 1, E: 0
     * 
     * When you call <b>Present1</b>, the runtime shows frame A for only 1 vertical blank interval. The runtime terminates frame A early because of the sync interval 0 in frame B.   Then the runtime shows frame D for 1 vertical blank interval, and then frame E until you submit a new presentation. The runtime discards frames B and C.
     * 
     * 
     * <h3><a id="Variable_refresh_rate_displays"></a><a id="variable_refresh_rate_displays"></a><a id="VARIABLE_REFRESH_RATE_DISPLAYS"></a>Variable refresh rate displays</h3>
     * It is a requirement of variable refresh rate displays that tearing is enabled. The <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/nf-dxgi1_5-idxgifactory5-checkfeaturesupport">CheckFeatureSupport</a> method can be used to determine if this feature is available, and to set the required flags refer to the descriptions of <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT_ALLOW_TEARING</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG_ALLOW_TEARING</a>, and the <b>Variable refresh rate displays/Vsync off</b> section of <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-1-5-improvements">DXGI 1.5 Improvements</a>.
     * @param {Integer} SyncInterval An integer that specifies how to synchronize presentation of a frame with the vertical blank.
     * 
     * 
     * For the bit-block transfer (bitblt) model (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_DISCARD</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_SEQUENTIAL</a>), values are:
     * 
     * <ul>
     * <li>0 - The presentation occurs immediately, there is no synchronization.</li>
     * <li>1 through 4 - Synchronize presentation after the <i>n</i>th vertical blank.</li>
     * </ul>
     * For the flip model (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL</a>), values are:
     * 
     * <ul>
     * <li>0 - Cancel the remaining time on the previously presented frame and discard this frame if a newer frame is queued.
     * </li>
     * <li>1 through 4 - Synchronize presentation for at least <i>n</i> vertical blanks.</li>
     * </ul>
     * For an example that shows how sync-interval values affect a flip presentation queue, see Remarks.
     * 
     * If the update region straddles more than one output (each represented by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutput1">IDXGIOutput1</a>), <b>Present1</b> performs the synchronization to the output that contains the largest sub-rectangle of the target window's client area.
     * @param {Integer} PresentFlags An integer value that contains swap-chain presentation options. These options are defined by the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT</a> constants.
     * @param {Pointer<DXGI_PRESENT_PARAMETERS>} pPresentParameters A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_present_parameters">DXGI_PRESENT_PARAMETERS</a> structure that describes updated rectangles and scroll information of the frame to present.
     * @returns {HRESULT} Possible return values include: S_OK, <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_DEVICE_REMOVED</a> , <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-status">DXGI_STATUS_OCCLUDED</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_INVALID_CALL</a>, or E_OUTOFMEMORY.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1
     */
    Present1(SyncInterval, PresentFlags, pPresentParameters) {
        result := ComCall(22, this, "uint", SyncInterval, "uint", PresentFlags, "ptr", pPresentParameters, "int")
        return result
    }

    /**
     * Determines whether a swap chain supports “temporary mono.”
     * @remarks
     * Temporary mono is a feature where a stereo swap chain can be presented using only the content in the left buffer.  To present using the left buffer as a mono buffer, an application calls the  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">IDXGISwapChain1::Present1</a> method with the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT_STEREO_TEMPORARY_MONO</a> 
     * flag.  All windowed swap chains support temporary mono. However, full-screen swap chains optionally support temporary mono because not all hardware supports temporary mono on full-screen swap chains efficiently.
     * @returns {BOOL} Indicates whether to use the swap chain in temporary mono mode. <b>TRUE</b> indicates that you can use temporary-mono mode; otherwise, <b>FALSE</b>.
     * 
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>IsTemporaryMonoSupported</b> always returns FALSE because stereoscopic 3D display behavior isn’t available with the Platform Update for Windows 7. For more info about the Platform Update for Windows 7, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-istemporarymonosupported
     */
    IsTemporaryMonoSupported() {
        result := ComCall(23, this, "int")
        return result
    }

    /**
     * Gets the output (the display monitor) to which you can restrict the contents of a present operation.
     * @remarks
     * If the method succeeds, the runtime fills the buffer at <i>ppRestrictToOutput</i> with a pointer to the restrict-to output interface. This restrict-to output interface has its reference count incremented. When you are finished with it, be sure to release the interface to avoid a memory leak.
     * 
     * The output is also owned by the adapter on which the swap chain's device was created.
     * @returns {IDXGIOutput} A pointer to a buffer that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> interface for the restrict-to output. An application passes this pointer to <b>IDXGIOutput</b> in a call to the  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">IDXGIFactory2::CreateSwapChainForCoreWindow</a>, or  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a> method to create the swap chain.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getrestricttooutput
     */
    GetRestrictToOutput() {
        result := ComCall(24, this, "ptr*", &ppRestrictToOutput := 0, "HRESULT")
        return IDXGIOutput(ppRestrictToOutput)
    }

    /**
     * Changes the background color of the swap chain.
     * @remarks
     * The background color affects only swap chains that you create with <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_scaling">DXGI_SCALING_NONE</a> in windowed mode. You pass this value in a call to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">IDXGIFactory2::CreateSwapChainForCoreWindow</a>, or  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a>. Typically, the background color is not visible unless the swap-chain contents are smaller than the destination window.
     * 
     * When you set the background color, it is not immediately realized. It takes effect in conjunction with your next call to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">IDXGISwapChain1::Present1</a> method. The <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT</a> flags that you pass to <b>IDXGISwapChain1::Present1</b> can help achieve the effect that you require. For example, if you call <b>SetBackgroundColor</b> and then call <b>IDXGISwapChain1::Present1</b> with the <i>Flags</i> parameter set to <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT_DO_NOT_SEQUENCE</a>, you change only the background color without changing the displayed contents of the swap chain.
     * 
     * When you call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">IDXGISwapChain1::Present1</a> method to display contents of the swap chain, <b>IDXGISwapChain1::Present1</b> uses the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_alpha_mode">DXGI_ALPHA_MODE</a> value that is specified in the <b>AlphaMode</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a> structure to determine how to handle the <b>a</b> member of the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-rgba">DXGI_RGBA</a> structure, the alpha value of the background color, that achieves window transparency. For example, if <b>AlphaMode</b> is <b>DXGI_ALPHA_MODE_IGNORE</b>, <b>IDXGISwapChain1::Present1</b> ignores the a member of <b>DXGI_RGBA</b>.
     * 
     * <div class="alert"><b>Note</b>  Like all presentation data, we recommend that you perform floating point operations in a linear color space. When the desktop is in a fixed bit color depth mode, the operating system converts linear color data to standard RGB data (sRGB, gamma 2.2 corrected space) to compose to the screen. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/converting-data-color-space">Converting data for the color space</a>.</div>
     * <div> </div>
     * @param {Pointer<DXGI_RGBA>} pColor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-rgba">DXGI_RGBA</a> structure that specifies the background color to set.
     * @returns {HRESULT} <b>SetBackgroundColor</b> returns:
     *         <ul>
     * <li>S_OK if it successfully set the background color.</li>
     * <li>E_INVALIDARG if the <i>pColor</i> parameter is incorrect, for example, <i>pColor</i> is NULL or any of the floating-point values of the members of <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-rgba">DXGI_RGBA</a> to which <i>pColor</i> points are outside the range from 0.0 through 1.0.</li>
     * <li>Possibly other error codes that are described in the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * 
     * 
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>SetBackgroundColor</b> fails with E_NOTIMPL. For more info about the Platform Update for Windows 7, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-setbackgroundcolor
     */
    SetBackgroundColor(pColor) {
        result := ComCall(25, this, "ptr", pColor, "HRESULT")
        return result
    }

    /**
     * Retrieves the background color of the swap chain.
     * @remarks
     * <div class="alert"><b>Note</b>  The background color that <b>GetBackgroundColor</b> retrieves does not indicate what the screen currently displays. The background color indicates what the screen will display with your next call to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">IDXGISwapChain1::Present1</a> method. The default value of the background color is black with full opacity: 0,0,0,1.</div>
     * <div> </div>
     * @returns {DXGI_RGBA} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-rgba">DXGI_RGBA</a> structure that receives the background color of the swap chain.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getbackgroundcolor
     */
    GetBackgroundColor() {
        pColor := DXGI_RGBA()
        result := ComCall(26, this, "ptr", pColor, "HRESULT")
        return pColor
    }

    /**
     * Sets the rotation of the back buffers for the swap chain.
     * @remarks
     * You can only use <b>SetRotation</b> to rotate the back buffers for flip-model swap chains that you present in windowed mode. 
     * 
     * <b>SetRotation</b> isn't supported for rotating the back buffers for flip-model swap chains that you present in full-screen mode. In this situation, <b>SetRotation</b> doesn't fail, but you must ensure that you specify no rotation (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173065(v=vs.85)">DXGI_MODE_ROTATION_IDENTITY</a>) for the swap chain. Otherwise, when you call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">IDXGISwapChain1::Present1</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">IDXGISwapChain::Present</a> to present a frame,  the presentation fails.
     * @param {Integer} Rotation A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173065(v=vs.85)">DXGI_MODE_ROTATION</a>-typed value that specifies how to set the rotation of the back buffers for the swap chain.
     * @returns {HRESULT} <b>SetRotation</b> returns:
     *         <ul>
     * <li>S_OK if it successfully set the rotation.</li>
     * <li>DXGI_ERROR_INVALID_CALL if the swap chain is bit-block transfer (bitblt) model. The swap chain must be flip model to successfully call <b>SetRotation</b>.</li>
     * <li>Possibly other error codes that are described in the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * 
     * 
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>SetRotation</b> fails with DXGI_ERROR_INVALID_CALL. For more info about the Platform Update for Windows 7, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-setrotation
     */
    SetRotation(Rotation) {
        result := ComCall(27, this, "int", Rotation, "HRESULT")
        return result
    }

    /**
     * Gets the rotation of the back buffers for the swap chain.
     * @returns {Integer} A pointer to a variable that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173065(v=vs.85)">DXGI_MODE_ROTATION</a>-typed value that specifies the rotation of the back buffers for the swap chain.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getrotation
     */
    GetRotation() {
        result := ComCall(28, this, "int*", &pRotation := 0, "HRESULT")
        return pRotation
    }
}
