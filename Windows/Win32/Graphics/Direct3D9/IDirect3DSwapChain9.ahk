#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DSurface9.ahk
#Include .\IDirect3DDevice9.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirect3DSwapChain9 interface to manipulate a swap chain.
 * @remarks
 * 
  * There is always at least one swap chain for each device, known as the implicit swap chain. However, an additional swap chain for rendering multiple views from the same device can be created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createadditionalswapchain">IDirect3DDevice9::CreateAdditionalSwapChain</a> method.
  * 
  * This interface, like all COM interfaces, inherits from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
  * 
  * The LPDIRECT3DSWAPCHAIN9 and PDIRECT3DSWAPCHAIN9 types are defined as pointers to the <b>IDirect3DSwapChain9</b> interface. 
  *     
  * 
  * 
  * 
  * 
  * 
  * ```
  * 
  * typedef struct IDirect3DSwapChain9 *LPDIRECT3DSWAPCHAIN9, *PDIRECT3DSWAPCHAIN9;
  * 
  * ```
  * 
  * 
  * Note the application should ensure that its associated device window is visible when its swapchain(s) is in fullscreen mode. Invisible windows cannot receive user mode events and invisible fullscreen windows will interfere with other windowed mode applications' presentation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dswapchain9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DSwapChain9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DSwapChain9
     * @type {Guid}
     */
    static IID => Guid("{794950f2-adfc-458a-905e-10a10b0b503b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Present", "GetFrontBufferData", "GetBackBuffer", "GetRasterStatus", "GetDisplayMode", "GetDevice", "GetPresentParameters"]

    /**
     * 
     * @param {Pointer<RECT>} pSourceRect 
     * @param {Pointer<RECT>} pDestRect 
     * @param {HWND} hDestWindowOverride 
     * @param {Pointer<RGNDATA>} pDirtyRegion 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dswapchain9-present
     */
    Present(pSourceRect, pDestRect, hDestWindowOverride, pDirtyRegion, dwFlags) {
        hDestWindowOverride := hDestWindowOverride is Win32Handle ? NumGet(hDestWindowOverride, "ptr") : hDestWindowOverride

        result := ComCall(3, this, "ptr", pSourceRect, "ptr", pDestRect, "ptr", hDestWindowOverride, "ptr", pDirtyRegion, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DSurface9} pDestSurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dswapchain9-getfrontbufferdata
     */
    GetFrontBufferData(pDestSurface) {
        result := ComCall(4, this, "ptr", pDestSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iBackBuffer 
     * @param {Integer} Type 
     * @returns {IDirect3DSurface9} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dswapchain9-getbackbuffer
     */
    GetBackBuffer(iBackBuffer, Type) {
        result := ComCall(5, this, "uint", iBackBuffer, "int", Type, "ptr*", &ppBackBuffer := 0, "HRESULT")
        return IDirect3DSurface9(ppBackBuffer)
    }

    /**
     * 
     * @param {Pointer<D3DRASTER_STATUS>} pRasterStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dswapchain9-getrasterstatus
     */
    GetRasterStatus(pRasterStatus) {
        result := ComCall(6, this, "ptr", pRasterStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DDISPLAYMODE>} pMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dswapchain9-getdisplaymode
     */
    GetDisplayMode(pMode) {
        result := ComCall(7, this, "ptr", pMode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDirect3DDevice9} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dswapchain9-getdevice
     */
    GetDevice() {
        result := ComCall(8, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IDirect3DDevice9(ppDevice)
    }

    /**
     * 
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dswapchain9-getpresentparameters
     */
    GetPresentParameters(pPresentationParameters) {
        result := ComCall(9, this, "ptr", pPresentationParameters, "HRESULT")
        return result
    }
}
