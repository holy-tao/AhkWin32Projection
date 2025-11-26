#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGISwapChain1.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\IDXGIFactory1.ahk

/**
 * The IDXGIFactory2 interface includes methods to create a newer version swap chain with more features than IDXGISwapChain and to monitor stereoscopic 3D capabilities.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nn-dxgi1_2-idxgifactory2
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIFactory2 extends IDXGIFactory1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIFactory2
     * @type {Guid}
     */
    static IID => Guid("{50c83a1c-e072-4c48-87b0-3630fa36a6d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsWindowedStereoEnabled", "CreateSwapChainForHwnd", "CreateSwapChainForCoreWindow", "GetSharedResourceAdapterLuid", "RegisterStereoStatusWindow", "RegisterStereoStatusEvent", "UnregisterStereoStatus", "RegisterOcclusionStatusWindow", "RegisterOcclusionStatusEvent", "UnregisterOcclusionStatus", "CreateSwapChainForComposition"]

    /**
     * Determines whether to use stereo mode.
     * @returns {BOOL} Indicates whether to use stereo mode. <b>TRUE</b> indicates that you can use stereo mode; otherwise, <b>FALSE</b>.
     * 
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>IsWindowedStereoEnabled</b> always returns FALSE because stereoscopic 3D display behavior isn’t available with the Platform Update for Windows 7. For more info about the Platform Update for Windows 7, see <a href="/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgifactory2-iswindowedstereoenabled
     */
    IsWindowedStereoEnabled() {
        result := ComCall(14, this, "int")
        return result
    }

    /**
     * Creates a swap chain that is associated with an HWND handle to the output window for the swap chain.
     * @param {IUnknown} pDevice For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain. For Direct3D 12 this is a pointer to a direct command queue (refer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandqueue">ID3D12CommandQueue</a>). This parameter cannot be <b>NULL</b>.
     * @param {HWND} hWnd The <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a> handle that is associated with the swap chain that <b>CreateSwapChainForHwnd</b> creates. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC1>} pDesc A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a> structure for the swap-chain description. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<DXGI_SWAP_CHAIN_FULLSCREEN_DESC>} pFullscreenDesc A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_fullscreen_desc">DXGI_SWAP_CHAIN_FULLSCREEN_DESC</a> structure for the description of a full-screen swap chain. You can optionally set this parameter to create a full-screen swap chain. Set it to <b>NULL</b> to create a windowed swap chain.
     * @param {IDXGIOutput} pRestrictToOutput A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> interface for the output to restrict content to. You must also pass the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT_RESTRICT_TO_OUTPUT</a> flag in a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">IDXGISwapChain1::Present1</a> call to force the content to appear blacked out on any other output. If you want to restrict the content to a different output, you must create a new swap chain. However, you can conditionally restrict content based on the <b>DXGI_PRESENT_RESTRICT_TO_OUTPUT</b> flag.
     * 
     * 
     * Set this parameter to <b>NULL</b> if you don't want to restrict content to an output target.
     * @returns {IDXGISwapChain1} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgiswapchain1">IDXGISwapChain1</a> interface for the swap chain that <b>CreateSwapChainForHwnd</b> creates.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd
     */
    CreateSwapChainForHwnd(pDevice, hWnd, pDesc, pFullscreenDesc, pRestrictToOutput) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(15, this, "ptr", pDevice, "ptr", hWnd, "ptr", pDesc, "ptr", pFullscreenDesc, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain1(ppSwapChain)
    }

    /**
     * Creates a swap chain that is associated with the CoreWindow object for the output window for the swap chain.
     * @param {IUnknown} pDevice For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain. For Direct3D 12 this is a pointer to a direct command queue (refer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandqueue">ID3D12CommandQueue</a>). This parameter cannot be <b>NULL</b>.
     * @param {IUnknown} pWindow A pointer to the <a href="https://docs.microsoft.com/uwp/api/Windows.UI.Core.CoreWindow">CoreWindow</a> object that is associated with the swap chain that <b>CreateSwapChainForCoreWindow</b> creates.
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC1>} pDesc A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a> structure for the swap-chain description. This parameter cannot be <b>NULL</b>.
     * @param {IDXGIOutput} pRestrictToOutput A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> interface that the swap chain is restricted to. If the swap chain is moved to a different output, the content is black. You can optionally set this parameter to an output target that uses <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT_RESTRICT_TO_OUTPUT</a> to restrict the content on this output. If you do not set this parameter to restrict content on an output target, you can set it to <b>NULL</b>.
     * @returns {IDXGISwapChain1} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgiswapchain1">IDXGISwapChain1</a> interface for the swap chain that <b>CreateSwapChainForCoreWindow</b> creates.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow
     */
    CreateSwapChainForCoreWindow(pDevice, pWindow, pDesc, pRestrictToOutput) {
        result := ComCall(16, this, "ptr", pDevice, "ptr", pWindow, "ptr", pDesc, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain1(ppSwapChain)
    }

    /**
     * Identifies the adapter on which a shared resource object was created.
     * @param {HANDLE} hResource A handle to a shared resource object. The <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiresource1-createsharedhandle">IDXGIResource1::CreateSharedHandle</a> method returns this handle.
     * @returns {LUID} A pointer to a variable that receives a locally unique identifier (<a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549708(v=vs.85)">LUID</a>) value that identifies the adapter. <b>LUID</b> is defined in Dxgi.h. An <b>LUID</b> is a 64-bit value that is guaranteed to be unique only on the operating system on which it was generated. The uniqueness of an <b>LUID</b> is guaranteed only until the operating system is restarted.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgifactory2-getsharedresourceadapterluid
     */
    GetSharedResourceAdapterLuid(hResource) {
        hResource := hResource is Win32Handle ? NumGet(hResource, "ptr") : hResource

        pLuid := LUID()
        result := ComCall(17, this, "ptr", hResource, "ptr", pLuid, "HRESULT")
        return pLuid
    }

    /**
     * Registers an application window to receive notification messages of changes of stereo status.
     * @param {HWND} WindowHandle The handle of the window to send a notification message to when stereo status change occurs.
     * @param {Integer} wMsg Identifies the notification message to send.
     * @returns {Integer} A pointer to a key value that an application can pass to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-unregisterstereostatus">IDXGIFactory2::UnregisterStereoStatus</a> method  to unregister the notification message that <i>wMsg</i> specifies.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgifactory2-registerstereostatuswindow
     */
    RegisterStereoStatusWindow(WindowHandle, wMsg) {
        WindowHandle := WindowHandle is Win32Handle ? NumGet(WindowHandle, "ptr") : WindowHandle

        result := ComCall(18, this, "ptr", WindowHandle, "uint", wMsg, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Registers to receive notification of changes in stereo status by using event signaling.
     * @param {HANDLE} hEvent A handle to the event object that the operating system sets when notification of stereo status change occurs. The <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-openeventa">OpenEvent</a> function returns this handle.
     * @returns {Integer} A pointer to a key value that an application can pass to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-unregisterstereostatus">IDXGIFactory2::UnregisterStereoStatus</a> method  to unregister the notification event that <i>hEvent</i> specifies.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgifactory2-registerstereostatusevent
     */
    RegisterStereoStatusEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(19, this, "ptr", hEvent, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Unregisters a window or an event to stop it from receiving notification when stereo status changes.
     * @remarks
     * 
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>UnregisterStereoStatus</b> has no effect. For more info about the Platform Update for Windows 7, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * 
     * 
     * @param {Integer} dwCookie A key value for the window or event to unregister. The  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerstereostatuswindow">IDXGIFactory2::RegisterStereoStatusWindow</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerstereostatusevent">IDXGIFactory2::RegisterStereoStatusEvent</a> method returns this value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgifactory2-unregisterstereostatus
     */
    UnregisterStereoStatus(dwCookie) {
        ComCall(20, this, "uint", dwCookie)
    }

    /**
     * Registers an application window to receive notification messages of changes of occlusion status.
     * @param {HWND} WindowHandle The handle of the window to send a notification message to when occlusion status change occurs.
     * @param {Integer} wMsg Identifies the notification message to send.
     * @returns {Integer} A pointer to a key value that an application can pass to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-unregisterocclusionstatus">IDXGIFactory2::UnregisterOcclusionStatus</a> method  to unregister the notification message that <i>wMsg</i> specifies.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgifactory2-registerocclusionstatuswindow
     */
    RegisterOcclusionStatusWindow(WindowHandle, wMsg) {
        WindowHandle := WindowHandle is Win32Handle ? NumGet(WindowHandle, "ptr") : WindowHandle

        result := ComCall(21, this, "ptr", WindowHandle, "uint", wMsg, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Registers to receive notification of changes in occlusion status by using event signaling.
     * @param {HANDLE} hEvent A handle to the event object that the operating system sets when notification of occlusion status change occurs. The <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-openeventa">OpenEvent</a> function returns this handle.
     * @returns {Integer} A pointer to a key value that an application can pass to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-unregisterocclusionstatus">IDXGIFactory2::UnregisterOcclusionStatus</a> method  to unregister the notification event that <i>hEvent</i> specifies.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgifactory2-registerocclusionstatusevent
     */
    RegisterOcclusionStatusEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(22, this, "ptr", hEvent, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Unregisters a window or an event to stop it from receiving notification when occlusion status changes.
     * @remarks
     * 
     * <b>Platform Update for Windows 7:  </b>On Windows 7 or Windows Server 2008 R2 with the <a href="https://support.microsoft.com/help/2670838">Platform Update for Windows 7</a> installed, <b>UnregisterOcclusionStatus</b> has no effect. For more info about the Platform Update for Windows 7, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/platform-update-for-windows-7">Platform Update for Windows 7</a>.
     * 
     * 
     * @param {Integer} dwCookie A key value for the window or event to unregister. The  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerocclusionstatuswindow">IDXGIFactory2::RegisterOcclusionStatusWindow</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerocclusionstatusevent">IDXGIFactory2::RegisterOcclusionStatusEvent</a> method returns this value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgifactory2-unregisterocclusionstatus
     */
    UnregisterOcclusionStatus(dwCookie) {
        ComCall(23, this, "uint", dwCookie)
    }

    /**
     * Creates a swap chain that you can use to send Direct3D content into the DirectComposition API or the Windows.UI.Xaml framework to compose in a window.
     * @param {IUnknown} pDevice For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain. For Direct3D 12 this is a pointer to a direct command queue (refer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandqueue">ID3D12CommandQueue</a>). This parameter cannot be <b>NULL</b>. Software drivers, like <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE_REFERENCE</a>, are not supported for composition swap chains.
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC1>} pDesc A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a> structure for the swap-chain description. This parameter cannot be <b>NULL</b>.
     * 
     * You must specify the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL</a> value in the <b>SwapEffect</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a> because <b>CreateSwapChainForComposition</b> supports only <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-flip-model">flip presentation model</a>.
     * 
     * You must also specify the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ne-dxgi1_2-dxgi_scaling">DXGI_SCALING_STRETCH</a> value in the <b>Scaling</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a>.
     * @param {IDXGIOutput} pRestrictToOutput A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> interface for the output to restrict content to. You must also pass the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT_RESTRICT_TO_OUTPUT</a> flag in a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">IDXGISwapChain1::Present1</a> call to force the content to appear blacked out on any other output. If you want to restrict the content to a different output, you must create a new swap chain. However, you can conditionally restrict content based on the <b>DXGI_PRESENT_RESTRICT_TO_OUTPUT</b> flag.
     * 
     * 
     * Set this parameter to <b>NULL</b> if you don't want to restrict content to an output target.
     * @returns {IDXGISwapChain1} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgiswapchain1">IDXGISwapChain1</a> interface for the swap chain that <b>CreateSwapChainForComposition</b> creates.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition
     */
    CreateSwapChainForComposition(pDevice, pDesc, pRestrictToOutput) {
        result := ComCall(24, this, "ptr", pDevice, "ptr", pDesc, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain1(ppSwapChain)
    }
}
