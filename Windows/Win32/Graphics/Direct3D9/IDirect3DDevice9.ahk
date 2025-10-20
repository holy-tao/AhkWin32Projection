#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirect3DDevice9 interface to perform DrawPrimitive-based rendering, create resources, work with system-level variables, adjust gamma ramp levels, work with palettes, and create shaders.
 * @remarks
 * 
  * The <b>IDirect3DDevice9</b> interface is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">IDirect3D9::CreateDevice</a> method.
  * 
  * This interface, like all COM interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods.
  * 
  * The LPDIRECT3DDEVICE9 and PDIRECT3DDEVICE9 types are defined as pointers to the <b>IDirect3DDevice9</b> interface.
  * 
  * 
  * ```
  * 
  * typedef struct IDirect3DDevice9 *LPDIRECT3DDEVICE9, *PDIRECT3DDEVICE9;
  * 
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3ddevice9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DDevice9 extends IUnknown{
    /**
     * The interface identifier for IDirect3DDevice9
     * @type {Guid}
     */
    static IID => Guid("{d0223b96-bf7a-43fd-92bd-a43b0d82b9eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    TestCooperativeLevel() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAvailableTextureMem() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EvictManagedResources() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3D9>} ppD3D9 
     * @returns {HRESULT} 
     */
    GetDirect3D(ppD3D9) {
        result := ComCall(6, this, "ptr", ppD3D9, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetDeviceCaps function retrieves device-specific information for the specified device.
     * @param {Pointer<D3DCAPS9>} pCaps 
     * @returns {HRESULT} The return value specifies the value of the desired item.
     * 
     * When <i>nIndex</i> is BITSPIXEL and the device has 15bpp or 16bpp, the return value is 16.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getdevicecaps
     */
    GetDeviceCaps(pCaps) {
        result := ComCall(7, this, "ptr", pCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Pointer<D3DDISPLAYMODE>} pMode 
     * @returns {HRESULT} 
     */
    GetDisplayMode(iSwapChain, pMode) {
        result := ComCall(8, this, "uint", iSwapChain, "ptr", pMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3DDEVICE_CREATION_PARAMETERS>} pParameters 
     * @returns {HRESULT} 
     */
    GetCreationParameters(pParameters) {
        result := ComCall(9, this, "ptr", pParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} XHotSpot 
     * @param {Integer} YHotSpot 
     * @param {Pointer<IDirect3DSurface9>} pCursorBitmap 
     * @returns {HRESULT} 
     */
    SetCursorProperties(XHotSpot, YHotSpot, pCursorBitmap) {
        result := ComCall(10, this, "uint", XHotSpot, "uint", YHotSpot, "ptr", pCursorBitmap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} X 
     * @param {Integer} Y 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     */
    SetCursorPosition(X, Y, Flags) {
        ComCall(11, this, "int", X, "int", Y, "uint", Flags)
        return result
    }

    /**
     * Displays or hides the cursor.
     * @param {BOOL} bShow Type: <b>BOOL</b>
     * 
     * If <i>bShow</i> is <b>TRUE</b>, the display count is incremented by one. If <i>bShow</i> is <b>FALSE</b>, the display count is decremented by one.
     * @returns {BOOL} Type: <b>int</b>
     * 
     * The return value specifies the new display counter.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-showcursor
     */
    ShowCursor(bShow) {
        result := ComCall(12, this, "int", bShow, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters 
     * @param {Pointer<IDirect3DSwapChain9>} pSwapChain 
     * @returns {HRESULT} 
     */
    CreateAdditionalSwapChain(pPresentationParameters, pSwapChain) {
        result := ComCall(13, this, "ptr", pPresentationParameters, "ptr", pSwapChain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Pointer<IDirect3DSwapChain9>} pSwapChain 
     * @returns {HRESULT} 
     */
    GetSwapChain(iSwapChain, pSwapChain) {
        result := ComCall(14, this, "uint", iSwapChain, "ptr", pSwapChain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberOfSwapChains() {
        result := ComCall(15, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters 
     * @returns {HRESULT} 
     */
    Reset(pPresentationParameters) {
        result := ComCall(16, this, "ptr", pPresentationParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSourceRect 
     * @param {Pointer<RECT>} pDestRect 
     * @param {HWND} hDestWindowOverride 
     * @param {Pointer<RGNDATA>} pDirtyRegion 
     * @returns {HRESULT} 
     */
    Present(pSourceRect, pDestRect, hDestWindowOverride, pDirtyRegion) {
        hDestWindowOverride := hDestWindowOverride is Win32Handle ? NumGet(hDestWindowOverride, "ptr") : hDestWindowOverride

        result := ComCall(17, this, "ptr", pSourceRect, "ptr", pDestRect, "ptr", hDestWindowOverride, "ptr", pDirtyRegion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Integer} iBackBuffer 
     * @param {Integer} Type 
     * @param {Pointer<IDirect3DSurface9>} ppBackBuffer 
     * @returns {HRESULT} 
     */
    GetBackBuffer(iSwapChain, iBackBuffer, Type, ppBackBuffer) {
        result := ComCall(18, this, "uint", iSwapChain, "uint", iBackBuffer, "int", Type, "ptr", ppBackBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Pointer<D3DRASTER_STATUS>} pRasterStatus 
     * @returns {HRESULT} 
     */
    GetRasterStatus(iSwapChain, pRasterStatus) {
        result := ComCall(19, this, "uint", iSwapChain, "ptr", pRasterStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bEnableDialogs 
     * @returns {HRESULT} 
     */
    SetDialogBoxMode(bEnableDialogs) {
        result := ComCall(20, this, "int", bEnableDialogs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Integer} Flags 
     * @param {Pointer<D3DGAMMARAMP>} pRamp 
     * @returns {String} Nothing - always returns an empty string
     */
    SetGammaRamp(iSwapChain, Flags, pRamp) {
        ComCall(21, this, "uint", iSwapChain, "uint", Flags, "ptr", pRamp)
        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Pointer<D3DGAMMARAMP>} pRamp 
     * @returns {String} Nothing - always returns an empty string
     */
    GetGammaRamp(iSwapChain, pRamp) {
        ComCall(22, this, "uint", iSwapChain, "ptr", pRamp)
        return result
    }

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @param {Integer} Levels 
     * @param {Integer} Usage 
     * @param {Integer} Format 
     * @param {Integer} Pool 
     * @param {Pointer<IDirect3DTexture9>} ppTexture 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @returns {HRESULT} 
     */
    CreateTexture(Width, Height, Levels, Usage, Format, Pool, ppTexture, pSharedHandle) {
        result := ComCall(23, this, "uint", Width, "uint", Height, "uint", Levels, "uint", Usage, "uint", Format, "int", Pool, "ptr", ppTexture, "ptr", pSharedHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @param {Integer} Depth 
     * @param {Integer} Levels 
     * @param {Integer} Usage 
     * @param {Integer} Format 
     * @param {Integer} Pool 
     * @param {Pointer<IDirect3DVolumeTexture9>} ppVolumeTexture 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @returns {HRESULT} 
     */
    CreateVolumeTexture(Width, Height, Depth, Levels, Usage, Format, Pool, ppVolumeTexture, pSharedHandle) {
        result := ComCall(24, this, "uint", Width, "uint", Height, "uint", Depth, "uint", Levels, "uint", Usage, "uint", Format, "int", Pool, "ptr", ppVolumeTexture, "ptr", pSharedHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EdgeLength 
     * @param {Integer} Levels 
     * @param {Integer} Usage 
     * @param {Integer} Format 
     * @param {Integer} Pool 
     * @param {Pointer<IDirect3DCubeTexture9>} ppCubeTexture 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @returns {HRESULT} 
     */
    CreateCubeTexture(EdgeLength, Levels, Usage, Format, Pool, ppCubeTexture, pSharedHandle) {
        result := ComCall(25, this, "uint", EdgeLength, "uint", Levels, "uint", Usage, "uint", Format, "int", Pool, "ptr", ppCubeTexture, "ptr", pSharedHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Length 
     * @param {Integer} Usage 
     * @param {Integer} FVF 
     * @param {Integer} Pool 
     * @param {Pointer<IDirect3DVertexBuffer9>} ppVertexBuffer 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @returns {HRESULT} 
     */
    CreateVertexBuffer(Length, Usage, FVF, Pool, ppVertexBuffer, pSharedHandle) {
        result := ComCall(26, this, "uint", Length, "uint", Usage, "uint", FVF, "int", Pool, "ptr", ppVertexBuffer, "ptr", pSharedHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Length 
     * @param {Integer} Usage 
     * @param {Integer} Format 
     * @param {Integer} Pool 
     * @param {Pointer<IDirect3DIndexBuffer9>} ppIndexBuffer 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @returns {HRESULT} 
     */
    CreateIndexBuffer(Length, Usage, Format, Pool, ppIndexBuffer, pSharedHandle) {
        result := ComCall(27, this, "uint", Length, "uint", Usage, "uint", Format, "int", Pool, "ptr", ppIndexBuffer, "ptr", pSharedHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @param {Integer} Format 
     * @param {Integer} MultiSample 
     * @param {Integer} MultisampleQuality 
     * @param {BOOL} Lockable 
     * @param {Pointer<IDirect3DSurface9>} ppSurface 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @returns {HRESULT} 
     */
    CreateRenderTarget(Width, Height, Format, MultiSample, MultisampleQuality, Lockable, ppSurface, pSharedHandle) {
        result := ComCall(28, this, "uint", Width, "uint", Height, "uint", Format, "int", MultiSample, "uint", MultisampleQuality, "int", Lockable, "ptr", ppSurface, "ptr", pSharedHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @param {Integer} Format 
     * @param {Integer} MultiSample 
     * @param {Integer} MultisampleQuality 
     * @param {BOOL} Discard 
     * @param {Pointer<IDirect3DSurface9>} ppSurface 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @returns {HRESULT} 
     */
    CreateDepthStencilSurface(Width, Height, Format, MultiSample, MultisampleQuality, Discard, ppSurface, pSharedHandle) {
        result := ComCall(29, this, "uint", Width, "uint", Height, "uint", Format, "int", MultiSample, "uint", MultisampleQuality, "int", Discard, "ptr", ppSurface, "ptr", pSharedHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} pSourceSurface 
     * @param {Pointer<RECT>} pSourceRect 
     * @param {Pointer<IDirect3DSurface9>} pDestinationSurface 
     * @param {Pointer<POINT>} pDestPoint 
     * @returns {HRESULT} 
     */
    UpdateSurface(pSourceSurface, pSourceRect, pDestinationSurface, pDestPoint) {
        result := ComCall(30, this, "ptr", pSourceSurface, "ptr", pSourceRect, "ptr", pDestinationSurface, "ptr", pDestPoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DBaseTexture9>} pSourceTexture 
     * @param {Pointer<IDirect3DBaseTexture9>} pDestinationTexture 
     * @returns {HRESULT} 
     */
    UpdateTexture(pSourceTexture, pDestinationTexture) {
        result := ComCall(31, this, "ptr", pSourceTexture, "ptr", pDestinationTexture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} pRenderTarget 
     * @param {Pointer<IDirect3DSurface9>} pDestSurface 
     * @returns {HRESULT} 
     */
    GetRenderTargetData(pRenderTarget, pDestSurface) {
        result := ComCall(32, this, "ptr", pRenderTarget, "ptr", pDestSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Pointer<IDirect3DSurface9>} pDestSurface 
     * @returns {HRESULT} 
     */
    GetFrontBufferData(iSwapChain, pDestSurface) {
        result := ComCall(33, this, "uint", iSwapChain, "ptr", pDestSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} pSourceSurface 
     * @param {Pointer<RECT>} pSourceRect 
     * @param {Pointer<IDirect3DSurface9>} pDestSurface 
     * @param {Pointer<RECT>} pDestRect 
     * @param {Integer} Filter 
     * @returns {HRESULT} 
     */
    StretchRect(pSourceSurface, pSourceRect, pDestSurface, pDestRect, Filter) {
        result := ComCall(34, this, "ptr", pSourceSurface, "ptr", pSourceRect, "ptr", pDestSurface, "ptr", pDestRect, "int", Filter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} pSurface 
     * @param {Pointer<RECT>} pRect 
     * @param {Integer} color 
     * @returns {HRESULT} 
     */
    ColorFill(pSurface, pRect, color) {
        result := ComCall(35, this, "ptr", pSurface, "ptr", pRect, "uint", color, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @param {Integer} Format 
     * @param {Integer} Pool 
     * @param {Pointer<IDirect3DSurface9>} ppSurface 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @returns {HRESULT} 
     */
    CreateOffscreenPlainSurface(Width, Height, Format, Pool, ppSurface, pSharedHandle) {
        result := ComCall(36, this, "uint", Width, "uint", Height, "uint", Format, "int", Pool, "ptr", ppSurface, "ptr", pSharedHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RenderTargetIndex 
     * @param {Pointer<IDirect3DSurface9>} pRenderTarget 
     * @returns {HRESULT} 
     */
    SetRenderTarget(RenderTargetIndex, pRenderTarget) {
        result := ComCall(37, this, "uint", RenderTargetIndex, "ptr", pRenderTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RenderTargetIndex 
     * @param {Pointer<IDirect3DSurface9>} ppRenderTarget 
     * @returns {HRESULT} 
     */
    GetRenderTarget(RenderTargetIndex, ppRenderTarget) {
        result := ComCall(38, this, "uint", RenderTargetIndex, "ptr", ppRenderTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} pNewZStencil 
     * @returns {HRESULT} 
     */
    SetDepthStencilSurface(pNewZStencil) {
        result := ComCall(39, this, "ptr", pNewZStencil, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} ppZStencilSurface 
     * @returns {HRESULT} 
     */
    GetDepthStencilSurface(ppZStencilSurface) {
        result := ComCall(40, this, "ptr", ppZStencilSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginScene() {
        result := ComCall(41, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndScene() {
        result := ComCall(42, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<D3DRECT>} pRects 
     * @param {Integer} Flags 
     * @param {Integer} Color 
     * @param {Float} Z 
     * @param {Integer} Stencil 
     * @returns {HRESULT} 
     */
    Clear(Count, pRects, Flags, Color, Z, Stencil) {
        result := ComCall(43, this, "uint", Count, "ptr", pRects, "uint", Flags, "uint", Color, "float", Z, "uint", Stencil, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @param {Pointer<D3DMATRIX>} pMatrix 
     * @returns {HRESULT} 
     */
    SetTransform(State, pMatrix) {
        result := ComCall(44, this, "int", State, "ptr", pMatrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @param {Pointer<D3DMATRIX>} pMatrix 
     * @returns {HRESULT} 
     */
    GetTransform(State, pMatrix) {
        result := ComCall(45, this, "int", State, "ptr", pMatrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<D3DMATRIX>} param1 
     * @returns {HRESULT} 
     */
    MultiplyTransform(param0, param1) {
        result := ComCall(46, this, "int", param0, "ptr", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3DVIEWPORT9>} pViewport 
     * @returns {HRESULT} 
     */
    SetViewport(pViewport) {
        result := ComCall(47, this, "ptr", pViewport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3DVIEWPORT9>} pViewport 
     * @returns {HRESULT} 
     */
    GetViewport(pViewport) {
        result := ComCall(48, this, "ptr", pViewport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3DMATERIAL9>} pMaterial 
     * @returns {HRESULT} 
     */
    SetMaterial(pMaterial) {
        result := ComCall(49, this, "ptr", pMaterial, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3DMATERIAL9>} pMaterial 
     * @returns {HRESULT} 
     */
    GetMaterial(pMaterial) {
        result := ComCall(50, this, "ptr", pMaterial, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<D3DLIGHT9>} param1 
     * @returns {HRESULT} 
     */
    SetLight(Index, param1) {
        result := ComCall(51, this, "uint", Index, "ptr", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<D3DLIGHT9>} param1 
     * @returns {HRESULT} 
     */
    GetLight(Index, param1) {
        result := ComCall(52, this, "uint", Index, "ptr", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {BOOL} Enable 
     * @returns {HRESULT} 
     */
    LightEnable(Index, Enable) {
        result := ComCall(53, this, "uint", Index, "int", Enable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<BOOL>} pEnable 
     * @returns {HRESULT} 
     */
    GetLightEnable(Index, pEnable) {
        result := ComCall(54, this, "uint", Index, "ptr", pEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Single>} pPlane 
     * @returns {HRESULT} 
     */
    SetClipPlane(Index, pPlane) {
        result := ComCall(55, this, "uint", Index, "float*", pPlane, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Single>} pPlane 
     * @returns {HRESULT} 
     */
    GetClipPlane(Index, pPlane) {
        result := ComCall(56, this, "uint", Index, "float*", pPlane, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetRenderState(State, Value) {
        result := ComCall(57, this, "int", State, "uint", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @param {Pointer<UInt32>} pValue 
     * @returns {HRESULT} 
     */
    GetRenderState(State, pValue) {
        result := ComCall(58, this, "int", State, "uint*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<IDirect3DStateBlock9>} ppSB 
     * @returns {HRESULT} 
     */
    CreateStateBlock(Type, ppSB) {
        result := ComCall(59, this, "int", Type, "ptr", ppSB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BeginStateBlock() {
        result := ComCall(60, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DStateBlock9>} ppSB 
     * @returns {HRESULT} 
     */
    EndStateBlock(ppSB) {
        result := ComCall(61, this, "ptr", ppSB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3DCLIPSTATUS9>} pClipStatus 
     * @returns {HRESULT} 
     */
    SetClipStatus(pClipStatus) {
        result := ComCall(62, this, "ptr", pClipStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3DCLIPSTATUS9>} pClipStatus 
     * @returns {HRESULT} 
     */
    GetClipStatus(pClipStatus) {
        result := ComCall(63, this, "ptr", pClipStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Stage 
     * @param {Pointer<IDirect3DBaseTexture9>} ppTexture 
     * @returns {HRESULT} 
     */
    GetTexture(Stage, ppTexture) {
        result := ComCall(64, this, "uint", Stage, "ptr", ppTexture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Stage 
     * @param {Pointer<IDirect3DBaseTexture9>} pTexture 
     * @returns {HRESULT} 
     */
    SetTexture(Stage, pTexture) {
        result := ComCall(65, this, "uint", Stage, "ptr", pTexture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Stage 
     * @param {Integer} Type 
     * @param {Pointer<UInt32>} pValue 
     * @returns {HRESULT} 
     */
    GetTextureStageState(Stage, Type, pValue) {
        result := ComCall(66, this, "uint", Stage, "int", Type, "uint*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Stage 
     * @param {Integer} Type 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetTextureStageState(Stage, Type, Value) {
        result := ComCall(67, this, "uint", Stage, "int", Type, "uint", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Sampler 
     * @param {Integer} Type 
     * @param {Pointer<UInt32>} pValue 
     * @returns {HRESULT} 
     */
    GetSamplerState(Sampler, Type, pValue) {
        result := ComCall(68, this, "uint", Sampler, "int", Type, "uint*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Sampler 
     * @param {Integer} Type 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetSamplerState(Sampler, Type, Value) {
        result := ComCall(69, this, "uint", Sampler, "int", Type, "uint", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pNumPasses 
     * @returns {HRESULT} 
     */
    ValidateDevice(pNumPasses) {
        result := ComCall(70, this, "uint*", pNumPasses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The SetPaletteEntries function sets RGB (red, green, blue) color values and flags in a range of entries in a logical palette.
     * @param {Integer} PaletteNumber 
     * @param {Pointer<PALETTEENTRY>} pEntries 
     * @returns {HRESULT} If the function succeeds, the return value is the number of entries that were set in the logical palette.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setpaletteentries
     */
    SetPaletteEntries(PaletteNumber, pEntries) {
        result := ComCall(71, this, "uint", PaletteNumber, "ptr", pEntries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetPaletteEntries function retrieves a specified range of palette entries from the given logical palette.
     * @param {Integer} PaletteNumber 
     * @param {Pointer<PALETTEENTRY>} pEntries 
     * @returns {HRESULT} If the function succeeds and the handle to the logical palette is a valid pointer (not <b>NULL</b>), the return value is the number of entries retrieved from the logical palette. If the function succeeds and handle to the logical palette is <b>NULL</b>, the return value is the number of entries in the given palette.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpaletteentries
     */
    GetPaletteEntries(PaletteNumber, pEntries) {
        result := ComCall(72, this, "uint", PaletteNumber, "ptr", pEntries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PaletteNumber 
     * @returns {HRESULT} 
     */
    SetCurrentTexturePalette(PaletteNumber) {
        result := ComCall(73, this, "uint", PaletteNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} PaletteNumber 
     * @returns {HRESULT} 
     */
    GetCurrentTexturePalette(PaletteNumber) {
        result := ComCall(74, this, "uint*", PaletteNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     */
    SetScissorRect(pRect) {
        result := ComCall(75, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     */
    GetScissorRect(pRect) {
        result := ComCall(76, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bSoftware 
     * @returns {HRESULT} 
     */
    SetSoftwareVertexProcessing(bSoftware) {
        result := ComCall(77, this, "int", bSoftware, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetSoftwareVertexProcessing() {
        result := ComCall(78, this, "int")
        return result
    }

    /**
     * 
     * @param {Float} nSegments 
     * @returns {HRESULT} 
     */
    SetNPatchMode(nSegments) {
        result := ComCall(79, this, "float", nSegments, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetNPatchMode() {
        result := ComCall(80, this, "float")
        return result
    }

    /**
     * 
     * @param {Integer} PrimitiveType 
     * @param {Integer} StartVertex 
     * @param {Integer} PrimitiveCount 
     * @returns {HRESULT} 
     */
    DrawPrimitive(PrimitiveType, StartVertex, PrimitiveCount) {
        result := ComCall(81, this, "int", PrimitiveType, "uint", StartVertex, "uint", PrimitiveCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} BaseVertexIndex 
     * @param {Integer} MinVertexIndex 
     * @param {Integer} NumVertices 
     * @param {Integer} startIndex 
     * @param {Integer} primCount 
     * @returns {HRESULT} 
     */
    DrawIndexedPrimitive(param0, BaseVertexIndex, MinVertexIndex, NumVertices, startIndex, primCount) {
        result := ComCall(82, this, "int", param0, "int", BaseVertexIndex, "uint", MinVertexIndex, "uint", NumVertices, "uint", startIndex, "uint", primCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PrimitiveType 
     * @param {Integer} PrimitiveCount 
     * @param {Pointer<Void>} pVertexStreamZeroData 
     * @param {Integer} VertexStreamZeroStride 
     * @returns {HRESULT} 
     */
    DrawPrimitiveUP(PrimitiveType, PrimitiveCount, pVertexStreamZeroData, VertexStreamZeroStride) {
        result := ComCall(83, this, "int", PrimitiveType, "uint", PrimitiveCount, "ptr", pVertexStreamZeroData, "uint", VertexStreamZeroStride, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PrimitiveType 
     * @param {Integer} MinVertexIndex 
     * @param {Integer} NumVertices 
     * @param {Integer} PrimitiveCount 
     * @param {Pointer<Void>} pIndexData 
     * @param {Integer} IndexDataFormat 
     * @param {Pointer<Void>} pVertexStreamZeroData 
     * @param {Integer} VertexStreamZeroStride 
     * @returns {HRESULT} 
     */
    DrawIndexedPrimitiveUP(PrimitiveType, MinVertexIndex, NumVertices, PrimitiveCount, pIndexData, IndexDataFormat, pVertexStreamZeroData, VertexStreamZeroStride) {
        result := ComCall(84, this, "int", PrimitiveType, "uint", MinVertexIndex, "uint", NumVertices, "uint", PrimitiveCount, "ptr", pIndexData, "uint", IndexDataFormat, "ptr", pVertexStreamZeroData, "uint", VertexStreamZeroStride, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} SrcStartIndex 
     * @param {Integer} DestIndex 
     * @param {Integer} VertexCount 
     * @param {Pointer<IDirect3DVertexBuffer9>} pDestBuffer 
     * @param {Pointer<IDirect3DVertexDeclaration9>} pVertexDecl 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    ProcessVertices(SrcStartIndex, DestIndex, VertexCount, pDestBuffer, pVertexDecl, Flags) {
        result := ComCall(85, this, "uint", SrcStartIndex, "uint", DestIndex, "uint", VertexCount, "ptr", pDestBuffer, "ptr", pVertexDecl, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3DVERTEXELEMENT9>} pVertexElements 
     * @param {Pointer<IDirect3DVertexDeclaration9>} ppDecl 
     * @returns {HRESULT} 
     */
    CreateVertexDeclaration(pVertexElements, ppDecl) {
        result := ComCall(86, this, "ptr", pVertexElements, "ptr", ppDecl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DVertexDeclaration9>} pDecl 
     * @returns {HRESULT} 
     */
    SetVertexDeclaration(pDecl) {
        result := ComCall(87, this, "ptr", pDecl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DVertexDeclaration9>} ppDecl 
     * @returns {HRESULT} 
     */
    GetVertexDeclaration(ppDecl) {
        result := ComCall(88, this, "ptr", ppDecl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FVF 
     * @returns {HRESULT} 
     */
    SetFVF(FVF) {
        result := ComCall(89, this, "uint", FVF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFVF 
     * @returns {HRESULT} 
     */
    GetFVF(pFVF) {
        result := ComCall(90, this, "uint*", pFVF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFunction 
     * @param {Pointer<IDirect3DVertexShader9>} ppShader 
     * @returns {HRESULT} 
     */
    CreateVertexShader(pFunction, ppShader) {
        result := ComCall(91, this, "uint*", pFunction, "ptr", ppShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DVertexShader9>} pShader 
     * @returns {HRESULT} 
     */
    SetVertexShader(pShader) {
        result := ComCall(92, this, "ptr", pShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DVertexShader9>} ppShader 
     * @returns {HRESULT} 
     */
    GetVertexShader(ppShader) {
        result := ComCall(93, this, "ptr", ppShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Single>} pConstantData 
     * @param {Integer} Vector4fCount 
     * @returns {HRESULT} 
     */
    SetVertexShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        result := ComCall(94, this, "uint", StartRegister, "float*", pConstantData, "uint", Vector4fCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Single>} pConstantData 
     * @param {Integer} Vector4fCount 
     * @returns {HRESULT} 
     */
    GetVertexShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        result := ComCall(95, this, "uint", StartRegister, "float*", pConstantData, "uint", Vector4fCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Int32>} pConstantData 
     * @param {Integer} Vector4iCount 
     * @returns {HRESULT} 
     */
    SetVertexShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        result := ComCall(96, this, "uint", StartRegister, "int*", pConstantData, "uint", Vector4iCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Int32>} pConstantData 
     * @param {Integer} Vector4iCount 
     * @returns {HRESULT} 
     */
    GetVertexShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        result := ComCall(97, this, "uint", StartRegister, "int*", pConstantData, "uint", Vector4iCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<BOOL>} pConstantData 
     * @param {Integer} BoolCount 
     * @returns {HRESULT} 
     */
    SetVertexShaderConstantB(StartRegister, pConstantData, BoolCount) {
        result := ComCall(98, this, "uint", StartRegister, "ptr", pConstantData, "uint", BoolCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<BOOL>} pConstantData 
     * @param {Integer} BoolCount 
     * @returns {HRESULT} 
     */
    GetVertexShaderConstantB(StartRegister, pConstantData, BoolCount) {
        result := ComCall(99, this, "uint", StartRegister, "ptr", pConstantData, "uint", BoolCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StreamNumber 
     * @param {Pointer<IDirect3DVertexBuffer9>} pStreamData 
     * @param {Integer} OffsetInBytes 
     * @param {Integer} Stride 
     * @returns {HRESULT} 
     */
    SetStreamSource(StreamNumber, pStreamData, OffsetInBytes, Stride) {
        result := ComCall(100, this, "uint", StreamNumber, "ptr", pStreamData, "uint", OffsetInBytes, "uint", Stride, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StreamNumber 
     * @param {Pointer<IDirect3DVertexBuffer9>} ppStreamData 
     * @param {Pointer<UInt32>} pOffsetInBytes 
     * @param {Pointer<UInt32>} pStride 
     * @returns {HRESULT} 
     */
    GetStreamSource(StreamNumber, ppStreamData, pOffsetInBytes, pStride) {
        result := ComCall(101, this, "uint", StreamNumber, "ptr", ppStreamData, "uint*", pOffsetInBytes, "uint*", pStride, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StreamNumber 
     * @param {Integer} Setting 
     * @returns {HRESULT} 
     */
    SetStreamSourceFreq(StreamNumber, Setting) {
        result := ComCall(102, this, "uint", StreamNumber, "uint", Setting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StreamNumber 
     * @param {Pointer<UInt32>} pSetting 
     * @returns {HRESULT} 
     */
    GetStreamSourceFreq(StreamNumber, pSetting) {
        result := ComCall(103, this, "uint", StreamNumber, "uint*", pSetting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DIndexBuffer9>} pIndexData 
     * @returns {HRESULT} 
     */
    SetIndices(pIndexData) {
        result := ComCall(104, this, "ptr", pIndexData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DIndexBuffer9>} ppIndexData 
     * @returns {HRESULT} 
     */
    GetIndices(ppIndexData) {
        result := ComCall(105, this, "ptr", ppIndexData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFunction 
     * @param {Pointer<IDirect3DPixelShader9>} ppShader 
     * @returns {HRESULT} 
     */
    CreatePixelShader(pFunction, ppShader) {
        result := ComCall(106, this, "uint*", pFunction, "ptr", ppShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DPixelShader9>} pShader 
     * @returns {HRESULT} 
     */
    SetPixelShader(pShader) {
        result := ComCall(107, this, "ptr", pShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DPixelShader9>} ppShader 
     * @returns {HRESULT} 
     */
    GetPixelShader(ppShader) {
        result := ComCall(108, this, "ptr", ppShader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Single>} pConstantData 
     * @param {Integer} Vector4fCount 
     * @returns {HRESULT} 
     */
    SetPixelShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        result := ComCall(109, this, "uint", StartRegister, "float*", pConstantData, "uint", Vector4fCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Single>} pConstantData 
     * @param {Integer} Vector4fCount 
     * @returns {HRESULT} 
     */
    GetPixelShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        result := ComCall(110, this, "uint", StartRegister, "float*", pConstantData, "uint", Vector4fCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Int32>} pConstantData 
     * @param {Integer} Vector4iCount 
     * @returns {HRESULT} 
     */
    SetPixelShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        result := ComCall(111, this, "uint", StartRegister, "int*", pConstantData, "uint", Vector4iCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Int32>} pConstantData 
     * @param {Integer} Vector4iCount 
     * @returns {HRESULT} 
     */
    GetPixelShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        result := ComCall(112, this, "uint", StartRegister, "int*", pConstantData, "uint", Vector4iCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<BOOL>} pConstantData 
     * @param {Integer} BoolCount 
     * @returns {HRESULT} 
     */
    SetPixelShaderConstantB(StartRegister, pConstantData, BoolCount) {
        result := ComCall(113, this, "uint", StartRegister, "ptr", pConstantData, "uint", BoolCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<BOOL>} pConstantData 
     * @param {Integer} BoolCount 
     * @returns {HRESULT} 
     */
    GetPixelShaderConstantB(StartRegister, pConstantData, BoolCount) {
        result := ComCall(114, this, "uint", StartRegister, "ptr", pConstantData, "uint", BoolCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Pointer<Single>} pNumSegs 
     * @param {Pointer<D3DRECTPATCH_INFO>} pRectPatchInfo 
     * @returns {HRESULT} 
     */
    DrawRectPatch(Handle, pNumSegs, pRectPatchInfo) {
        result := ComCall(115, this, "uint", Handle, "float*", pNumSegs, "ptr", pRectPatchInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Pointer<Single>} pNumSegs 
     * @param {Pointer<D3DTRIPATCH_INFO>} pTriPatchInfo 
     * @returns {HRESULT} 
     */
    DrawTriPatch(Handle, pNumSegs, pTriPatchInfo) {
        result := ComCall(116, this, "uint", Handle, "float*", pNumSegs, "ptr", pTriPatchInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @returns {HRESULT} 
     */
    DeletePatch(Handle) {
        result := ComCall(117, this, "uint", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<IDirect3DQuery9>} ppQuery 
     * @returns {HRESULT} 
     */
    CreateQuery(Type, ppQuery) {
        result := ComCall(118, this, "int", Type, "ptr", ppQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
