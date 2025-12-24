#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGISwapChain1.ahk
#Include .\IDXGIDecodeSwapChain.ahk
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
     * Creates a YUV swap chain for an existing DirectComposition surface handle.
     * @param {IUnknown} pDevice A pointer to the Direct3D device for the swap chain. This parameter cannot be <b>NULL</b>. Software drivers, like <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE_REFERENCE</a>, are not supported for composition swap chains.
     * @param {HANDLE} hSurface A handle to an existing <a href="https://docs.microsoft.com/windows/desktop/directcomp/reference">DirectComposition</a> surface. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC1>} pDesc A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1">DXGI_SWAP_CHAIN_DESC1</a> structure for the swap-chain description. This parameter cannot be <b>NULL</b>.
     * @param {IDXGIOutput} pRestrictToOutput A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> interface for the swap chain to restrict content to. If the swap chain is moved to a different output, the content is black. You can optionally set this parameter to an output target that uses <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT_RESTRICT_TO_OUTPUT</a> to restrict the content on this output. If the swap chain is moved to a different output, the content is black.
     * 
     * You must also pass the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT_RESTRICT_TO_OUTPUT</a> flag in a present call to force the content to appear blacked out on any other output. If you want to restrict the content to a different output, you must create a new swap chain. However, you can conditionally restrict content based on the <b>DXGI_PRESENT_RESTRICT_TO_OUTPUT</b> flag.
     * 
     * Set this parameter to <b>NULL</b> if you don't want to restrict content to an output target.
     * @returns {IDXGISwapChain1} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgiswapchain1">IDXGISwapChain1</a> interface for the swap chain that this method creates.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-idxgifactorymedia-createswapchainforcompositionsurfacehandle
     */
    CreateSwapChainForCompositionSurfaceHandle(pDevice, hSurface, pDesc, pRestrictToOutput) {
        hSurface := hSurface is Win32Handle ? NumGet(hSurface, "ptr") : hSurface

        result := ComCall(3, this, "ptr", pDevice, "ptr", hSurface, "ptr", pDesc, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGISwapChain1(ppSwapChain)
    }

    /**
     * Creates a YUV swap chain for an existing DirectComposition surface handle.
     * @param {IUnknown} pDevice A pointer to the Direct3D device for the swap chain. This parameter cannot be <b>NULL</b>. 
     *             Software drivers, like <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE_REFERENCE</a>, are not supported for composition swap chains.
     * @param {HANDLE} hSurface A handle to an existing <a href="https://docs.microsoft.com/windows/desktop/directcomp/reference">DirectComposition</a> surface. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<DXGI_DECODE_SWAP_CHAIN_DESC>} pDesc A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/ns-dxgi1_3-dxgi_decode_swap_chain_desc">DXGI_DECODE_SWAP_CHAIN_DESC</a> structure for the swap-chain description. 
     *             This parameter cannot be <b>NULL</b>.
     * @param {IDXGIResource} pYuvDecodeBuffers A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiresource">IDXGIResource</a> interface that represents the resource that contains the info 
     *             that <b>CreateDecodeSwapChainForCompositionSurfaceHandle</b> decodes.
     * @param {IDXGIOutput} pRestrictToOutput A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> interface for the swap chain to restrict content to. If the swap chain 
     *               is moved to a different output, the content is black. You can optionally set this parameter to an output target that 
     *               uses <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT_RESTRICT_TO_OUTPUT</a> to restrict 
     *               the content on this output. If the swap chain is moved to a different output, the content is black.
     *             
     * 
     * You must also pass the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT_RESTRICT_TO_OUTPUT</a> flag in a 
     *               present call to force the content to appear blacked out on any other output. If you want to restrict the content to a different output, you must create a new swap chain. 
     *               However, you can conditionally restrict content 
     *               based on the <b>DXGI_PRESENT_RESTRICT_TO_OUTPUT</b> flag.
     *             
     * 
     * Set this parameter to <b>NULL</b> if you don't want to restrict content to an output target.
     * @returns {IDXGIDecodeSwapChain} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nn-dxgi1_3-idxgidecodeswapchain">IDXGIDecodeSwapChain</a> interface for the 
     *             swap chain that this method creates.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nf-dxgi1_3-idxgifactorymedia-createdecodeswapchainforcompositionsurfacehandle
     */
    CreateDecodeSwapChainForCompositionSurfaceHandle(pDevice, hSurface, pDesc, pYuvDecodeBuffers, pRestrictToOutput) {
        hSurface := hSurface is Win32Handle ? NumGet(hSurface, "ptr") : hSurface

        result := ComCall(4, this, "ptr", pDevice, "ptr", hSurface, "ptr", pDesc, "ptr", pYuvDecodeBuffers, "ptr", pRestrictToOutput, "ptr*", &ppSwapChain := 0, "HRESULT")
        return IDXGIDecodeSwapChain(ppSwapChain)
    }
}
