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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TestCooperativeLevel", "GetAvailableTextureMem", "EvictManagedResources", "GetDirect3D", "GetDeviceCaps", "GetDisplayMode", "GetCreationParameters", "SetCursorProperties", "SetCursorPosition", "ShowCursor", "CreateAdditionalSwapChain", "GetSwapChain", "GetNumberOfSwapChains", "Reset", "Present", "GetBackBuffer", "GetRasterStatus", "SetDialogBoxMode", "SetGammaRamp", "GetGammaRamp", "CreateTexture", "CreateVolumeTexture", "CreateCubeTexture", "CreateVertexBuffer", "CreateIndexBuffer", "CreateRenderTarget", "CreateDepthStencilSurface", "UpdateSurface", "UpdateTexture", "GetRenderTargetData", "GetFrontBufferData", "StretchRect", "ColorFill", "CreateOffscreenPlainSurface", "SetRenderTarget", "GetRenderTarget", "SetDepthStencilSurface", "GetDepthStencilSurface", "BeginScene", "EndScene", "Clear", "SetTransform", "GetTransform", "MultiplyTransform", "SetViewport", "GetViewport", "SetMaterial", "GetMaterial", "SetLight", "GetLight", "LightEnable", "GetLightEnable", "SetClipPlane", "GetClipPlane", "SetRenderState", "GetRenderState", "CreateStateBlock", "BeginStateBlock", "EndStateBlock", "SetClipStatus", "GetClipStatus", "GetTexture", "SetTexture", "GetTextureStageState", "SetTextureStageState", "GetSamplerState", "SetSamplerState", "ValidateDevice", "SetPaletteEntries", "GetPaletteEntries", "SetCurrentTexturePalette", "GetCurrentTexturePalette", "SetScissorRect", "GetScissorRect", "SetSoftwareVertexProcessing", "GetSoftwareVertexProcessing", "SetNPatchMode", "GetNPatchMode", "DrawPrimitive", "DrawIndexedPrimitive", "DrawPrimitiveUP", "DrawIndexedPrimitiveUP", "ProcessVertices", "CreateVertexDeclaration", "SetVertexDeclaration", "GetVertexDeclaration", "SetFVF", "GetFVF", "CreateVertexShader", "SetVertexShader", "GetVertexShader", "SetVertexShaderConstantF", "GetVertexShaderConstantF", "SetVertexShaderConstantI", "GetVertexShaderConstantI", "SetVertexShaderConstantB", "GetVertexShaderConstantB", "SetStreamSource", "GetStreamSource", "SetStreamSourceFreq", "GetStreamSourceFreq", "SetIndices", "GetIndices", "CreatePixelShader", "SetPixelShader", "GetPixelShader", "SetPixelShaderConstantF", "GetPixelShaderConstantF", "SetPixelShaderConstantI", "GetPixelShaderConstantI", "SetPixelShaderConstantB", "GetPixelShaderConstantB", "DrawRectPatch", "DrawTriPatch", "DeletePatch", "CreateQuery"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-testcooperativelevel
     */
    TestCooperativeLevel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getavailabletexturemem
     */
    GetAvailableTextureMem() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-evictmanagedresources
     */
    EvictManagedResources() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3D9>} ppD3D9 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getdirect3d
     */
    GetDirect3D(ppD3D9) {
        result := ComCall(6, this, "ptr*", ppD3D9, "HRESULT")
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
        result := ComCall(7, this, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Pointer<D3DDISPLAYMODE>} pMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getdisplaymode
     */
    GetDisplayMode(iSwapChain, pMode) {
        result := ComCall(8, this, "uint", iSwapChain, "ptr", pMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DDEVICE_CREATION_PARAMETERS>} pParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getcreationparameters
     */
    GetCreationParameters(pParameters) {
        result := ComCall(9, this, "ptr", pParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} XHotSpot 
     * @param {Integer} YHotSpot 
     * @param {IDirect3DSurface9} pCursorBitmap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setcursorproperties
     */
    SetCursorProperties(XHotSpot, YHotSpot, pCursorBitmap) {
        result := ComCall(10, this, "uint", XHotSpot, "uint", YHotSpot, "ptr", pCursorBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} X 
     * @param {Integer} Y 
     * @param {Integer} Flags 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setcursorposition
     */
    SetCursorPosition(X, Y, Flags) {
        ComCall(11, this, "int", X, "int", Y, "uint", Flags)
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createadditionalswapchain
     */
    CreateAdditionalSwapChain(pPresentationParameters, pSwapChain) {
        result := ComCall(13, this, "ptr", pPresentationParameters, "ptr*", pSwapChain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Pointer<IDirect3DSwapChain9>} pSwapChain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getswapchain
     */
    GetSwapChain(iSwapChain, pSwapChain) {
        result := ComCall(14, this, "uint", iSwapChain, "ptr*", pSwapChain, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getnumberofswapchains
     */
    GetNumberOfSwapChains() {
        result := ComCall(15, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-reset
     */
    Reset(pPresentationParameters) {
        result := ComCall(16, this, "ptr", pPresentationParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSourceRect 
     * @param {Pointer<RECT>} pDestRect 
     * @param {HWND} hDestWindowOverride 
     * @param {Pointer<RGNDATA>} pDirtyRegion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-present
     */
    Present(pSourceRect, pDestRect, hDestWindowOverride, pDirtyRegion) {
        hDestWindowOverride := hDestWindowOverride is Win32Handle ? NumGet(hDestWindowOverride, "ptr") : hDestWindowOverride

        result := ComCall(17, this, "ptr", pSourceRect, "ptr", pDestRect, "ptr", hDestWindowOverride, "ptr", pDirtyRegion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Integer} iBackBuffer 
     * @param {Integer} Type 
     * @param {Pointer<IDirect3DSurface9>} ppBackBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getbackbuffer
     */
    GetBackBuffer(iSwapChain, iBackBuffer, Type, ppBackBuffer) {
        result := ComCall(18, this, "uint", iSwapChain, "uint", iBackBuffer, "int", Type, "ptr*", ppBackBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Pointer<D3DRASTER_STATUS>} pRasterStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getrasterstatus
     */
    GetRasterStatus(iSwapChain, pRasterStatus) {
        result := ComCall(19, this, "uint", iSwapChain, "ptr", pRasterStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bEnableDialogs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setdialogboxmode
     */
    SetDialogBoxMode(bEnableDialogs) {
        result := ComCall(20, this, "int", bEnableDialogs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Integer} Flags 
     * @param {Pointer<D3DGAMMARAMP>} pRamp 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setgammaramp
     */
    SetGammaRamp(iSwapChain, Flags, pRamp) {
        ComCall(21, this, "uint", iSwapChain, "uint", Flags, "ptr", pRamp)
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {Pointer<D3DGAMMARAMP>} pRamp 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getgammaramp
     */
    GetGammaRamp(iSwapChain, pRamp) {
        ComCall(22, this, "uint", iSwapChain, "ptr", pRamp)
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createtexture
     */
    CreateTexture(Width, Height, Levels, Usage, Format, Pool, ppTexture, pSharedHandle) {
        result := ComCall(23, this, "uint", Width, "uint", Height, "uint", Levels, "uint", Usage, "uint", Format, "int", Pool, "ptr*", ppTexture, "ptr", pSharedHandle, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createvolumetexture
     */
    CreateVolumeTexture(Width, Height, Depth, Levels, Usage, Format, Pool, ppVolumeTexture, pSharedHandle) {
        result := ComCall(24, this, "uint", Width, "uint", Height, "uint", Depth, "uint", Levels, "uint", Usage, "uint", Format, "int", Pool, "ptr*", ppVolumeTexture, "ptr", pSharedHandle, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createcubetexture
     */
    CreateCubeTexture(EdgeLength, Levels, Usage, Format, Pool, ppCubeTexture, pSharedHandle) {
        result := ComCall(25, this, "uint", EdgeLength, "uint", Levels, "uint", Usage, "uint", Format, "int", Pool, "ptr*", ppCubeTexture, "ptr", pSharedHandle, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createvertexbuffer
     */
    CreateVertexBuffer(Length, Usage, FVF, Pool, ppVertexBuffer, pSharedHandle) {
        result := ComCall(26, this, "uint", Length, "uint", Usage, "uint", FVF, "int", Pool, "ptr*", ppVertexBuffer, "ptr", pSharedHandle, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createindexbuffer
     */
    CreateIndexBuffer(Length, Usage, Format, Pool, ppIndexBuffer, pSharedHandle) {
        result := ComCall(27, this, "uint", Length, "uint", Usage, "uint", Format, "int", Pool, "ptr*", ppIndexBuffer, "ptr", pSharedHandle, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createrendertarget
     */
    CreateRenderTarget(Width, Height, Format, MultiSample, MultisampleQuality, Lockable, ppSurface, pSharedHandle) {
        result := ComCall(28, this, "uint", Width, "uint", Height, "uint", Format, "int", MultiSample, "uint", MultisampleQuality, "int", Lockable, "ptr*", ppSurface, "ptr", pSharedHandle, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createdepthstencilsurface
     */
    CreateDepthStencilSurface(Width, Height, Format, MultiSample, MultisampleQuality, Discard, ppSurface, pSharedHandle) {
        result := ComCall(29, this, "uint", Width, "uint", Height, "uint", Format, "int", MultiSample, "uint", MultisampleQuality, "int", Discard, "ptr*", ppSurface, "ptr", pSharedHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DSurface9} pSourceSurface 
     * @param {Pointer<RECT>} pSourceRect 
     * @param {IDirect3DSurface9} pDestinationSurface 
     * @param {Pointer<POINT>} pDestPoint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-updatesurface
     */
    UpdateSurface(pSourceSurface, pSourceRect, pDestinationSurface, pDestPoint) {
        result := ComCall(30, this, "ptr", pSourceSurface, "ptr", pSourceRect, "ptr", pDestinationSurface, "ptr", pDestPoint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DBaseTexture9} pSourceTexture 
     * @param {IDirect3DBaseTexture9} pDestinationTexture 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-updatetexture
     */
    UpdateTexture(pSourceTexture, pDestinationTexture) {
        result := ComCall(31, this, "ptr", pSourceTexture, "ptr", pDestinationTexture, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DSurface9} pRenderTarget 
     * @param {IDirect3DSurface9} pDestSurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getrendertargetdata
     */
    GetRenderTargetData(pRenderTarget, pDestSurface) {
        result := ComCall(32, this, "ptr", pRenderTarget, "ptr", pDestSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iSwapChain 
     * @param {IDirect3DSurface9} pDestSurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getfrontbufferdata
     */
    GetFrontBufferData(iSwapChain, pDestSurface) {
        result := ComCall(33, this, "uint", iSwapChain, "ptr", pDestSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DSurface9} pSourceSurface 
     * @param {Pointer<RECT>} pSourceRect 
     * @param {IDirect3DSurface9} pDestSurface 
     * @param {Pointer<RECT>} pDestRect 
     * @param {Integer} Filter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-stretchrect
     */
    StretchRect(pSourceSurface, pSourceRect, pDestSurface, pDestRect, Filter) {
        result := ComCall(34, this, "ptr", pSourceSurface, "ptr", pSourceRect, "ptr", pDestSurface, "ptr", pDestRect, "int", Filter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DSurface9} pSurface 
     * @param {Pointer<RECT>} pRect 
     * @param {Integer} color 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-colorfill
     */
    ColorFill(pSurface, pRect, color) {
        result := ComCall(35, this, "ptr", pSurface, "ptr", pRect, "uint", color, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createoffscreenplainsurface
     */
    CreateOffscreenPlainSurface(Width, Height, Format, Pool, ppSurface, pSharedHandle) {
        result := ComCall(36, this, "uint", Width, "uint", Height, "uint", Format, "int", Pool, "ptr*", ppSurface, "ptr", pSharedHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RenderTargetIndex 
     * @param {IDirect3DSurface9} pRenderTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setrendertarget
     */
    SetRenderTarget(RenderTargetIndex, pRenderTarget) {
        result := ComCall(37, this, "uint", RenderTargetIndex, "ptr", pRenderTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RenderTargetIndex 
     * @param {Pointer<IDirect3DSurface9>} ppRenderTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getrendertarget
     */
    GetRenderTarget(RenderTargetIndex, ppRenderTarget) {
        result := ComCall(38, this, "uint", RenderTargetIndex, "ptr*", ppRenderTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DSurface9} pNewZStencil 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setdepthstencilsurface
     */
    SetDepthStencilSurface(pNewZStencil) {
        result := ComCall(39, this, "ptr", pNewZStencil, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} ppZStencilSurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getdepthstencilsurface
     */
    GetDepthStencilSurface(ppZStencilSurface) {
        result := ComCall(40, this, "ptr*", ppZStencilSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-beginscene
     */
    BeginScene() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-endscene
     */
    EndScene() {
        result := ComCall(42, this, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-clear
     */
    Clear(Count, pRects, Flags, Color, Z, Stencil) {
        result := ComCall(43, this, "uint", Count, "ptr", pRects, "uint", Flags, "uint", Color, "float", Z, "uint", Stencil, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @param {Pointer<D3DMATRIX>} pMatrix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-settransform
     */
    SetTransform(State, pMatrix) {
        result := ComCall(44, this, "int", State, "ptr", pMatrix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @param {Pointer<D3DMATRIX>} pMatrix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-gettransform
     */
    GetTransform(State, pMatrix) {
        result := ComCall(45, this, "int", State, "ptr", pMatrix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<D3DMATRIX>} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-multiplytransform
     */
    MultiplyTransform(param0, param1) {
        result := ComCall(46, this, "int", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DVIEWPORT9>} pViewport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setviewport
     */
    SetViewport(pViewport) {
        result := ComCall(47, this, "ptr", pViewport, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DVIEWPORT9>} pViewport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getviewport
     */
    GetViewport(pViewport) {
        result := ComCall(48, this, "ptr", pViewport, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DMATERIAL9>} pMaterial 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setmaterial
     */
    SetMaterial(pMaterial) {
        result := ComCall(49, this, "ptr", pMaterial, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DMATERIAL9>} pMaterial 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getmaterial
     */
    GetMaterial(pMaterial) {
        result := ComCall(50, this, "ptr", pMaterial, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<D3DLIGHT9>} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setlight
     */
    SetLight(Index, param1) {
        result := ComCall(51, this, "uint", Index, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<D3DLIGHT9>} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getlight
     */
    GetLight(Index, param1) {
        result := ComCall(52, this, "uint", Index, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {BOOL} Enable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-lightenable
     */
    LightEnable(Index, Enable) {
        result := ComCall(53, this, "uint", Index, "int", Enable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<BOOL>} pEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getlightenable
     */
    GetLightEnable(Index, pEnable) {
        result := ComCall(54, this, "uint", Index, "ptr", pEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Float>} pPlane 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setclipplane
     */
    SetClipPlane(Index, pPlane) {
        pPlaneMarshal := pPlane is VarRef ? "float*" : "ptr"

        result := ComCall(55, this, "uint", Index, pPlaneMarshal, pPlane, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Float>} pPlane 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getclipplane
     */
    GetClipPlane(Index, pPlane) {
        pPlaneMarshal := pPlane is VarRef ? "float*" : "ptr"

        result := ComCall(56, this, "uint", Index, pPlaneMarshal, pPlane, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setrenderstate
     */
    SetRenderState(State, Value) {
        result := ComCall(57, this, "int", State, "uint", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getrenderstate
     */
    GetRenderState(State, pValue) {
        pValueMarshal := pValue is VarRef ? "uint*" : "ptr"

        result := ComCall(58, this, "int", State, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<IDirect3DStateBlock9>} ppSB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createstateblock
     */
    CreateStateBlock(Type, ppSB) {
        result := ComCall(59, this, "int", Type, "ptr*", ppSB, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-beginstateblock
     */
    BeginStateBlock() {
        result := ComCall(60, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DStateBlock9>} ppSB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-endstateblock
     */
    EndStateBlock(ppSB) {
        result := ComCall(61, this, "ptr*", ppSB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DCLIPSTATUS9>} pClipStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setclipstatus
     */
    SetClipStatus(pClipStatus) {
        result := ComCall(62, this, "ptr", pClipStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DCLIPSTATUS9>} pClipStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getclipstatus
     */
    GetClipStatus(pClipStatus) {
        result := ComCall(63, this, "ptr", pClipStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Stage 
     * @param {Pointer<IDirect3DBaseTexture9>} ppTexture 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-gettexture
     */
    GetTexture(Stage, ppTexture) {
        result := ComCall(64, this, "uint", Stage, "ptr*", ppTexture, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Stage 
     * @param {IDirect3DBaseTexture9} pTexture 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-settexture
     */
    SetTexture(Stage, pTexture) {
        result := ComCall(65, this, "uint", Stage, "ptr", pTexture, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Stage 
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-gettexturestagestate
     */
    GetTextureStageState(Stage, Type, pValue) {
        pValueMarshal := pValue is VarRef ? "uint*" : "ptr"

        result := ComCall(66, this, "uint", Stage, "int", Type, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Stage 
     * @param {Integer} Type 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-settexturestagestate
     */
    SetTextureStageState(Stage, Type, Value) {
        result := ComCall(67, this, "uint", Stage, "int", Type, "uint", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Sampler 
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getsamplerstate
     */
    GetSamplerState(Sampler, Type, pValue) {
        pValueMarshal := pValue is VarRef ? "uint*" : "ptr"

        result := ComCall(68, this, "uint", Sampler, "int", Type, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Sampler 
     * @param {Integer} Type 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setsamplerstate
     */
    SetSamplerState(Sampler, Type, Value) {
        result := ComCall(69, this, "uint", Sampler, "int", Type, "uint", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pNumPasses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-validatedevice
     */
    ValidateDevice(pNumPasses) {
        pNumPassesMarshal := pNumPasses is VarRef ? "uint*" : "ptr"

        result := ComCall(70, this, pNumPassesMarshal, pNumPasses, "HRESULT")
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
        result := ComCall(71, this, "uint", PaletteNumber, "ptr", pEntries, "HRESULT")
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
        result := ComCall(72, this, "uint", PaletteNumber, "ptr", pEntries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PaletteNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setcurrenttexturepalette
     */
    SetCurrentTexturePalette(PaletteNumber) {
        result := ComCall(73, this, "uint", PaletteNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} PaletteNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getcurrenttexturepalette
     */
    GetCurrentTexturePalette(PaletteNumber) {
        PaletteNumberMarshal := PaletteNumber is VarRef ? "uint*" : "ptr"

        result := ComCall(74, this, PaletteNumberMarshal, PaletteNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setscissorrect
     */
    SetScissorRect(pRect) {
        result := ComCall(75, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getscissorrect
     */
    GetScissorRect(pRect) {
        result := ComCall(76, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bSoftware 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setsoftwarevertexprocessing
     */
    SetSoftwareVertexProcessing(bSoftware) {
        result := ComCall(77, this, "int", bSoftware, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getsoftwarevertexprocessing
     */
    GetSoftwareVertexProcessing() {
        result := ComCall(78, this, "int")
        return result
    }

    /**
     * 
     * @param {Float} nSegments 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setnpatchmode
     */
    SetNPatchMode(nSegments) {
        result := ComCall(79, this, "float", nSegments, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getnpatchmode
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-drawprimitive
     */
    DrawPrimitive(PrimitiveType, StartVertex, PrimitiveCount) {
        result := ComCall(81, this, "int", PrimitiveType, "uint", StartVertex, "uint", PrimitiveCount, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-drawindexedprimitive
     */
    DrawIndexedPrimitive(param0, BaseVertexIndex, MinVertexIndex, NumVertices, startIndex, primCount) {
        result := ComCall(82, this, "int", param0, "int", BaseVertexIndex, "uint", MinVertexIndex, "uint", NumVertices, "uint", startIndex, "uint", primCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PrimitiveType 
     * @param {Integer} PrimitiveCount 
     * @param {Pointer<Void>} pVertexStreamZeroData 
     * @param {Integer} VertexStreamZeroStride 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-drawprimitiveup
     */
    DrawPrimitiveUP(PrimitiveType, PrimitiveCount, pVertexStreamZeroData, VertexStreamZeroStride) {
        pVertexStreamZeroDataMarshal := pVertexStreamZeroData is VarRef ? "ptr" : "ptr"

        result := ComCall(83, this, "int", PrimitiveType, "uint", PrimitiveCount, pVertexStreamZeroDataMarshal, pVertexStreamZeroData, "uint", VertexStreamZeroStride, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-drawindexedprimitiveup
     */
    DrawIndexedPrimitiveUP(PrimitiveType, MinVertexIndex, NumVertices, PrimitiveCount, pIndexData, IndexDataFormat, pVertexStreamZeroData, VertexStreamZeroStride) {
        pIndexDataMarshal := pIndexData is VarRef ? "ptr" : "ptr"
        pVertexStreamZeroDataMarshal := pVertexStreamZeroData is VarRef ? "ptr" : "ptr"

        result := ComCall(84, this, "int", PrimitiveType, "uint", MinVertexIndex, "uint", NumVertices, "uint", PrimitiveCount, pIndexDataMarshal, pIndexData, "uint", IndexDataFormat, pVertexStreamZeroDataMarshal, pVertexStreamZeroData, "uint", VertexStreamZeroStride, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} SrcStartIndex 
     * @param {Integer} DestIndex 
     * @param {Integer} VertexCount 
     * @param {IDirect3DVertexBuffer9} pDestBuffer 
     * @param {IDirect3DVertexDeclaration9} pVertexDecl 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-processvertices
     */
    ProcessVertices(SrcStartIndex, DestIndex, VertexCount, pDestBuffer, pVertexDecl, Flags) {
        result := ComCall(85, this, "uint", SrcStartIndex, "uint", DestIndex, "uint", VertexCount, "ptr", pDestBuffer, "ptr", pVertexDecl, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3DVERTEXELEMENT9>} pVertexElements 
     * @param {Pointer<IDirect3DVertexDeclaration9>} ppDecl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createvertexdeclaration
     */
    CreateVertexDeclaration(pVertexElements, ppDecl) {
        result := ComCall(86, this, "ptr", pVertexElements, "ptr*", ppDecl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DVertexDeclaration9} pDecl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setvertexdeclaration
     */
    SetVertexDeclaration(pDecl) {
        result := ComCall(87, this, "ptr", pDecl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DVertexDeclaration9>} ppDecl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getvertexdeclaration
     */
    GetVertexDeclaration(ppDecl) {
        result := ComCall(88, this, "ptr*", ppDecl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FVF 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setfvf
     */
    SetFVF(FVF) {
        result := ComCall(89, this, "uint", FVF, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFVF 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getfvf
     */
    GetFVF(pFVF) {
        pFVFMarshal := pFVF is VarRef ? "uint*" : "ptr"

        result := ComCall(90, this, pFVFMarshal, pFVF, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFunction 
     * @param {Pointer<IDirect3DVertexShader9>} ppShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createvertexshader
     */
    CreateVertexShader(pFunction, ppShader) {
        pFunctionMarshal := pFunction is VarRef ? "uint*" : "ptr"

        result := ComCall(91, this, pFunctionMarshal, pFunction, "ptr*", ppShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DVertexShader9} pShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setvertexshader
     */
    SetVertexShader(pShader) {
        result := ComCall(92, this, "ptr", pShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DVertexShader9>} ppShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getvertexshader
     */
    GetVertexShader(ppShader) {
        result := ComCall(93, this, "ptr*", ppShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Float>} pConstantData 
     * @param {Integer} Vector4fCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setvertexshaderconstantf
     */
    SetVertexShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "float*" : "ptr"

        result := ComCall(94, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4fCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Float>} pConstantData 
     * @param {Integer} Vector4fCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getvertexshaderconstantf
     */
    GetVertexShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "float*" : "ptr"

        result := ComCall(95, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4fCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Integer>} pConstantData 
     * @param {Integer} Vector4iCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setvertexshaderconstanti
     */
    SetVertexShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(96, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4iCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Integer>} pConstantData 
     * @param {Integer} Vector4iCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getvertexshaderconstanti
     */
    GetVertexShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(97, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4iCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<BOOL>} pConstantData 
     * @param {Integer} BoolCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setvertexshaderconstantb
     */
    SetVertexShaderConstantB(StartRegister, pConstantData, BoolCount) {
        result := ComCall(98, this, "uint", StartRegister, "ptr", pConstantData, "uint", BoolCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<BOOL>} pConstantData 
     * @param {Integer} BoolCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getvertexshaderconstantb
     */
    GetVertexShaderConstantB(StartRegister, pConstantData, BoolCount) {
        result := ComCall(99, this, "uint", StartRegister, "ptr", pConstantData, "uint", BoolCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StreamNumber 
     * @param {IDirect3DVertexBuffer9} pStreamData 
     * @param {Integer} OffsetInBytes 
     * @param {Integer} Stride 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setstreamsource
     */
    SetStreamSource(StreamNumber, pStreamData, OffsetInBytes, Stride) {
        result := ComCall(100, this, "uint", StreamNumber, "ptr", pStreamData, "uint", OffsetInBytes, "uint", Stride, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StreamNumber 
     * @param {Pointer<IDirect3DVertexBuffer9>} ppStreamData 
     * @param {Pointer<Integer>} pOffsetInBytes 
     * @param {Pointer<Integer>} pStride 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getstreamsource
     */
    GetStreamSource(StreamNumber, ppStreamData, pOffsetInBytes, pStride) {
        pOffsetInBytesMarshal := pOffsetInBytes is VarRef ? "uint*" : "ptr"
        pStrideMarshal := pStride is VarRef ? "uint*" : "ptr"

        result := ComCall(101, this, "uint", StreamNumber, "ptr*", ppStreamData, pOffsetInBytesMarshal, pOffsetInBytes, pStrideMarshal, pStride, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StreamNumber 
     * @param {Integer} Setting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setstreamsourcefreq
     */
    SetStreamSourceFreq(StreamNumber, Setting) {
        result := ComCall(102, this, "uint", StreamNumber, "uint", Setting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StreamNumber 
     * @param {Pointer<Integer>} pSetting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getstreamsourcefreq
     */
    GetStreamSourceFreq(StreamNumber, pSetting) {
        pSettingMarshal := pSetting is VarRef ? "uint*" : "ptr"

        result := ComCall(103, this, "uint", StreamNumber, pSettingMarshal, pSetting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DIndexBuffer9} pIndexData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setindices
     */
    SetIndices(pIndexData) {
        result := ComCall(104, this, "ptr", pIndexData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DIndexBuffer9>} ppIndexData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getindices
     */
    GetIndices(ppIndexData) {
        result := ComCall(105, this, "ptr*", ppIndexData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFunction 
     * @param {Pointer<IDirect3DPixelShader9>} ppShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createpixelshader
     */
    CreatePixelShader(pFunction, ppShader) {
        pFunctionMarshal := pFunction is VarRef ? "uint*" : "ptr"

        result := ComCall(106, this, pFunctionMarshal, pFunction, "ptr*", ppShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DPixelShader9} pShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setpixelshader
     */
    SetPixelShader(pShader) {
        result := ComCall(107, this, "ptr", pShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DPixelShader9>} ppShader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getpixelshader
     */
    GetPixelShader(ppShader) {
        result := ComCall(108, this, "ptr*", ppShader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Float>} pConstantData 
     * @param {Integer} Vector4fCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setpixelshaderconstantf
     */
    SetPixelShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "float*" : "ptr"

        result := ComCall(109, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4fCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Float>} pConstantData 
     * @param {Integer} Vector4fCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getpixelshaderconstantf
     */
    GetPixelShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "float*" : "ptr"

        result := ComCall(110, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4fCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Integer>} pConstantData 
     * @param {Integer} Vector4iCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setpixelshaderconstanti
     */
    SetPixelShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(111, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4iCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<Integer>} pConstantData 
     * @param {Integer} Vector4iCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getpixelshaderconstanti
     */
    GetPixelShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(112, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4iCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<BOOL>} pConstantData 
     * @param {Integer} BoolCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setpixelshaderconstantb
     */
    SetPixelShaderConstantB(StartRegister, pConstantData, BoolCount) {
        result := ComCall(113, this, "uint", StartRegister, "ptr", pConstantData, "uint", BoolCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartRegister 
     * @param {Pointer<BOOL>} pConstantData 
     * @param {Integer} BoolCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getpixelshaderconstantb
     */
    GetPixelShaderConstantB(StartRegister, pConstantData, BoolCount) {
        result := ComCall(114, this, "uint", StartRegister, "ptr", pConstantData, "uint", BoolCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Pointer<Float>} pNumSegs 
     * @param {Pointer<D3DRECTPATCH_INFO>} pRectPatchInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-drawrectpatch
     */
    DrawRectPatch(Handle, pNumSegs, pRectPatchInfo) {
        pNumSegsMarshal := pNumSegs is VarRef ? "float*" : "ptr"

        result := ComCall(115, this, "uint", Handle, pNumSegsMarshal, pNumSegs, "ptr", pRectPatchInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Pointer<Float>} pNumSegs 
     * @param {Pointer<D3DTRIPATCH_INFO>} pTriPatchInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-drawtripatch
     */
    DrawTriPatch(Handle, pNumSegs, pTriPatchInfo) {
        pNumSegsMarshal := pNumSegs is VarRef ? "float*" : "ptr"

        result := ComCall(116, this, "uint", Handle, pNumSegsMarshal, pNumSegs, "ptr", pTriPatchInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-deletepatch
     */
    DeletePatch(Handle) {
        result := ComCall(117, this, "uint", Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<IDirect3DQuery9>} ppQuery 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createquery
     */
    CreateQuery(Type, ppQuery) {
        result := ComCall(118, this, "int", Type, "ptr*", ppQuery, "HRESULT")
        return result
    }
}
