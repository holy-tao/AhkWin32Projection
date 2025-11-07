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
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-iswindowedstereoenabled
     */
    IsWindowedStereoEnabled() {
        result := ComCall(14, this, "int")
        return result
    }

    /**
     * 
     * @param {IUnknown} pDevice 
     * @param {HWND} hWnd 
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC1>} pDesc 
     * @param {Pointer<DXGI_SWAP_CHAIN_FULLSCREEN_DESC>} pFullscreenDesc 
     * @param {IDXGIOutput} pRestrictToOutput 
     * @returns {IDXGISwapChain1} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforhwnd
     */
    CreateSwapChainForHwnd(pDevice, hWnd, pDesc, pFullscreenDesc, pRestrictToOutput) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(15, this, "ptr", pDevice, "ptr", hWnd, "ptr", pDesc, "ptr", pFullscreenDesc, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain1(ppSwapChain)
    }

    /**
     * 
     * @param {IUnknown} pDevice 
     * @param {IUnknown} pWindow 
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC1>} pDesc 
     * @param {IDXGIOutput} pRestrictToOutput 
     * @returns {IDXGISwapChain1} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcorewindow
     */
    CreateSwapChainForCoreWindow(pDevice, pWindow, pDesc, pRestrictToOutput) {
        result := ComCall(16, this, "ptr", pDevice, "ptr", pWindow, "ptr", pDesc, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain1(ppSwapChain)
    }

    /**
     * 
     * @param {HANDLE} hResource 
     * @returns {LUID} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-getsharedresourceadapterluid
     */
    GetSharedResourceAdapterLuid(hResource) {
        hResource := hResource is Win32Handle ? NumGet(hResource, "ptr") : hResource

        pLuid := LUID()
        result := ComCall(17, this, "ptr", hResource, "ptr", pLuid, "HRESULT")
        return pLuid
    }

    /**
     * 
     * @param {HWND} WindowHandle 
     * @param {Integer} wMsg 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerstereostatuswindow
     */
    RegisterStereoStatusWindow(WindowHandle, wMsg) {
        WindowHandle := WindowHandle is Win32Handle ? NumGet(WindowHandle, "ptr") : WindowHandle

        result := ComCall(18, this, "ptr", WindowHandle, "uint", wMsg, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {HANDLE} hEvent 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerstereostatusevent
     */
    RegisterStereoStatusEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(19, this, "ptr", hEvent, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-unregisterstereostatus
     */
    UnregisterStereoStatus(dwCookie) {
        ComCall(20, this, "uint", dwCookie)
    }

    /**
     * 
     * @param {HWND} WindowHandle 
     * @param {Integer} wMsg 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerocclusionstatuswindow
     */
    RegisterOcclusionStatusWindow(WindowHandle, wMsg) {
        WindowHandle := WindowHandle is Win32Handle ? NumGet(WindowHandle, "ptr") : WindowHandle

        result := ComCall(21, this, "ptr", WindowHandle, "uint", wMsg, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {HANDLE} hEvent 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-registerocclusionstatusevent
     */
    RegisterOcclusionStatusEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(22, this, "ptr", hEvent, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-unregisterocclusionstatus
     */
    UnregisterOcclusionStatus(dwCookie) {
        ComCall(23, this, "uint", dwCookie)
    }

    /**
     * 
     * @param {IUnknown} pDevice 
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC1>} pDesc 
     * @param {IDXGIOutput} pRestrictToOutput 
     * @returns {IDXGISwapChain1} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgifactory2-createswapchainforcomposition
     */
    CreateSwapChainForComposition(pDevice, pDesc, pRestrictToOutput) {
        result := ComCall(24, this, "ptr", pDevice, "ptr", pDesc, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain1(ppSwapChain)
    }
}
