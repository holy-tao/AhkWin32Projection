#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates swap chains for desktop media apps that use DirectComposition surfaces to decode and display video.
 * @remarks
 * 
  * To create a Microsoft DirectX Graphics Infrastructure (DXGI) media factory interface, pass <b>IDXGIFactoryMedia</b> into either the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-createdxgifactory">CreateDXGIFactory</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-createdxgifactory1">CreateDXGIFactory1</a> function or call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> from a factory object returned by <b>CreateDXGIFactory</b>, <b>CreateDXGIFactory1</b>, or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nf-dxgi1_3-createdxgifactory2">CreateDXGIFactory2</a>.
  *         
  * 
  * Because you can create a Direct3D device without creating a swap chain, you might need to retrieve the factory that is used to create the device in order to create a swap chain.
  *           You can request the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice1">IDXGIDevice1</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgidevice2">IDXGIDevice2</a>,  or  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nn-dxgi1_3-idxgidevice3">IDXGIDevice3</a> interface from the Direct3D device and then use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiobject-getparent">IDXGIObject::GetParent</a> method to locate
  *           the factory.  The following code shows how.
  *         
  * 
  * 
  * ```cpp
  * IDXGIDevice2 * pDXGIDevice;
  * hr = g_pd3dDevice->QueryInterface(__uuidof(IDXGIDevice2), (void **)&pDXGIDevice);
  *       
  * IDXGIAdapter * pDXGIAdapter;
  * hr = pDXGIDevice->GetParent(__uuidof(IDXGIAdapter), (void **)&pDXGIAdapter);
  * 
  * IDXGIFactoryMedia * pIDXGIFactory;
  * pDXGIAdapter->GetParent(__uuidof(IDXGIFactoryMedia), (void **)&pIDXGIFactory);
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nn-dxgi1_3-idxgifactorymedia
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIFactoryMedia extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIFactoryMedia
     * @type {Guid}
     */
    static IID => Guid("{41e7d1f2-a591-4f7b-a2e5-fa9c843e1c12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSwapChainForCompositionSurfaceHandle", "CreateDecodeSwapChainForCompositionSurfaceHandle"]

    /**
     * 
     * @param {IUnknown} pDevice 
     * @param {HANDLE} hSurface 
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC1>} pDesc 
     * @param {IDXGIOutput} pRestrictToOutput 
     * @param {Pointer<IDXGISwapChain1>} ppSwapChain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgifactorymedia-createswapchainforcompositionsurfacehandle
     */
    CreateSwapChainForCompositionSurfaceHandle(pDevice, hSurface, pDesc, pRestrictToOutput, ppSwapChain) {
        hSurface := hSurface is Win32Handle ? NumGet(hSurface, "ptr") : hSurface

        result := ComCall(3, this, "ptr", pDevice, "ptr", hSurface, "ptr", pDesc, "ptr", pRestrictToOutput, "ptr*", ppSwapChain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pDevice 
     * @param {HANDLE} hSurface 
     * @param {Pointer<DXGI_DECODE_SWAP_CHAIN_DESC>} pDesc 
     * @param {IDXGIResource} pYuvDecodeBuffers 
     * @param {IDXGIOutput} pRestrictToOutput 
     * @param {Pointer<IDXGIDecodeSwapChain>} ppSwapChain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgifactorymedia-createdecodeswapchainforcompositionsurfacehandle
     */
    CreateDecodeSwapChainForCompositionSurfaceHandle(pDevice, hSurface, pDesc, pYuvDecodeBuffers, pRestrictToOutput, ppSwapChain) {
        hSurface := hSurface is Win32Handle ? NumGet(hSurface, "ptr") : hSurface

        result := ComCall(4, this, "ptr", pDevice, "ptr", hSurface, "ptr", pDesc, "ptr", pYuvDecodeBuffers, "ptr", pRestrictToOutput, "ptr*", ppSwapChain, "HRESULT")
        return result
    }
}
