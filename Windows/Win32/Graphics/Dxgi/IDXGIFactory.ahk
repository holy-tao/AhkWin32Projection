#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIAdapter.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\IDXGISwapChain.ahk
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
     * Enumerates the adapters (video cards).
     * @param {Integer} Adapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the adapter to enumerate.
     * @returns {IDXGIAdapter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>**</b>
     * 
     * The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> interface at the position specified by the <i>Adapter</i> parameter.  This parameter must not be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgifactory-enumadapters
     */
    EnumAdapters(Adapter) {
        result := ComCall(7, this, "uint", Adapter, "ptr*", &ppAdapter := 0, "HRESULT")
        return IDXGIAdapter(ppAdapter)
    }

    /**
     * Allows DXGI to monitor an application's message queue for the alt-enter key sequence (which causes the application to switch from windowed to full screen or vice versa).
     * @param {HWND} WindowHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The handle of the window that is to be monitored. This parameter can be <b>NULL</b>; but only if *Flags* is also 0.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_INVALID_CALL</a> if <i>WindowHandle</i> is invalid, or E_OUTOFMEMORY.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgifactory-makewindowassociation
     */
    MakeWindowAssociation(WindowHandle, Flags) {
        WindowHandle := WindowHandle is Win32Handle ? NumGet(WindowHandle, "ptr") : WindowHandle

        result := ComCall(8, this, "ptr", WindowHandle, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Get the window through which the user controls the transition to and from full screen.
     * @returns {HWND} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a>*</b>
     * 
     * A pointer to a window handle.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgifactory-getwindowassociation
     */
    GetWindowAssociation() {
        pWindowHandle := HWND()
        result := ComCall(9, this, "ptr", pWindowHandle, "HRESULT")
        return pWindowHandle
    }

    /**
     * Creates a swap chain.
     * @param {IUnknown} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * For Direct3D 11, and earlier versions of Direct3D, this is a pointer to the Direct3D device for the swap chain. For Direct3D 12 this is a pointer to a direct command queue (refer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12commandqueue">ID3D12CommandQueue</a>) . This parameter cannot be <b>NULL</b>.
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a>*</b>
     * 
     * A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a> structure for the swap-chain description. This parameter cannot be <b>NULL</b>.
     * @returns {IDXGISwapChain} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>**</b>
     * 
     * A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a> interface for the swap chain that <b>CreateSwapChain</b> creates.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgifactory-createswapchain
     */
    CreateSwapChain(pDevice, pDesc) {
        result := ComCall(10, this, "ptr", pDevice, "ptr", pDesc, "ptr*", &ppSwapChain := 0, "int")
        return IDXGISwapChain(ppSwapChain)
    }

    /**
     * Create an adapter interface that represents a software adapter.
     * @param {HMODULE} Module Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a></b>
     * 
     * Handle to the software adapter's dll. HMODULE can be obtained with <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a> or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>.
     * @returns {IDXGIAdapter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>**</b>
     * 
     * Address of a pointer to an adapter (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>).
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgifactory-createsoftwareadapter
     */
    CreateSoftwareAdapter(Module) {
        Module := Module is Win32Handle ? NumGet(Module, "ptr") : Module

        result := ComCall(11, this, "ptr", Module, "ptr*", &ppAdapter := 0, "HRESULT")
        return IDXGIAdapter(ppAdapter)
    }
}
