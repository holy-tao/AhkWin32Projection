#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_SWAP_CHAIN_DESC.ahk
#Include .\IDXGIOutput.ahk
#Include .\DXGI_FRAME_STATISTICS.ahk
#Include .\IDXGIDeviceSubObject.ahk

/**
 * An IDXGISwapChain interface implements one or more surfaces for storing rendered data before presenting it to an output.
 * @remarks
 * 
 * You can create a swap chain by 
 * calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">IDXGIFactory2::CreateSwapChainForCoreWindow</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a>. You can also create a swap chain when you call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdeviceandswapchain">D3D11CreateDeviceAndSwapChain</a>; however, you can then only access the sub-set of swap-chain functionality that the <b>IDXGISwapChain</b> interface provides.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgiswapchain
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGISwapChain extends IDXGIDeviceSubObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGISwapChain
     * @type {Guid}
     */
    static IID => Guid("{310d36a0-d2e7-4c0a-aa04-6a9d23b8886a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Present", "GetBuffer", "SetFullscreenState", "GetFullscreenState", "GetDesc", "ResizeBuffers", "ResizeTarget", "GetContainingOutput", "GetFrameStatistics", "GetLastPresentCount"]

    /**
     * Presents a rendered image to the user.
     * @param {Integer} SyncInterval Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An integer that specifies how to synchronize presentation of a frame with the vertical blank.
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
     * <li>1 through 4 - Synchronize presentation for at least <i>n</i> vertical blanks. </li>
     * </ul>
     * For an example that shows how sync-interval values affect a flip presentation queue, see Remarks.
     * 
     * If the update region straddles more than one output (each represented by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a>), <b>Present</b> performs the synchronization to the output that contains the largest sub-rectangle of the target window's client area.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An integer value that contains swap-chain presentation options. These options are defined by the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT</a> constants.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Possible return values include: S_OK, DXGI_ERROR_DEVICE_RESET or DXGI_ERROR_DEVICE_REMOVED (see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>), DXGI_STATUS_OCCLUDED (see <a href="/windows/desktop/direct3ddxgi/dxgi-status">DXGI_STATUS</a>), or D3DDDIERR_DEVICEREMOVED.  
     * 
     * <div class="alert"><b>Note</b>  The <b>Present</b> method can return either DXGI_ERROR_DEVICE_REMOVED or D3DDDIERR_DEVICEREMOVED if a video card has been physically removed from the computer, or a driver upgrade for the video card has occurred.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiswapchain-present
     */
    Present(SyncInterval, Flags) {
        result := ComCall(8, this, "uint", SyncInterval, "uint", Flags, "int")
        return result
    }

    /**
     * Accesses one of the swap-chain's back buffers.
     * @param {Integer} Buffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A zero-based buffer index. 
     * 
     * If the swap chain's swap effect is <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_DISCARD</a>, this method can only access the first buffer; for this situation, set the index to zero.
     * 
     * If the swap chain's swap effect is either <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_SEQUENTIAL</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL</a>, only the swap chain's zero-index buffer can be read from and written to. The swap chain's buffers with indexes greater than zero can only be read from; so if you call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiresource-getusage">IDXGIResource::GetUsage</a> method for such buffers, they have the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-usage">DXGI_USAGE_READ_ONLY</a> flag set.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The type of interface used to manipulate the buffer.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a back-buffer interface.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiswapchain-getbuffer
     */
    GetBuffer(Buffer, riid) {
        result := ComCall(9, this, "uint", Buffer, "ptr", riid, "ptr*", &ppSurface := 0, "HRESULT")
        return ppSurface
    }

    /**
     * Sets the display state to windowed or full screen.
     * @param {BOOL} Fullscreen Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A Boolean value that specifies whether to set the display state to windowed or full screen. <b>TRUE</b> for full screen, and <b>FALSE</b> for windowed.
     * @param {IDXGIOutput} pTarget Type: [in, optional] <b><a href="https://docs.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a>*</b>
     * 
     * If you pass <b>TRUE</b> to the <i>Fullscreen</i> parameter to set the display state to full screen, you can optionally set this parameter to a pointer to an <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> interface for the output target that contains the swap chain. If you set this parameter to <b>NULL</b>, DXGI will choose the output based on the swap-chain's device and the output window's placement. If you pass <b>FALSE</b> to <i>Fullscreen</i>, then you must set this parameter to <b>NULL</b>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of these values.
     * 
     * - **S_OK** if the action succeeded and the swap chain was placed in the requested state.
     * - **DXGI_ERROR_NOT_CURRENTLY_AVAILABLE** if the action failed. When this error is returned, your application can continue to run in windowed mode and try to switch to full-screen mode later. There are many reasons why a windowed-mode swap chain cannot switch to full-screen mode. Here are some examples.
     *   - The application is running over Terminal Server.
     *   - The output window is occluded.
     *   - The output window does not have keyboard focus.
     *   - Another application is already in full-screen mode.
     * - **DXGI_STATUS_MODE_CHANGE_IN_PROGRESS** is returned if a fullscreen/windowed mode transition is occurring when this API is called.
     * - Other error codes if you run out of memory or encounter another unexpected fault; these codes may be treated as hard, non-continuable errors.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiswapchain-setfullscreenstate
     */
    SetFullscreenState(Fullscreen, pTarget) {
        result := ComCall(10, this, "int", Fullscreen, "ptr", pTarget, "HRESULT")
        return result
    }

    /**
     * Get the state associated with full-screen mode.
     * @param {Pointer<BOOL>} pFullscreen Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * A pointer to a boolean whose value is either:
     * 
     * 
     * <ul>
     * <li><b>TRUE</b> if the swap chain is in full-screen mode</li>
     * <li><b>FALSE</b> if the swap chain is in windowed mode</li>
     * </ul>
     * @param {Pointer<IDXGIOutput>} ppTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a>**</b>
     * 
     * A pointer to the output target (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a>) when the mode is full screen; otherwise <b>NULL</b>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiswapchain-getfullscreenstate
     */
    GetFullscreenState(pFullscreen, ppTarget) {
        pFullscreenMarshal := pFullscreen is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pFullscreenMarshal, pFullscreen, "ptr*", ppTarget, "HRESULT")
        return result
    }

    /**
     * Get a description of the swap chain.
     * @returns {DXGI_SWAP_CHAIN_DESC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a>*</b>
     * 
     * A pointer to the swap-chain description (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a>).
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiswapchain-getdesc
     */
    GetDesc() {
        pDesc := DXGI_SWAP_CHAIN_DESC()
        result := ComCall(12, this, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Changes the swap chain's back buffer size, format, and number of buffers. This should be called when the application window is resized.
     * @param {Integer} BufferCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of buffers in the swap chain (including all back and front buffers). 
     *             This number can be different from the number of buffers with which you created the swap chain. 
     *             This number can't be greater than <b>DXGI_MAX_SWAP_CHAIN_BUFFERS</b>. 
     *             Set this number to zero to preserve the existing number of buffers in the swap chain. 
     *             You can't specify less than two buffers for the flip presentation model.
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The new width of the back buffer. 
     *             If you specify zero, DXGI will use the width of the client area of the target window. 
     *             You can't specify the width as zero if you called the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a> method to create the swap chain for a composition surface.
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The new height of the back buffer. 
     *             If you specify zero, DXGI will use the height of the client area of the target window. 
     *             You can't specify the height as zero if you called the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition">IDXGIFactory2::CreateSwapChainForComposition</a> method to create the swap chain for a composition surface.
     * @param {Integer} NewFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the new format of the back buffer. 
     *             Set this value to <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_UNKNOWN</a> to preserve the existing format of the back buffer. 
     *             The flip presentation model supports a more restricted set of formats than the bit-block transfer (bitblt) model.
     * @param {Integer} SwapChainFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG</a>-typed values that are combined by using a bitwise OR operation. 
     *             The resulting value specifies options for swap-chain behavior.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; an error code otherwise. 
     *             For a list of error codes, see <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiswapchain-resizebuffers
     */
    ResizeBuffers(BufferCount, Width, Height, NewFormat, SwapChainFlags) {
        result := ComCall(13, this, "uint", BufferCount, "uint", Width, "uint", Height, "int", NewFormat, "uint", SwapChainFlags, "HRESULT")
        return result
    }

    /**
     * Resizes the output target.
     * @param {Pointer<DXGI_MODE_DESC>} pNewTargetParameters Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a> structure that describes the mode, which specifies the new width, height, format, and refresh rate of the target. 
     *         If the format is <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_UNKNOWN</a>, <b>ResizeTarget</b> uses the existing format. We only recommend that you use <b>DXGI_FORMAT_UNKNOWN</b> when the swap chain is in full-screen 
     *         mode as this method is not thread safe.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns a code that indicates success or failure. <b>DXGI_STATUS_MODE_CHANGE_IN_PROGRESS</b> is returned if a full-screen/windowed mode transition is occurring 
     *       when this API is called. See <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> for additional DXGI error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiswapchain-resizetarget
     */
    ResizeTarget(pNewTargetParameters) {
        result := ComCall(14, this, "ptr", pNewTargetParameters, "HRESULT")
        return result
    }

    /**
     * Get the output (the display monitor) that contains the majority of the client area of the target window.
     * @returns {IDXGIOutput} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a>**</b>
     * 
     * A pointer to the output interface (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a>).
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiswapchain-getcontainingoutput
     */
    GetContainingOutput() {
        result := ComCall(15, this, "ptr*", &ppOutput := 0, "HRESULT")
        return IDXGIOutput(ppOutput)
    }

    /**
     * Gets performance statistics about the last render frame.
     * @returns {DXGI_FRAME_STATISTICS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_frame_statistics">DXGI_FRAME_STATISTICS</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_frame_statistics">DXGI_FRAME_STATISTICS</a> structure for the frame statistics.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiswapchain-getframestatistics
     */
    GetFrameStatistics() {
        pStats := DXGI_FRAME_STATISTICS()
        result := ComCall(16, this, "ptr", pStats, "HRESULT")
        return pStats
    }

    /**
     * Gets the number of times that IDXGISwapChain::Present or IDXGISwapChain1::Present1 has been called.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable that receives the number of calls.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiswapchain-getlastpresentcount
     */
    GetLastPresentCount() {
        result := ComCall(17, this, "uint*", &pLastPresentCount := 0, "HRESULT")
        return pLastPresentCount
    }
}
