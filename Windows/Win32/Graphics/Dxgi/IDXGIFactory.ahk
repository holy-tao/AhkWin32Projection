#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIObject.ahk

/**
 * An IDXGIFactory interface implements methods for generating DXGI objects (which handle full screen transitions).
 * @remarks
 * 
  * Create a factory by calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-createdxgifactory">CreateDXGIFactory</a>.
  *         
  * 
  * Because you can create a Direct3D device without creating a swap chain, you might need to retrieve the factory that is used to create the device in order to create a swap chain.
  *           You can request the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> interface from the Direct3D device and then use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiobject-getparent">IDXGIObject::GetParent</a> method to locate
  *           the factory.  The following code shows how.
  *         
  * 
  * 
  * ```
  * IDXGIDevice * pDXGIDevice = nullptr;
  * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice), (void **)&pDXGIDevice);
  * 
  * IDXGIAdapter * pDXGIAdapter = nullptr;
  * hr = pDXGIDevice->GetAdapter( &pDXGIAdapter );
  * 
  * IDXGIFactory * pIDXGIFactory = nullptr;
  * pDXGIAdapter->GetParent(__uuidof(IDXGIFactory), (void **)&pIDXGIFactory);
  * ```
  * 
  * 
  * <b>Windows Phone 8:
  *         </b> This API is supported.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgifactory
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIFactory extends IDXGIObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIFactory
     * @type {Guid}
     */
    static IID => Guid("{7b7166ec-21c7-44ae-b21a-c9ae321ae369}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumAdapters", "MakeWindowAssociation", "GetWindowAssociation", "CreateSwapChain", "CreateSoftwareAdapter"]

    /**
     * 
     * @param {Integer} Adapter 
     * @param {Pointer<IDXGIAdapter>} ppAdapter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgifactory-enumadapters
     */
    EnumAdapters(Adapter, ppAdapter) {
        result := ComCall(7, this, "uint", Adapter, "ptr*", ppAdapter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} WindowHandle 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgifactory-makewindowassociation
     */
    MakeWindowAssociation(WindowHandle, Flags) {
        WindowHandle := WindowHandle is Win32Handle ? NumGet(WindowHandle, "ptr") : WindowHandle

        result := ComCall(8, this, "ptr", WindowHandle, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} pWindowHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgifactory-getwindowassociation
     */
    GetWindowAssociation(pWindowHandle) {
        result := ComCall(9, this, "ptr", pWindowHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pDevice 
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC>} pDesc 
     * @param {Pointer<IDXGISwapChain>} ppSwapChain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgifactory-createswapchain
     */
    CreateSwapChain(pDevice, pDesc, ppSwapChain) {
        result := ComCall(10, this, "ptr", pDevice, "ptr", pDesc, "ptr*", ppSwapChain, "int")
        return result
    }

    /**
     * 
     * @param {HMODULE} Module 
     * @param {Pointer<IDXGIAdapter>} ppAdapter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgifactory-createsoftwareadapter
     */
    CreateSoftwareAdapter(Module, ppAdapter) {
        Module := Module is Win32Handle ? NumGet(Module, "ptr") : Module

        result := ComCall(11, this, "ptr", Module, "ptr*", ppAdapter, "HRESULT")
        return result
    }
}
