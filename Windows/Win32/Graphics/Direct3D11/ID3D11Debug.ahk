#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Dxgi\IDXGISwapChain.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A debug interface controls debug settings, validates pipeline state and can only be used if the debug layer is turned on. (ID3D11Debug)
 * @remarks
 * This interface is obtained by querying it from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
 *           
 * 
 * For more information about the debug layer, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">Debug Layer</a>.
 *           
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11debug
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Debug extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Debug
     * @type {Guid}
     */
    static IID => Guid("{79cf2233-7536-4948-9d36-1e4692dc5760}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFeatureMask", "GetFeatureMask", "SetPresentPerRenderOpDelay", "GetPresentPerRenderOpDelay", "SetSwapChain", "GetSwapChain", "ValidateContext", "ReportLiveDeviceObjects", "ValidateContextForDispatch"]

    /**
     * Set a bit field of flags that will turn debug features on and off. (ID3D11Debug.SetFeatureMask)
     * @remarks
     * <div class="alert"><b>Note</b>  If you call this API in a Session 0 process, it returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a>.</div>
     * <div> </div>
     * Setting one of the following feature-mask flags will cause a rendering-operation method (listed below) to do some extra task when called. 
     * 
     * <table>
     * <tr>
     * <td>D3D11_DEBUG_FEATURE_FINISH_PER_RENDER_OP (0x2)</td>
     * <td>Application will wait for the GPU to finish processing the rendering operation before continuing.</td>
     * </tr>
     * <tr>
     * <td>D3D11_DEBUG_FEATURE_FLUSH_PER_RENDER_OP (0x1)</td>
     * <td>Runtime will additionally call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-flush">ID3D11DeviceContext::Flush</a>.</td>
     * </tr>
     * <tr>
     * <td>D3D11_DEBUG_FEATURE_PRESENT_PER_RENDER_OP (0x4)</td>
     * <td>Runtime will call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">IDXGISwapChain::Present</a>. Presentation of render buffers will occur according to the settings established by prior calls to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-setswapchain">ID3D11Debug::SetSwapChain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-setpresentperrenderopdelay">ID3D11Debug::SetPresentPerRenderOpDelay</a>.</td>
     * </tr>
     * </table>
     *  
     * 
     * These feature-mask flags apply to the following rendering-operation methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-draw">ID3D11DeviceContext::Draw</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawindexed">ID3D11DeviceContext::DrawIndexed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawinstanced">ID3D11DeviceContext::DrawInstanced</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawindexedinstanced">ID3D11DeviceContext::DrawIndexedInstanced</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-drawauto">ID3D11DeviceContext::DrawAuto</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-clearrendertargetview">ID3D11DeviceContext::ClearRenderTargetView</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cleardepthstencilview">ID3D11DeviceContext::ClearDepthStencilView</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copysubresourceregion">ID3D11DeviceContext::CopySubresourceRegion</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copyresource">ID3D11DeviceContext::CopyResource</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-updatesubresource">ID3D11DeviceContext::UpdateSubresource</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-generatemips">ID3D11DeviceContext::GenerateMips</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-resolvesubresource">ID3D11DeviceContext::ResolveSubresource</a>
     * </li>
     * </ul>
     * By setting one of the following feature-mask flags, you can control the behavior of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-offerresources">IDXGIDevice2::OfferResources</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-reclaimresources">IDXGIDevice2::ReclaimResources</a> methods to aid in testing and debugging. 
     * 
     * <div class="alert"><b>Note</b>  These flags are supported by the Direct3D 11.1 runtime, which is available starting with Windows 8.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <td>D3D11_DEBUG_FEATURE_ALWAYS_DISCARD_OFFERED_RESOURCE (0x8)</td>
     * <td>When you call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-offerresources">IDXGIDevice2::OfferResources</a> to offer resources while this flag is enabled, their content is always discarded.  Use this flag to test code paths that regenerate resource content on reclaim.  You cannot use this flag in combination with D3D11_DEBUG_FEATURE_NEVER_DISCARD_OFFERED_RESOURCE.</td>
     * </tr>
     * <tr>
     * <td>D3D11_DEBUG_FEATURE_NEVER_DISCARD_OFFERED_RESOURCE (0x10)</td>
     * <td>When you call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-offerresources">IDXGIDevice2::OfferResources</a> to offer resources while this flag is enabled, their content is never discarded.  Use this flag to test code paths that do not need to regenerate resource content on reclaim.  You cannot use this flag in combination with D3D11_DEBUG_FEATURE_ALWAYS_DISCARD_OFFERED_RESOURCE.</td>
     * </tr>
     * </table>
     *  
     * 
     * The behavior of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-offerresources">IDXGIDevice2::OfferResources</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgidevice2-reclaimresources">IDXGIDevice2::ReclaimResources</a> methods depends on system-wide memory pressure. Therefore, the scenario where content is lost and must be regenerated is uncommon for most applications.  The preceding new options in the Direct3D debug layer let you simulate that scenario consistently and test code paths.
     * 
     * The following flag is supported by the Direct3D 11.1 runtime.
     * 
     * <table>
     * <tr>
     * <td>D3D11_DEBUG_FEATURE_AVOID_BEHAVIOR_CHANGING_DEBUG_AIDS (0x40)</td>
     * <td>Disables the following default debugging behavior.</td>
     * </tr>
     * </table>
     *  
     * 
     * When the debug layer is enabled, it performs certain actions to reveal application problems.  By setting the D3D11_DEBUG_FEATURE_AVOID_BEHAVIOR_CHANGING_DEBUG_AIDS feature-mask flag, you can enable the debug layer without getting the following default debugging behavior:
     * 
     * <ul>
     * <li>If an application calls <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-discardview">ID3D11DeviceContext1::DiscardView</a>, the runtime fills in the resource with a random color.</li>
     * <li>If an application calls <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">IDXGISwapChain1::Present1</a> with partial presentation parameters, the runtime ignores the partial presentation information.</li>
     * </ul>
     * The following flag is supported by the Direct3D 11.2 runtime.
     * 
     * <table>
     * <tr>
     * <td>D3D11_DEBUG_FEATURE_DISABLE_TILED_RESOURCE_MAPPING_TRACKING_AND_VALIDATION (0x80)</td>
     * <td>Disables the following default debugging behavior.</td>
     * </tr>
     * </table>
     *  
     * 
     * By default (that is, without D3D11_DEBUG_FEATURE_DISABLE_TILED_RESOURCE_MAPPING_TRACKING_AND_VALIDATION set), the debug layer validates the proper usage of all tile mappings for <a href="https://docs.microsoft.com/windows/desktop/direct3d11/direct3d-11-2-features">tiled resources</a> for bound resources for every operation performed on the device context (for example, draw, copy, and so on).  Depending on the size of the tiled resources used (if any), this validation can be processor intensive and slow.  Apps might want to initially run with tiled resource tile mapping validation on; then, when they determine that the calling pattern is safe, they can disable the validation by setting D3D11_DEBUG_FEATURE_DISABLE_TILED_RESOURCE_MAPPING_TRACKING_AND_VALIDATION.
     * 
     * If D3D11_DEBUG_FEATURE_DISABLE_TILED_RESOURCE_MAPPING_TRACKING_AND_VALIDATION is set when a tiled resource is created, the debug layer never performs the tracking of tile mapping for that resource for its entire lifetime.  Alternatively, if D3D11_DEBUG_FEATURE_DISABLE_TILED_RESOURCE_MAPPING_TRACKING_AND_VALIDATION is set for any given device context method call (like draw or copy calls) involving tiled resources, the debug layer skips all tile mapping validation for the call.
     * @param {Integer} Mask Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A combination of feature-mask flags that are combined by using a bitwise OR operation. If a flag is present, that feature will be set to on, otherwise the feature will be set to off. For descriptions of the feature-mask flags, see Remarks.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-setfeaturemask
     */
    SetFeatureMask(Mask) {
        result := ComCall(3, this, "uint", Mask, "HRESULT")
        return result
    }

    /**
     * Get a bitfield of flags that indicates which debug features are on or off. (ID3D11Debug.GetFeatureMask)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Mask of feature-mask flags bitwise ORed together. If a flag is present, then that feature will be set to on, otherwise the feature will be set to off. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-setfeaturemask">ID3D11Debug::SetFeatureMask</a> for a list of possible feature-mask flags.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-getfeaturemask
     */
    GetFeatureMask() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * Set the number of milliseconds to sleep after IDXGISwapChain::Present is called.
     * @remarks
     * <div class="alert"><b>Note</b>  If you call this API in a Session 0 process, it returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a>.</div>
     * <div> </div>
     * The application will only sleep if D3D11_DEBUG_FEATURE_PRESENT_PER_RENDER_OP is a set in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-setfeaturemask">feature mask</a>. If that flag is not set the number of milliseconds is set but ignored and the application does not sleep. 10ms is used as a default value if this method is never called.
     * @param {Integer} Milliseconds Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of milliseconds to sleep after Present is called.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-setpresentperrenderopdelay
     */
    SetPresentPerRenderOpDelay(Milliseconds) {
        result := ComCall(5, this, "uint", Milliseconds, "HRESULT")
        return result
    }

    /**
     * Get the number of milliseconds to sleep after IDXGISwapChain::Present is called.
     * @remarks
     * Value is set with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-setpresentperrenderopdelay">ID3D11Debug::SetPresentPerRenderOpDelay</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of milliseconds to sleep after Present is called.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-getpresentperrenderopdelay
     */
    GetPresentPerRenderOpDelay() {
        result := ComCall(6, this, "uint")
        return result
    }

    /**
     * Sets a swap chain that the runtime will use for automatically calling IDXGISwapChain::Present.
     * @remarks
     * <div class="alert"><b>Note</b>  If you call this API in a Session 0 process, it returns <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NOT_CURRENTLY_AVAILABLE</a>.</div>
     * <div> </div>
     * The swap chain set by this method will only be used if D3D11_DEBUG_FEATURE_PRESENT_PER_RENDER_OP is set in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-setfeaturemask">feature mask</a>.
     * @param {IDXGISwapChain} pSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>*</b>
     * 
     * Swap chain that the runtime will use for automatically calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">IDXGISwapChain::Present</a>; must have been created with the DXGI_SWAP_EFFECT_SEQUENTIAL swap-effect flag.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-setswapchain
     */
    SetSwapChain(pSwapChain) {
        result := ComCall(7, this, "ptr", pSwapChain, "HRESULT")
        return result
    }

    /**
     * Get the swap chain that the runtime will use for automatically calling IDXGISwapChain::Present.
     * @remarks
     * The swap chain retrieved by this method will only be used if D3D11_DEBUG_FEATURE_PRESENT_PER_RENDER_OP is set in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-setfeaturemask">feature mask</a>.
     * @returns {IDXGISwapChain} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>**</b>
     * 
     * Swap chain that the runtime will use for automatically calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-present">IDXGISwapChain::Present</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-getswapchain
     */
    GetSwapChain() {
        result := ComCall(8, this, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain(ppSwapChain)
    }

    /**
     * Check to see if the draw pipeline state is valid.
     * @remarks
     * Use validate prior to calling a draw method (for example, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-draw">ID3D11DeviceContext::Draw</a>); validation requires the debug layer.
     * @param {ID3D11DeviceContext} pContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>, that represents a device context.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-validatecontext
     */
    ValidateContext(pContext) {
        result := ComCall(9, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * Report information about a device object's lifetime.
     * @remarks
     * <b>ReportLiveDeviceObjects</b> uses the value in  <i>Flags</i> to determine the amount of information to report about a device object's lifetime.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_rldo_flags">D3D11_RLDO_FLAGS</a></b>
     * 
     * A value from the
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_rldo_flags">D3D11_RLDO_FLAGS</a> enumeration.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-reportlivedeviceobjects
     */
    ReportLiveDeviceObjects(Flags) {
        result := ComCall(10, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * Verifies whether the dispatch pipeline state is valid.
     * @remarks
     * Use this method before you call a dispatch method (for example, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-dispatch">ID3D11DeviceContext::Dispatch</a>). Validation requires the debug layer.
     * @param {ID3D11DeviceContext} pContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> that represents a device context.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the return codes described in the topic <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-validatecontextfordispatch
     */
    ValidateContextForDispatch(pContext) {
        result := ComCall(11, this, "ptr", pContext, "HRESULT")
        return result
    }
}
