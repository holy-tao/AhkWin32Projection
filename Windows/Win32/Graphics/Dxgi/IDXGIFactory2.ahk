#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDXGIFactory1.ahk" { IDXGIFactory1 }
#Import ".\DXGI_SWAP_CHAIN_FULLSCREEN_DESC.ahk" { DXGI_SWAP_CHAIN_FULLSCREEN_DESC }
#Import ".\DXGI_SWAP_CHAIN_DESC1.ahk" { DXGI_SWAP_CHAIN_DESC1 }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDXGIOutput.ahk" { IDXGIOutput }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDXGISwapChain1.ahk" { IDXGISwapChain1 }

/**
 * The IDXGIFactory2 interface includes methods to create a newer version swap chain with more features than IDXGISwapChain and to monitor stereoscopic 3D capabilities.
 * @remarks
 * To create a Microsoft DirectX Graphics Infrastructure (DXGI) 1.2 factory interface, pass <b>IDXGIFactory2</b> into either the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-createdxgifactory">CreateDXGIFactory</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-createdxgifactory1">CreateDXGIFactory1</a> function or call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> from a factory object that either <b>CreateDXGIFactory</b> or <b>CreateDXGIFactory1</b> returns.
 * 
 * 
 * Because you can create a Direct3D device without creating a swap chain, you might need to retrieve the factory that is used to create the device in order to create a swap chain.
 * You can request the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice1">IDXGIDevice1</a>, or  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgidevice2">IDXGIDevice2</a> interface from the Direct3D device and then use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiobject-getparent">IDXGIObject::GetParent</a> method to locate 
 * the factory.  The following code shows how.
 * 
 * 
 * ```
 * IDXGIDevice2 * pDXGIDevice;
 * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice2), (void **)&pDXGIDevice);
 *       
 * IDXGIAdapter * pDXGIAdapter;
 * hr = pDXGIDevice->GetParent(__uuidof(IDXGIAdapter), (void **)&pDXGIAdapter);
 * 
 * IDXGIFactory2 * pIDXGIFactory;
 * pDXGIAdapter->GetParent(__uuidof(IDXGIFactory2), (void **)&pIDXGIFactory);
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgifactory2
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIFactory2 extends IDXGIFactory1 {
    /**
     * The interface identifier for IDXGIFactory2
     * @type {Guid}
     */
    static IID := Guid("{50c83a1c-e072-4c48-87b0-3630fa36a6d0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIFactory2 interfaces
    */
    struct Vtbl extends IDXGIFactory1.Vtbl {
        IsWindowedStereoEnabled       : IntPtr
        CreateSwapChainForHwnd        : IntPtr
        CreateSwapChainForCoreWindow  : IntPtr
        GetSharedResourceAdapterLuid  : IntPtr
        RegisterStereoStatusWindow    : IntPtr
        RegisterStereoStatusEvent     : IntPtr
        UnregisterStereoStatus        : IntPtr
        RegisterOcclusionStatusWindow : IntPtr
        RegisterOcclusionStatusEvent  : IntPtr
        UnregisterOcclusionStatus     : IntPtr
        CreateSwapChainForComposition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIFactory2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether to use stereo mode.
     * @remarks
     * We recommend that windowed applications call <b>IsWindowedStereoEnabled</b> before they attempt to use stereo. <b>IsWindowedStereoEnabled</b> returns <b>TRUE</b> if both of the following items are true:
     * 
     * <ul>
     * <li>All adapters in the computer have drivers that are capable of stereo. This only means that the driver is implemented to the Windows Display Driver Model (WDDM) for Windows 8 (WDDM 1.2). However, the adapter does not necessarily have to be able to scan out stereo.</li>
     * <li>The current desktop mode (desktop modes are mono) and system policy and hardware are configured so that the Desktop Window Manager (DWM) performs stereo composition on at least one adapter output.</li>
     * </ul>
     * The creation of a windowed stereo swap chain succeeds if the first requirement is met. However, if the adapter can't scan out stereo, the output on that adapter is reduced to mono.
     * 
     * The <a href="https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Direct3D%20stereoscopic%203D%20sample">Direct3D 11.1 Simple Stereo 3D Sample</a> shows how to add a stereoscopic 3D effect and how to respond to system stereo changes.
     * @returns {BOOL} Indicates whether to use stereo mode. <b>TRUE</b> indicates that you can use stereo mode; otherwise, <b>FALSE</b>.
     * 
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>IsWindowedStereoEnabled</b> always returns FALSE because stereoscopic 3D display behavior isn’t available with the Platform Update for Windows 7. For more info about the Platform Update for Windows 7, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-iswindowedstereoenabled
     */
    IsWindowedStereoEnabled() {
        result := ComCall(14, this, BOOL)
        return result
    }

    /**
     * Creates a swap chain that is associated with an HWND handle to the output window for the swap chain.
     * @remarks
     * <div class="alert"><b>Note</b>  Do not use this method in Windows Store apps. Instead, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow">IDXGIFactory2::CreateSwapChainForCoreWindow</a>.</div>
     * <div> </div>
     * If you specify the width, height, or both (<b>Width</b> and <b>Height</b> members of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a> that <i>pDesc</i> points to) of the swap chain as zero, the runtime obtains the size from the output window that the <i>hWnd</i> parameter specifies.
     * 
     * You can subsequently call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getdesc1">IDXGISwapChain1::GetDesc1</a> method to retrieve the assigned width or height value.
     * 
     * Because you can associate only one flip presentation model swap chain at a time with an <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a>, the Microsoft Direct3D 11 policy of deferring the destruction of objects can cause problems if you attempt to destroy a flip presentation model swap chain and replace it with another swap chain. For more info about this situation, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-flush">Deferred Destruction Issues with Flip Presentation Swap Chains</a>.
     * 
     * For info about how to choose a format for the swap chain's back buffer, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/converting-data-color-space">Converting data for the color space</a>.
     * @param {IUnknown} pDevice For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain. For Direct3D 12 this is a pointer to a direct command queue (refer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandqueue">ID3D12CommandQueue</a>). This parameter cannot be <b>NULL</b>.
     * @param {HWND} _hWnd The <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a> handle that is associated with the swap chain that <b>CreateSwapChainForHwnd</b> creates. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC1>} pDesc A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a> structure for the swap-chain description. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<DXGI_SWAP_CHAIN_FULLSCREEN_DESC>} pFullscreenDesc A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_fullscreen_desc">DXGI_SWAP_CHAIN_FULLSCREEN_DESC</a> structure for the description of a full-screen swap chain. You can optionally set this parameter to create a full-screen swap chain. Set it to <b>NULL</b> to create a windowed swap chain.
     * @param {IDXGIOutput} pRestrictToOutput A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> interface for the output to restrict content to. You must also pass the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT_RESTRICT_TO_OUTPUT</a> flag in a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">IDXGISwapChain1::Present1</a> call to force the content to appear blacked out on any other output. If you want to restrict the content to a different output, you must create a new swap chain. However, you can conditionally restrict content based on the <b>DXGI_PRESENT_RESTRICT_TO_OUTPUT</b> flag.
     * 
     * 
     * Set this parameter to <b>NULL</b> if you don't want to restrict content to an output target.
     * @returns {IDXGISwapChain1} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgiswapchain1">IDXGISwapChain1</a> interface for the swap chain that <b>CreateSwapChainForHwnd</b> creates.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd
     */
    CreateSwapChainForHwnd(pDevice, _hWnd, pDesc, pFullscreenDesc, pRestrictToOutput) {
        result := ComCall(15, this, "ptr", pDevice, HWND, _hWnd, DXGI_SWAP_CHAIN_DESC1.Ptr, pDesc, DXGI_SWAP_CHAIN_FULLSCREEN_DESC.Ptr, pFullscreenDesc, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain1(ppSwapChain)
    }

    /**
     * Creates a swap chain that is associated with the CoreWindow object for the output window for the swap chain.
     * @remarks
     * <div class="alert"><b>Note</b>  Use this method in Windows Store apps rather than <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd">IDXGIFactory2::CreateSwapChainForHwnd</a>.</div>
     * <div> </div>
     * If you specify the width, height, or both (<b>Width</b> and <b>Height</b> members of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a> that <i>pDesc</i> points to) of the swap chain as zero, the runtime obtains the size from the output window that the <i>pWindow</i> parameter specifies.
     * 
     * You can subsequently call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getdesc1">IDXGISwapChain1::GetDesc1</a> method to retrieve the assigned width or height value.
     * 
     * Because you can associate only one flip presentation model swap chain (per layer) at a time with a <a href="https://docs.microsoft.com/uwp/api/Windows.UI.Core.CoreWindow">CoreWindow</a>, the Microsoft Direct3D 11 policy of deferring the destruction of objects can cause problems if you attempt to destroy a flip presentation model swap chain and replace it with another swap chain. For more info about this situation, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-flush">Deferred Destruction Issues with Flip Presentation Swap Chains</a>.
     * 
     * For info about how to choose a format for the swap chain's back buffer, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/converting-data-color-space">Converting data for the color space</a>.
     * 
     * <h3><a id="Overlapping_swap_chains"></a><a id="overlapping_swap_chains"></a><a id="OVERLAPPING_SWAP_CHAINS"></a>Overlapping swap chains</h3>
     * Starting with Windows 8.1, it is possible to create an additional swap chain in the foreground layer. A foreground swap chain can be used to render UI elements at native resolution while scaling up real-time rendering in the background swap chain (such as gameplay). This enables scenarios where lower resolution rendering is required for faster fill rates, but without sacrificing UI quality.
     * 
     * Foreground swap chains are created by setting the <b>DXGI_SWAP_CHAIN_FLAG_FOREGROUND_LAYER</b> swap chain flag in the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a> that <i>pDesc</i> points to. Foreground swap chains must also use the <b>DXGI_ALPHA_MODE_PREMULTIPLIED</b> alpha mode, and must use <b>DXGI_SCALING_NONE</b>. Premultiplied alpha means that each pixel's color values are expected to be already multiplied by the alpha value before the frame is presented. For example, a 100% white BGRA pixel at 50% alpha is set to (0.5, 0.5, 0.5, 0.5). The alpha premultiplication step can be done in the output-merger stage by applying an app blend state (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11blendstate">ID3D11BlendState</a>) with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_render_target_blend_desc">D3D11_RENDER_TARGET_BLEND_DESC</a> structure's <b>SrcBlend</b> field set to <b>D3D11_SRC_ALPHA</b>. If the alpha premultiplication step is not done, colors on the foreground swap chain will be brighter than expected.
     * 
     * The foreground swap chain will use multiplane overlays if supported by the hardware. Call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nf-dxgi1_3-idxgioutput2-supportsoverlays">IDXGIOutput2::SupportsOverlays</a> to query the adapter for overlay support.
     * 
     * The following example creates a foreground swap chain for a CoreWindow:
     * 
     * 
     * ```cpp
     * 
     * DXGI_SWAP_CHAIN_DESC1 swapChainDesc = { 0 };
     * 
     * swapChainDesc.Width = static_cast<UINT>(m_d3dRenderTargetSize.Width);
     * swapChainDesc.Height = static_cast<UINT>(m_d3dRenderTargetSize.Height);
     * swapChainDesc.Format = DXGI_FORMAT_B8G8R8A8_UNORM;
     * swapChainDesc.Stereo = false;
     * swapChainDesc.SampleDesc.Count = 1; // Don't use multi-sampling.
     * swapChainDesc.SampleDesc.Quality = 0;
     * swapChainDesc.BufferUsage = DXGI_USAGE_RENDER_TARGET_OUTPUT;
     * swapChainDesc.BufferCount = 2;
     * swapChainDesc.SwapEffect = DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL;
     * swapChainDesc.Flags = DXGI_SWAP_CHAIN_FLAG_FOREGROUND_LAYER;
     * swapChainDesc.AlphaMode = DXGI_ALPHA_MODE_PREMULTIPLIED;
     * swapChainDesc.Scaling = DXGI_SCALING_NONE;
     * 
     * ComPtr<IDXGISwapChain1> swapChain;
     * HRESULT hr = dxgiFactory->CreateSwapChainForCoreWindow(
     *     m_d3dDevice.Get(),
     *     reinterpret_cast<IUnknown*>(m_window.Get()),
     *     &swapChainDesc,
     *     nullptr,
     *     &swapChain
     *     );
     * ```
     * 
     * 
     * Present both swap chains together after rendering is complete.
     * 
     * The following example presents both swap chains:
     * 
     * 
     * ```cpp
     * 
     * HRESULT hr = m_swapChain->Present(1, 0);
     * 
     * if (SUCCEEDED(hr) && m_foregroundSwapChain)
     * {
     *     m_foregroundSwapChain->Present(1, 0);
     * }
     * ```
     * @param {IUnknown} pDevice For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain. For Direct3D 12 this is a pointer to a direct command queue (refer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandqueue">ID3D12CommandQueue</a>). This parameter cannot be <b>NULL</b>.
     * @param {IUnknown} pWindow A pointer to the <a href="https://docs.microsoft.com/uwp/api/Windows.UI.Core.CoreWindow">CoreWindow</a> object that is associated with the swap chain that <b>CreateSwapChainForCoreWindow</b> creates.
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC1>} pDesc A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a> structure for the swap-chain description. This parameter cannot be <b>NULL</b>.
     * @param {IDXGIOutput} pRestrictToOutput A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> interface that the swap chain is restricted to. If the swap chain is moved to a different output, the content is black. You can optionally set this parameter to an output target that uses <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT_RESTRICT_TO_OUTPUT</a> to restrict the content on this output. If you do not set this parameter to restrict content on an output target, you can set it to <b>NULL</b>.
     * @returns {IDXGISwapChain1} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgiswapchain1">IDXGISwapChain1</a> interface for the swap chain that <b>CreateSwapChainForCoreWindow</b> creates.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow
     */
    CreateSwapChainForCoreWindow(pDevice, pWindow, pDesc, pRestrictToOutput) {
        result := ComCall(16, this, "ptr", pDevice, "ptr", pWindow, DXGI_SWAP_CHAIN_DESC1.Ptr, pDesc, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain1(ppSwapChain)
    }

    /**
     * Identifies the adapter on which a shared resource object was created.
     * @remarks
     * You cannot share resources across adapters. Therefore, you cannot open a shared resource on an adapter other than the adapter on which the resource was created.  Call <b>GetSharedResourceAdapterLuid</b> before you open a shared resource to ensure that the resource was created on the appropriate adapter. To open a shared resource, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11device1-opensharedresource1">ID3D11Device1::OpenSharedResource1</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11device1-opensharedresourcebyname">ID3D11Device1::OpenSharedResourceByName</a> method.
     * @param {HANDLE} _hResource A handle to a shared resource object. The <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiresource1-createsharedhandle">IDXGIResource1::CreateSharedHandle</a> method returns this handle.
     * @returns {LUID} A pointer to a variable that receives a locally unique identifier (<a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549708(v=vs.85)">LUID</a>) value that identifies the adapter. <b>LUID</b> is defined in Dxgi.h. An <b>LUID</b> is a 64-bit value that is guaranteed to be unique only on the operating system on which it was generated. The uniqueness of an <b>LUID</b> is guaranteed only until the operating system is restarted.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-getsharedresourceadapterluid
     */
    GetSharedResourceAdapterLuid(_hResource) {
        pLuid := LUID()
        result := ComCall(17, this, HANDLE, _hResource, LUID.Ptr, pLuid, "HRESULT")
        return pLuid
    }

    /**
     * Registers an application window to receive notification messages of changes of stereo status.
     * @param {HWND} WindowHandle The handle of the window to send a notification message to when stereo status change occurs.
     * @param {Integer} wMsg Identifies the notification message to send.
     * @returns {Integer} A pointer to a key value that an application can pass to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-unregisterstereostatus">IDXGIFactory2::UnregisterStereoStatus</a> method  to unregister the notification message that <i>wMsg</i> specifies.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerstereostatuswindow
     */
    RegisterStereoStatusWindow(WindowHandle, wMsg) {
        result := ComCall(18, this, HWND, WindowHandle, "uint", wMsg, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Registers to receive notification of changes in stereo status by using event signaling.
     * @param {HANDLE} hEvent A handle to the event object that the operating system sets when notification of stereo status change occurs. The <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-openeventa">OpenEvent</a> function returns this handle.
     * @returns {Integer} A pointer to a key value that an application can pass to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-unregisterstereostatus">IDXGIFactory2::UnregisterStereoStatus</a> method  to unregister the notification event that <i>hEvent</i> specifies.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerstereostatusevent
     */
    RegisterStereoStatusEvent(hEvent) {
        result := ComCall(19, this, HANDLE, hEvent, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Unregisters a window or an event to stop it from receiving notification when stereo status changes.
     * @remarks
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>UnregisterStereoStatus</b> has no effect. For more info about the Platform Update for Windows 7, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @param {Integer} dwCookie A key value for the window or event to unregister. The  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerstereostatuswindow">IDXGIFactory2::RegisterStereoStatusWindow</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerstereostatusevent">IDXGIFactory2::RegisterStereoStatusEvent</a> method returns this value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-unregisterstereostatus
     */
    UnregisterStereoStatus(dwCookie) {
        ComCall(20, this, "uint", dwCookie)
    }

    /**
     * Registers an application window to receive notification messages of changes of occlusion status.
     * @remarks
     * Apps choose the Windows message that Windows sends when occlusion status changes.
     * @param {HWND} WindowHandle The handle of the window to send a notification message to when occlusion status change occurs.
     * @param {Integer} wMsg Identifies the notification message to send.
     * @returns {Integer} A pointer to a key value that an application can pass to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-unregisterocclusionstatus">IDXGIFactory2::UnregisterOcclusionStatus</a> method  to unregister the notification message that <i>wMsg</i> specifies.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerocclusionstatuswindow
     */
    RegisterOcclusionStatusWindow(WindowHandle, wMsg) {
        result := ComCall(21, this, HWND, WindowHandle, "uint", wMsg, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Registers to receive notification of changes in occlusion status by using event signaling.
     * @remarks
     * If you call <b>RegisterOcclusionStatusEvent</b> multiple times with the same event handle, <b>RegisterOcclusionStatusEvent</b> fails with <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_INVALID_CALL</a>.
     * 
     * If you call <b>RegisterOcclusionStatusEvent</b> multiple times with the different event handles, <b>RegisterOcclusionStatusEvent</b> properly registers the events.
     * @param {HANDLE} hEvent A handle to the event object that the operating system sets when notification of occlusion status change occurs. The <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-openeventa">OpenEvent</a> function returns this handle.
     * @returns {Integer} A pointer to a key value that an application can pass to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-unregisterocclusionstatus">IDXGIFactory2::UnregisterOcclusionStatus</a> method  to unregister the notification event that <i>hEvent</i> specifies.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerocclusionstatusevent
     */
    RegisterOcclusionStatusEvent(hEvent) {
        result := ComCall(22, this, HANDLE, hEvent, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Unregisters a window or an event to stop it from receiving notification when occlusion status changes.
     * @remarks
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>UnregisterOcclusionStatus</b> has no effect. For more info about the Platform Update for Windows 7, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @param {Integer} dwCookie A key value for the window or event to unregister. The  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerocclusionstatuswindow">IDXGIFactory2::RegisterOcclusionStatusWindow</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerocclusionstatusevent">IDXGIFactory2::RegisterOcclusionStatusEvent</a> method returns this value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-unregisterocclusionstatus
     */
    UnregisterOcclusionStatus(dwCookie) {
        ComCall(23, this, "uint", dwCookie)
    }

    /**
     * Creates a swap chain that you can use to send Direct3D content into the DirectComposition API or a Xaml framework to compose in a window.
     * @remarks
     * You can use composition swap chains with either:
     * 
     * * <a href="https://docs.microsoft.com/windows/win32/directcomp/directcomposition-portal">DirectComposition</a>'s <a href="https://docs.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a> interface,
     * * System XAML's [SwapChainPanel](/uwp/api/windows.ui.xaml.controls.swapchainpanel) or [SwapChainBackgroundPanel](/uwp/api/windows.ui.xaml.controls.swapchainbackgroundpanel) classes.
     * * [Windows UI Library (WinUI) 3](https://docs.microsoft.com/windows/apps/winui/) XAML's [SwapChainPanel](/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.controls.swapchainpanel) or [SwapChainBackgroundPanel](/windows/windows-app-sdk/api/winrt/microsoft.ui.xaml.controls.swapchainbackgroundpanel) classes.
     * 
     * For DirectComposition, you can call the <a href="https://docs.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setcontent">IDCompositionVisual::SetContent</a> method to set the swap chain as the content of a <a href="https://docs.microsoft.com/windows/win32/directcomp/basic-concepts">visual object</a>, which then allows you to bind the swap chain to the visual tree. For XAML, the <b>SwapChainBackgroundPanel</b> class exposes a classic COM interface <b>ISwapChainBackgroundPanelNative</b>. You can use the <a href="https://docs.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-iswapchainbackgroundpanelnative-setswapchain">ISwapChainBackgroundPanelNative::SetSwapChain</a> method to bind to the XAML UI graph. For info about how to use composition swap chains with XAML’s <b>SwapChainBackgroundPanel</b> class, see <a href="https://docs.microsoft.com/windows/uwp/gaming/directx-and-xaml-interop">DirectX and XAML interop</a>.
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiswapchain-setfullscreenstate">IDXGISwapChain::SetFullscreenState</a>, <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiswapchain-resizetarget">IDXGISwapChain::ResizeTarget</a>, <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiswapchain-getcontainingoutput">IDXGISwapChain::GetContainingOutput</a>, <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-gethwnd">IDXGISwapChain1::GetHwnd</a>, and <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-getcorewindow">IDXGISwapChain::GetCoreWindow</a> methods aren't valid on this type of swap chain. If you call any of these methods on this type of swap chain, they fail.
     * 
     * For info about how to choose a format for the swap chain's back buffer, see <a href="https://docs.microsoft.com/windows/win32/direct3ddxgi/converting-data-color-space">Converting data for the color space</a>.
     * @param {IUnknown} pDevice For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain. For Direct3D 12 this is a pointer to a direct command queue (refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12commandqueue">ID3D12CommandQueue</a>). This parameter cannot be <b>NULL</b>. Software drivers, like <a href="https://docs.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE_REFERENCE</a>, are not supported for composition swap chains.
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC1>} pDesc A pointer to a  <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a> structure for the swap-chain description. This parameter cannot be <b>NULL</b>.
     * 
     * You must specify the <a href="https://docs.microsoft.com/windows/win32/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL</a> value in the <b>SwapEffect</b> member of <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a> because <b>CreateSwapChainForComposition</b> supports only <a href="https://docs.microsoft.com/windows/win32/direct3ddxgi/dxgi-flip-model">flip presentation model</a>.
     * 
     * You must also specify the <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_2/ne-dxgi1_2-dxgi_scaling">DXGI_SCALING_STRETCH</a> value in the <b>Scaling</b> member of <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a>.
     * @param {IDXGIOutput} pRestrictToOutput A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> interface for the output to restrict content to. You must also pass the <a href="https://docs.microsoft.com/windows/win32/direct3ddxgi/dxgi-present">DXGI_PRESENT_RESTRICT_TO_OUTPUT</a> flag in a <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">IDXGISwapChain1::Present1</a> call to force the content to appear blacked out on any other output. If you want to restrict the content to a different output, you must create a new swap chain. However, you can conditionally restrict content based on the <b>DXGI_PRESENT_RESTRICT_TO_OUTPUT</b> flag.
     * 
     * Set this parameter to <b>NULL</b> if you don't want to restrict content to an output target.
     * @returns {IDXGISwapChain1} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgiswapchain1">IDXGISwapChain1</a> interface for the swap chain that <b>CreateSwapChainForComposition</b> creates.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition
     */
    CreateSwapChainForComposition(pDevice, pDesc, pRestrictToOutput) {
        result := ComCall(24, this, "ptr", pDevice, DXGI_SWAP_CHAIN_DESC1.Ptr, pDesc, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain1(ppSwapChain)
    }

    Query(iid) {
        if (IDXGIFactory2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsWindowedStereoEnabled := CallbackCreate(GetMethod(implObj, "IsWindowedStereoEnabled"), flags, 1)
        this.vtbl.CreateSwapChainForHwnd := CallbackCreate(GetMethod(implObj, "CreateSwapChainForHwnd"), flags, 7)
        this.vtbl.CreateSwapChainForCoreWindow := CallbackCreate(GetMethod(implObj, "CreateSwapChainForCoreWindow"), flags, 6)
        this.vtbl.GetSharedResourceAdapterLuid := CallbackCreate(GetMethod(implObj, "GetSharedResourceAdapterLuid"), flags, 3)
        this.vtbl.RegisterStereoStatusWindow := CallbackCreate(GetMethod(implObj, "RegisterStereoStatusWindow"), flags, 4)
        this.vtbl.RegisterStereoStatusEvent := CallbackCreate(GetMethod(implObj, "RegisterStereoStatusEvent"), flags, 3)
        this.vtbl.UnregisterStereoStatus := CallbackCreate(GetMethod(implObj, "UnregisterStereoStatus"), flags, 2)
        this.vtbl.RegisterOcclusionStatusWindow := CallbackCreate(GetMethod(implObj, "RegisterOcclusionStatusWindow"), flags, 4)
        this.vtbl.RegisterOcclusionStatusEvent := CallbackCreate(GetMethod(implObj, "RegisterOcclusionStatusEvent"), flags, 3)
        this.vtbl.UnregisterOcclusionStatus := CallbackCreate(GetMethod(implObj, "UnregisterOcclusionStatus"), flags, 2)
        this.vtbl.CreateSwapChainForComposition := CallbackCreate(GetMethod(implObj, "CreateSwapChainForComposition"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsWindowedStereoEnabled)
        CallbackFree(this.vtbl.CreateSwapChainForHwnd)
        CallbackFree(this.vtbl.CreateSwapChainForCoreWindow)
        CallbackFree(this.vtbl.GetSharedResourceAdapterLuid)
        CallbackFree(this.vtbl.RegisterStereoStatusWindow)
        CallbackFree(this.vtbl.RegisterStereoStatusEvent)
        CallbackFree(this.vtbl.UnregisterStereoStatus)
        CallbackFree(this.vtbl.RegisterOcclusionStatusWindow)
        CallbackFree(this.vtbl.RegisterOcclusionStatusEvent)
        CallbackFree(this.vtbl.UnregisterOcclusionStatus)
        CallbackFree(this.vtbl.CreateSwapChainForComposition)
    }
}
