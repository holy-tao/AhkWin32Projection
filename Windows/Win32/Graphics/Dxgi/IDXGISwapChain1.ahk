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
 * 
 * You can create a swap chain by 
 * calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">IDXGIFactory2::CreateSwapChainForCoreWindow</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a>. You can also create a swap chain when you call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdeviceandswapchain">D3D11CreateDeviceAndSwapChain</a>; however, you can then only access the sub-set of swap-chain functionality that the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a> interface provides.
 * 
 * <b>IDXGISwapChain1</b> provides the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-istemporarymonosupported">IsTemporaryMonoSupported</a> method that you can use to determine whether the swap chain supports "temporary mono” presentation. This type of swap chain is a stereo swap chain that can be used to present mono content.
 * 
 * 
 * <div class="alert"><b>Note</b>  Some stereo features like the advanced presentation flags are not represented by an explicit interface change.  Furthermore, the original (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>) and new (<b>IDXGISwapChain1</b>) swap chain interfaces generally have the same behavior. For information about how <b>IDXGISwapChain</b> methods are translated into <b>IDXGISwapChain1</b> methods, see the descriptions of the <b>IDXGISwapChain1</b> methods.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nn-dxgi1_2-idxgiswapchain1
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
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getdesc1
     */
    GetDesc1() {
        pDesc := DXGI_SWAP_CHAIN_DESC1()
        result := ComCall(18, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Gets a description of a full-screen swap chain.
     * @returns {DXGI_SWAP_CHAIN_FULLSCREEN_DESC} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_fullscreen_desc">DXGI_SWAP_CHAIN_FULLSCREEN_DESC</a>  structure that describes the full-screen swap chain.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getfullscreendesc
     */
    GetFullscreenDesc() {
        pDesc := DXGI_SWAP_CHAIN_FULLSCREEN_DESC()
        result := ComCall(19, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Retrieves the underlying HWND for this swap-chain object.
     * @returns {HWND} A pointer to a variable that receives the <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a> for the swap-chain object.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgiswapchain1-gethwnd
     */
    GetHwnd() {
        pHwnd := HWND()
        result := ComCall(20, this, "ptr", pHwnd, "HRESULT")
        return pHwnd
    }

    /**
     * Retrieves the underlying CoreWindow object for this swap-chain object.
     * @param {Pointer<Guid>} refiid A pointer to the globally unique identifier (GUID) of the <a href="https://docs.microsoft.com/uwp/api/Windows.UI.Core.CoreWindow">CoreWindow</a> object that is referenced by 
     *           the <i>ppUnk</i> parameter.
     * @returns {Pointer<Void>} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/uwp/api/Windows.UI.Core.CoreWindow">CoreWindow</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getcorewindow
     */
    GetCoreWindow(refiid) {
        result := ComCall(21, this, "ptr", refiid, "ptr*", &ppUnk := 0, "HRESULT")
        return ppUnk
    }

    /**
     * Presents a frame on the display screen.
     * @param {Integer} SyncInterval An integer that specifies how to synchronize presentation of a frame with the vertical blank.
     * 
     * 
     * For the bit-block transfer (bitblt) model (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_DISCARD</a>or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_SEQUENTIAL</a>), values are:
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
     * @returns {HRESULT} Possible return values include: S_OK, <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_DEVICE_REMOVED</a> , <a href="/windows/desktop/direct3ddxgi/dxgi-status">DXGI_STATUS_OCCLUDED</a>, <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_INVALID_CALL</a>, or E_OUTOFMEMORY.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1
     */
    Present1(SyncInterval, PresentFlags, pPresentParameters) {
        result := ComCall(22, this, "uint", SyncInterval, "uint", PresentFlags, "ptr", pPresentParameters, "int")
        return result
    }

    /**
     * Determines whether a swap chain supports “temporary mono.”
     * @returns {BOOL} Indicates whether to use the swap chain in temporary mono mode. <b>TRUE</b> indicates that you can use temporary-mono mode; otherwise, <b>FALSE</b>.
     * 
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>IsTemporaryMonoSupported</b> always returns FALSE because stereoscopic 3D display behavior isn’t available with the Platform Update for Windows 7. For more info about the Platform Update for Windows 7, see <a href="/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgiswapchain1-istemporarymonosupported
     */
    IsTemporaryMonoSupported() {
        result := ComCall(23, this, "int")
        return result
    }

    /**
     * Gets the output (the display monitor) to which you can restrict the contents of a present operation.
     * @returns {IDXGIOutput} A pointer to a buffer that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> interface for the restrict-to output. An application passes this pointer to <b>IDXGIOutput</b> in a call to the  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">IDXGIFactory2::CreateSwapChainForCoreWindow</a>, or  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a> method to create the swap chain.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getrestricttooutput
     */
    GetRestrictToOutput() {
        result := ComCall(24, this, "ptr*", &ppRestrictToOutput := 0, "HRESULT")
        return IDXGIOutput(ppRestrictToOutput)
    }

    /**
     * Changes the background color of the swap chain.
     * @param {Pointer<DXGI_RGBA>} pColor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-rgba">DXGI_RGBA</a> structure that specifies the background color to set.
     * @returns {HRESULT} <b>SetBackgroundColor</b> returns:
     *         <ul>
     * <li>S_OK if it successfully set the background color.</li>
     * <li>E_INVALIDARG if the <i>pColor</i> parameter is incorrect, for example, <i>pColor</i> is NULL or any of the floating-point values of the members of <a href="/windows/desktop/direct3ddxgi/dxgi-rgba">DXGI_RGBA</a> to which <i>pColor</i> points are outside the range from 0.0 through 1.0.</li>
     * <li>Possibly other error codes that are described in the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * 
     * 
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>SetBackgroundColor</b> fails with E_NOTIMPL. For more info about the Platform Update for Windows 7, see <a href="/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgiswapchain1-setbackgroundcolor
     */
    SetBackgroundColor(pColor) {
        result := ComCall(25, this, "ptr", pColor, "HRESULT")
        return result
    }

    /**
     * Retrieves the background color of the swap chain.
     * @returns {DXGI_RGBA} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-rgba">DXGI_RGBA</a> structure that receives the background color of the swap chain.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getbackgroundcolor
     */
    GetBackgroundColor() {
        pColor := DXGI_RGBA()
        result := ComCall(26, this, "ptr", pColor, "HRESULT")
        return pColor
    }

    /**
     * Sets the rotation of the back buffers for the swap chain.
     * @param {Integer} Rotation A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173065(v=vs.85)">DXGI_MODE_ROTATION</a>-typed value that specifies how to set the rotation of the back buffers for the swap chain.
     * @returns {HRESULT} <b>SetRotation</b> returns:
     *         <ul>
     * <li>S_OK if it successfully set the rotation.</li>
     * <li>DXGI_ERROR_INVALID_CALL if the swap chain is bit-block transfer (bitblt) model. The swap chain must be flip model to successfully call <b>SetRotation</b>.</li>
     * <li>Possibly other error codes that are described in the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.</li>
     * </ul>
     * 
     * 
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>SetRotation</b> fails with DXGI_ERROR_INVALID_CALL. For more info about the Platform Update for Windows 7, see <a href="/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgiswapchain1-setrotation
     */
    SetRotation(Rotation) {
        result := ComCall(27, this, "int", Rotation, "HRESULT")
        return result
    }

    /**
     * Gets the rotation of the back buffers for the swap chain.
     * @returns {Integer} A pointer to a variable that receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173065(v=vs.85)">DXGI_MODE_ROTATION</a>-typed value that specifies the rotation of the back buffers for the swap chain.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getrotation
     */
    GetRotation() {
        result := ComCall(28, this, "int*", &pRotation := 0, "HRESULT")
        return pRotation
    }
}
