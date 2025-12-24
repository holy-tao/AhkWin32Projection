#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3D9.ahk
#Include .\IDirect3DSwapChain9.ahk
#Include .\IDirect3DSurface9.ahk
#Include .\IDirect3DTexture9.ahk
#Include .\IDirect3DVolumeTexture9.ahk
#Include .\IDirect3DCubeTexture9.ahk
#Include .\IDirect3DVertexBuffer9.ahk
#Include .\IDirect3DIndexBuffer9.ahk
#Include .\IDirect3DStateBlock9.ahk
#Include .\IDirect3DBaseTexture9.ahk
#Include .\IDirect3DVertexDeclaration9.ahk
#Include .\IDirect3DVertexShader9.ahk
#Include .\IDirect3DPixelShader9.ahk
#Include .\IDirect3DQuery9.ahk
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
     * Reports the current cooperative-level status of the Direct3D device for a windowed or full-screen application.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK, indicating that the device is operational and the calling application can continue.
     *  If the method fails, the return value can be one of the following values: D3DERR_DEVICELOST, D3DERR_DEVICENOTRESET, D3DERR_DRIVERINTERNALERROR.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-testcooperativelevel
     */
    TestCooperativeLevel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Returns an estimate of the amount of available texture memory.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The function returns an estimate of the available texture memory.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getavailabletexturemem
     */
    GetAvailableTextureMem() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * Evicts all managed resources, including both Direct3D and driver-managed resources.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_OUTOFVIDEOMEMORY, D3DERR_COMMAND_UNPARSED.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-evictmanagedresources
     */
    EvictManagedResources() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Returns an interface to the instance of the Direct3D object that created the device.
     * @returns {IDirect3D9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a> interface, representing the interface of the Direct3D object that created the device.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getdirect3d
     */
    GetDirect3D() {
        result := ComCall(6, this, "ptr*", &ppD3D9 := 0, "HRESULT")
        return IDirect3D9(ppD3D9)
    }

    /**
     * Retrieves the capabilities of the rendering device.
     * @param {Pointer<D3DCAPS9>} pCaps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure, describing the returned device.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getdevicecaps
     */
    GetDeviceCaps(pCaps) {
        result := ComCall(7, this, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * Retrieves the display mode's spatial resolution, color resolution, and refresh frequency.
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An unsigned integer specifying the swap chain.
     * @param {Pointer<D3DDISPLAYMODE>} pMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymode">D3DDISPLAYMODE</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymode">D3DDISPLAYMODE</a> structure containing data about the display mode of the adapter. As opposed to the display mode of the device, which may not be active if the device does not own full-screen mode.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getdisplaymode
     */
    GetDisplayMode(iSwapChain, pMode) {
        result := ComCall(8, this, "uint", iSwapChain, "ptr", pMode, "HRESULT")
        return result
    }

    /**
     * Retrieves the creation parameters of the device.
     * @param {Pointer<D3DDEVICE_CREATION_PARAMETERS>} pParameters Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevice-creation-parameters">D3DDEVICE_CREATION_PARAMETERS</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevice-creation-parameters">D3DDEVICE_CREATION_PARAMETERS</a> structure, describing the creation parameters of the device.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     * 
     * 
     * D3DERR_INVALIDCALL is returned if the argument is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getcreationparameters
     */
    GetCreationParameters(pParameters) {
        result := ComCall(9, this, "ptr", pParameters, "HRESULT")
        return result
    }

    /**
     * Sets properties for the cursor.
     * @param {Integer} XHotSpot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * X-coordinate offset (in pixels) that marks the center of the cursor. The offset is relative to the upper-left corner of the cursor. When the cursor is given a new position, the image is drawn at an offset from this new position determined by subtracting the hot spot coordinates from the position.
     * @param {Integer} YHotSpot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Y-coordinate offset (in pixels) that marks the center of the cursor. The offset is relative to the upper-left corner of the cursor. When the cursor is given a new position, the image is drawn at an offset from this new position determined by subtracting the hot spot coordinates from the position.
     * @param {IDirect3DSurface9} pCursorBitmap Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface. This parameter must point to an 8888 ARGB surface (format D3DFMT_A8R8G8B8). The contents of this surface will be copied and potentially format-converted into an internal buffer from which the cursor is displayed. The dimensions of this surface must be less than the dimensions of the display mode, and must be a power of two in each direction, although not necessarily the same power of two. The alpha channel must be either 0.0 or 1.0.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setcursorproperties
     */
    SetCursorProperties(XHotSpot, YHotSpot, pCursorBitmap) {
        result := ComCall(10, this, "uint", XHotSpot, "uint", YHotSpot, "ptr", pCursorBitmap, "HRESULT")
        return result
    }

    /**
     * Sets the cursor position and update options.
     * @remarks
     * 
     * When running in full-screen mode, screen space coordinates are the back buffer coordinates appropriately scaled to the current display mode. When running in windowed mode, screen space coordinates are the desktop coordinates. The cursor image is drawn at the specified position minus the hotspot-offset specified by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setcursorproperties">SetCursorProperties</a> method.
     * 
     * If the cursor has been hidden by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-showcursor">ShowCursor</a>, the cursor is not drawn.
     * 
     * 
     * @param {Integer} X Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * The new X-position of the cursor in virtual desktop coordinates. See Remarks.
     * @param {Integer} Y Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * The new Y-position of the cursor in virtual desktop coordinates. See Remarks.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * Specifies the update options for the cursor. Currently, only one flag is defined.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DCURSOR_IMMEDIATE_UPDATE"></a><a id="d3dcursor_immediate_update"></a><dl>
     * <dt><b>D3DCURSOR_IMMEDIATE_UPDATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Update cursor at the refresh rate.
     * 
     * If this flag is specified, the system guarantees that the cursor will be updated at a minimum of half the display refresh rate, but never more frequently than the display refresh rate. Otherwise, the method delays cursor updates until the next <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-present">IDirect3DDevice9::Present</a> call. Not setting this flag usually results in better performance than if the flag is set. However, applications should set this flag if the rate of calls to Present is low enough that users would notice a significant delay in cursor motion. This flag has no effect in a windowed-mode application. Some video cards implement hardware color cursors. This flag does not have an effect on these cards.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setcursorposition
     */
    SetCursorPosition(X, Y, Flags) {
        ComCall(11, this, "int", X, "int", Y, "uint", Flags)
    }

    /**
     * Displays or hides the cursor.
     * @param {BOOL} bShow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If bShow is <b>TRUE</b>, the cursor is shown. If bShow is <b>FALSE</b>, the cursor is hidden.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Value indicating whether the cursor was previously visible. <b>TRUE</b> if the cursor was previously visible, or <b>FALSE</b> if the cursor was not previously visible.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-showcursor
     */
    ShowCursor(bShow) {
        result := ComCall(12, this, "int", bShow, "int")
        return result
    }

    /**
     * Creates an additional swap chain for rendering multiple views.
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a> structure, containing the presentation parameters for the new swap chain. This value cannot be <b>NULL</b>.
     * 
     * Calling this method changes the value of members of the D3DPRESENT_PARAMETERS structure.
     * 
     * <ul>
     * <li>If BackBufferCount == 0, calling CreateAdditionalSwapChain will increase it to 1.</li>
     * <li>If the application is in windowed mode, and if either the BackBufferWidth or the BackBufferHeight == 0, they will be set to the client area width and height of the hwnd.</li>
     * </ul>
     * @returns {IDirect3DSwapChain9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dswapchain9">IDirect3DSwapChain9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dswapchain9">IDirect3DSwapChain9</a> interface, representing the additional swap chain.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-createadditionalswapchain
     */
    CreateAdditionalSwapChain(pPresentationParameters) {
        result := ComCall(13, this, "ptr", pPresentationParameters, "ptr*", &pSwapChain := 0, "HRESULT")
        return IDirect3DSwapChain9(pSwapChain)
    }

    /**
     * Gets a pointer to a swap chain.
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The swap chain ordinal value.  For more information, see NumberOfAdaptersInGroup in <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a>.
     * @returns {IDirect3DSwapChain9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dswapchain9">IDirect3DSwapChain9</a>**</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dswapchain9">IDirect3DSwapChain9</a> interface that will receive a copy of swap chain.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getswapchain
     */
    GetSwapChain(iSwapChain) {
        result := ComCall(14, this, "uint", iSwapChain, "ptr*", &pSwapChain := 0, "HRESULT")
        return IDirect3DSwapChain9(pSwapChain)
    }

    /**
     * Gets the number of implicit swap chains.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of implicit swap chains. See Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getnumberofswapchains
     */
    GetNumberOfSwapChains() {
        result := ComCall(15, this, "uint")
        return result
    }

    /**
     * Resets the type, size, and format of the swap chain.
     * @param {Pointer<D3DPRESENT_PARAMETERS>} pPresentationParameters Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a> structure, describing the new presentation parameters. This value cannot be <b>NULL</b>. 
     *     
     * 
     * 
     * When switching to full-screen mode, Direct3D will try to find a desktop format that matches the back buffer format, so that back buffer and front buffer formats will be identical (to eliminate the need for color conversion).
     * 
     * When this method returns:
     * 
     * <ul>
     * <li>BackBufferCount, BackBufferWidth, and BackBufferHeight are set to zero.</li>
     * <li>BackBufferFormat is set to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFMT_UNKNOWN</a> for windowed mode only; a full-screen mode must specify a format.</li>
     * </ul>
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Possible return values include: D3D_OK, D3DERR_DEVICELOST, D3DERR_DEVICEREMOVED, D3DERR_DRIVERINTERNALERROR, or D3DERR_OUTOFVIDEOMEMORY (see <a href="/windows/desktop/direct3d9/d3derr">D3DERR</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-reset
     */
    Reset(pPresentationParameters) {
        result := ComCall(16, this, "ptr", pPresentationParameters, "HRESULT")
        return result
    }

    /**
     * Presents the contents of the next buffer in the sequence of back buffers owned by the device.
     * @param {Pointer<RECT>} pSourceRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to a value that must be <b>NULL</b> unless the swap chain was created with D3DSWAPEFFECT_COPY. pSourceRect is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the source rectangle. If <b>NULL</b>, the entire source surface is presented. If the rectangle exceeds the source surface, the rectangle is clipped to the source surface.
     * @param {Pointer<RECT>} pDestRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to a value that must be <b>NULL</b> unless the swap chain was created with D3DSWAPEFFECT_COPY. pDestRect is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure containing the destination rectangle, in window client coordinates. If <b>NULL</b>, the entire client area is filled. If the rectangle exceeds the destination client area, the rectangle is clipped to the destination client area.
     * @param {HWND} hDestWindowOverride Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Pointer to a destination window whose client area is taken as the target for this presentation. If this value is <b>NULL</b>, the runtime uses the <b>hDeviceWindow</b> member of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a> for the presentation.
     * @param {Pointer<RGNDATA>} pDirtyRegion Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a>*</b>
     * 
     * Value must be <b>NULL</b> unless the swap chain was created with D3DSWAPEFFECT_COPY. For more information about swap chains, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/flipping-surfaces">Flipping Surfaces (Direct3D 9)</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dswapeffect">D3DSWAPEFFECT</a>. If this value is non-<b>NULL</b>, the contained region is expressed in back buffer coordinates. The rectangles within the region are the minimal set of pixels that need to be updated. This method takes these rectangles into account when optimizing the presentation by copying only the pixels within the region, or some suitably expanded set of rectangles. This is an aid to optimization only, and the application should not rely on the region being copied exactly. The implementation can choose to copy the whole source rectangle.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Possible return values include: D3D_OK or D3DERR_DEVICEREMOVED (see <a href="/windows/desktop/direct3d9/d3derr">D3DERR</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-present
     */
    Present(pSourceRect, pDestRect, hDestWindowOverride, pDirtyRegion) {
        hDestWindowOverride := hDestWindowOverride is Win32Handle ? NumGet(hDestWindowOverride, "ptr") : hDestWindowOverride

        result := ComCall(17, this, "ptr", pSourceRect, "ptr", pDestRect, "ptr", hDestWindowOverride, "ptr", pDirtyRegion, "HRESULT")
        return result
    }

    /**
     * Retrieves a back buffer from the device's swap chain.
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An unsigned integer specifying the swap chain.
     * @param {Integer} iBackBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the back buffer object to return. Back buffers are numbered from 0 to the total number of back buffers minus one. A value of 0 returns the first back buffer, not the front buffer. The front buffer is not accessible through this method. Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-getfrontbufferdata">IDirect3DDevice9::GetFrontBufferData</a> to retrieve a copy of the front buffer.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dbackbuffer-type">D3DBACKBUFFER_TYPE</a></b>
     * 
     * Stereo view is not supported in Direct3D 9, so the only valid value for this parameter is D3DBACKBUFFER_TYPE_MONO.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface, representing the returned back buffer surface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getbackbuffer
     */
    GetBackBuffer(iSwapChain, iBackBuffer, Type) {
        result := ComCall(18, this, "uint", iSwapChain, "uint", iBackBuffer, "int", Type, "ptr*", &ppBackBuffer := 0, "HRESULT")
        return IDirect3DSurface9(ppBackBuffer)
    }

    /**
     * Returns information describing the raster of the monitor on which the swap chain is presented.
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An unsigned integer specifying the swap chain.
     * @param {Pointer<D3DRASTER_STATUS>} pRasterStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3draster-status">D3DRASTER_STATUS</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3draster-status">D3DRASTER_STATUS</a> structure filled with information about the position or other status of the raster on the monitor driven by this adapter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if pRasterStatus is invalid or if the device does not support reading the current scan line. To determine if the device supports reading the scan line, check for the D3DCAPS_READ_SCANLINE flag in the Caps member of <a href="/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getrasterstatus
     */
    GetRasterStatus(iSwapChain, pRasterStatus) {
        result := ComCall(19, this, "uint", iSwapChain, "ptr", pRasterStatus, "HRESULT")
        return result
    }

    /**
     * This method allows the use of GDI dialog boxes in full-screen mode applications.
     * @param {BOOL} bEnableDialogs Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> to enable GDI dialog boxes, and <b>FALSE</b> to disable them.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL unless all of the following are true.
     * 
     * 
     * 
     * <ul>
     * <li>The application specified a back buffer format compatible with GDI, in other words, one of D3DFMT_X1R5G5B5, D3DFMT_R5G6B5, or D3DFMT_X8R8G8B8.</li>
     * <li>The application specified no multisampling.</li>
     * <li>The application specified D3DSWAPEFFECT_DISCARD.</li>
     * <li>The application specified D3DPRESENTFLAG_LOCKABLE_BACKBUFFER.</li>
     * <li>The application did not specify D3DCREATE_ADAPTERGROUP_DEVICE.</li>
     * <li>The application is not between BeginScene and EndScene.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setdialogboxmode
     */
    SetDialogBoxMode(bEnableDialogs) {
        result := ComCall(20, this, "int", bEnableDialogs, "HRESULT")
        return result
    }

    /**
     * Sets the gamma correction ramp for the implicit swap chain. This method will affect the entire screen (not just the active window if you are running in windowed mode).
     * @remarks
     * 
     * There is always at least one swap chain (the implicit swap chain) for each device, because Direct3D 9 has one swap chain as a property of the device. The gamma ramp takes effect immediately; there is no wait for a vertical sync.
     * 
     * If the device does not support gamma ramps in the swap chain's current presentation mode (full-screen or windowed), no error return is given. Applications can check the D3DCAPS2_FULLSCREENGAMMA and D3DCAPS2_CANCALIBRATEGAMMA capability bits in the Caps2 member of the D3DCAPS9 structure to determine the capabilities of the device and whether a calibrator is installed.
     * 
     * For windowed gamma correction presentation, use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dswapchain9-present">IDirect3DSwapChain9::Present</a> if the hardware supports the feature. In DirectX 8, SetGammaRamp will set the gamma ramp only on a full-screen mode application. For more information about gamma correction, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/gamma">Gamma (Direct3D 9)</a>.
     * 
     * 
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Unsigned integer specifying the swap chain.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @param {Pointer<D3DGAMMARAMP>} pRamp Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dgammaramp">D3DGAMMARAMP</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dgammaramp">D3DGAMMARAMP</a> structure, representing the gamma correction ramp to be set for the implicit swap chain.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setgammaramp
     */
    SetGammaRamp(iSwapChain, Flags, pRamp) {
        ComCall(21, this, "uint", iSwapChain, "uint", Flags, "ptr", pRamp)
    }

    /**
     * Retrieves the gamma correction ramp for the swap chain.
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An unsigned integer specifying the swap chain.
     * @param {Pointer<D3DGAMMARAMP>} pRamp Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dgammaramp">D3DGAMMARAMP</a>*</b>
     * 
     * Pointer to an application-supplied <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dgammaramp">D3DGAMMARAMP</a> structure to fill with the gamma correction ramp.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getgammaramp
     */
    GetGammaRamp(iSwapChain, pRamp) {
        ComCall(22, this, "uint", iSwapChain, "ptr", pRamp)
    }

    /**
     * Creates a texture resource.
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the top-level of the texture, in pixels. The pixel dimensions of subsequent levels will be the truncated value of half of the previous level's 
     *         pixel dimension (independently). Each dimension clamps at a size of 1 pixel. Thus, if the division by 2 results in 0, 1 will be taken instead.
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the top-level of the texture, in pixels. The pixel dimensions of subsequent levels will be the truncated value of half of the previous level's 
     *         pixel dimension (independently). Each dimension clamps at a size of 1 pixel. Thus, if the division by 2 results in 0, 1 will be taken instead.
     * @param {Integer} Levels Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of levels in the texture. If this is zero, Direct3D will generate all texture sublevels down to 1 by 1 pixels for hardware that supports 
     *         mipmapped textures. Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dbasetexture9-getlevelcount">IDirect3DBaseTexture9::GetLevelCount</a> to see the number of levels generated.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Usage can be 0, which indicates no usage value. However, if usage is desired, use a combination of one or more <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a> constants. It is 
     *         good practice to match the usage parameter with the behavior flags in <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">IDirect3D9::CreateDevice</a>.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, describing the format of all levels in the texture.
     * @param {Integer} Pool Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a> enumerated type, describing the memory class into which the texture should be placed.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to 
     *         <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @returns {IDirect3DTexture9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dtexture9">IDirect3DTexture9</a>**</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dtexture9">IDirect3DTexture9</a> interface, representing the created texture resource.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-createtexture
     */
    CreateTexture(Width, Height, Levels, Usage, Format, Pool, pSharedHandle) {
        result := ComCall(23, this, "uint", Width, "uint", Height, "uint", Levels, "uint", Usage, "uint", Format, "int", Pool, "ptr*", &ppTexture := 0, "ptr", pSharedHandle, "HRESULT")
        return IDirect3DTexture9(ppTexture)
    }

    /**
     * Creates a volume texture resource.
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the top-level of the volume texture, in pixels. This value must be a power of two if the D3DPTEXTURECAPS_VOLUMEMAP_POW2 member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> is set. The pixel dimensions of subsequent levels will be the truncated value of half of the previous level's pixel dimension (independently). Each dimension clamps at a size of 1 pixel. Thus, if the division by two results in 0 (zero), 1 will be taken instead. The maximum dimension that a driver supports (for width, height, and depth) can be found in MaxVolumeExtent in <b>D3DCAPS9</b>.
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the top-level of the volume texture, in pixels. This value must be a power of two if the D3DPTEXTURECAPS_VOLUMEMAP_POW2 member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> is set. The pixel dimensions of subsequent levels will be the truncated value of half of the previous level's pixel dimension (independently). Each dimension clamps at a size of 1 pixel. Thus, if the division by 2 results in 0 (zero), 1 will be taken instead. The maximum dimension that a driver supports (for width, height, and depth) can be found in MaxVolumeExtent in <b>D3DCAPS9</b>.
     * @param {Integer} Depth Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Depth of the top-level of the volume texture, in pixels. This value must be a power of two if the D3DPTEXTURECAPS_VOLUMEMAP_POW2 member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> is set. The pixel dimensions of subsequent levels will be the truncated value of half of the previous level's pixel dimension (independently). Each dimension clamps at a size of 1 pixel. Thus, if the division by 2 results in 0 (zero), 1 will be taken instead. The maximum dimension that a driver supports (for width, height, and depth) can be found in MaxVolumeExtent in <b>D3DCAPS9</b>.
     * @param {Integer} Levels Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of levels in the texture. If this is zero, Direct3D will generate all texture sublevels down to 1x1 pixels for hardware that supports mipmapped volume textures. Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dbasetexture9-getlevelcount">IDirect3DBaseTexture9::GetLevelCount</a> to see the number of levels generated.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Usage can be 0, which indicates no usage value. If usage is desired, use D3DUSAGE_DYNAMIC or D3DUSAGE_SOFTWAREPROCESSING. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a>.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, describing the format of all levels in the volume texture.
     * @param {Integer} Pool Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a> enumerated type, describing the memory class into which the volume texture should be placed.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @returns {IDirect3DVolumeTexture9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvolumetexture9">IDirect3DVolumeTexture9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvolumetexture9">IDirect3DVolumeTexture9</a> interface, representing the created volume texture resource.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-createvolumetexture
     */
    CreateVolumeTexture(Width, Height, Depth, Levels, Usage, Format, Pool, pSharedHandle) {
        result := ComCall(24, this, "uint", Width, "uint", Height, "uint", Depth, "uint", Levels, "uint", Usage, "uint", Format, "int", Pool, "ptr*", &ppVolumeTexture := 0, "ptr", pSharedHandle, "HRESULT")
        return IDirect3DVolumeTexture9(ppVolumeTexture)
    }

    /**
     * Creates a cube texture resource.
     * @param {Integer} EdgeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the edges of all the top-level faces of the cube texture. The pixel dimensions of subsequent levels of each face will be the truncated value of half of the previous level's pixel dimension (independently). Each dimension clamps at a size of 1 pixel. Thus, if the division by 2 results in 0 (zero), 1 will be taken instead.
     * @param {Integer} Levels Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of levels in each face of the cube texture. If this is zero, Direct3D will generate all cube texture sublevels down to 1x1 pixels for each face for hardware that supports mipmapped cube textures.  Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dbasetexture9-getlevelcount">IDirect3DBaseTexture9::GetLevelCount</a> to see the number of levels generated.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Usage can be 0, which indicates no usage value. However, if usage is desired, use a combination of one or more <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a> constants. It is good practice to match the usage parameter in CreateCubeTexture with the behavior flags in <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">IDirect3D9::CreateDevice</a>. For more information, see Remarks.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, describing the format of all levels in all faces of the cube texture.
     * @param {Integer} Pool Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a> enumerated type, describing the memory class into which the cube texture should be placed.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @returns {IDirect3DCubeTexture9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dcubetexture9">IDirect3DCubeTexture9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dcubetexture9">IDirect3DCubeTexture9</a> interface, representing the created cube texture resource.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-createcubetexture
     */
    CreateCubeTexture(EdgeLength, Levels, Usage, Format, Pool, pSharedHandle) {
        result := ComCall(25, this, "uint", EdgeLength, "uint", Levels, "uint", Usage, "uint", Format, "int", Pool, "ptr*", &ppCubeTexture := 0, "ptr", pSharedHandle, "HRESULT")
        return IDirect3DCubeTexture9(ppCubeTexture)
    }

    /**
     * Creates a vertex buffer.
     * @param {Integer} Length Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the vertex buffer, in bytes. For FVF vertex buffers, Length must be large enough to contain at least one vertex, but it need not be a multiple of the vertex size. Length is not validated for non-FVF buffers. See Remarks.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Usage can be 0, which indicates no usage value. However, if usage is desired, use a combination of one or more <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a> constants. It is good practice to match the usage parameter in CreateVertexBuffer with the behavior flags in <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">IDirect3D9::CreateDevice</a>. For more information, see Remarks.
     * @param {Integer} FVF Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Combination of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dfvf">D3DFVF</a>, a usage specifier that describes the vertex format of the vertices in this buffer. If this parameter is set to a valid FVF code, the created vertex buffer is an FVF vertex buffer (see Remarks). Otherwise, if this parameter is set to zero, the vertex buffer is a non-FVF vertex buffer.
     * @param {Integer} Pool Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a> enumerated type, describing a valid memory class into which to place the resource. Do not set to D3DPOOL_SCRATCH.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @returns {IDirect3DVertexBuffer9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a> interface, representing the created vertex buffer resource.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-createvertexbuffer
     */
    CreateVertexBuffer(Length, Usage, FVF, Pool, pSharedHandle) {
        result := ComCall(26, this, "uint", Length, "uint", Usage, "uint", FVF, "int", Pool, "ptr*", &ppVertexBuffer := 0, "ptr", pSharedHandle, "HRESULT")
        return IDirect3DVertexBuffer9(ppVertexBuffer)
    }

    /**
     * Creates an index buffer.
     * @param {Integer} Length Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the index buffer, in bytes.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Usage can be 0, which indicates no usage value. However, if usage is desired, use a combination of one or more <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a> constants. It is good practice to match the usage parameter in CreateIndexBuffer with the behavior flags in <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">IDirect3D9::CreateDevice</a>. For more information, see Remarks.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, describing the format of the index buffer. For more information, see Remarks. The valid settings are the following: 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Item</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="D3DFMT_INDEX16"></a><a id="d3dfmt_index16"></a>D3DFMT_INDEX16
     * 
     * </td>
     * <td width="60%">
     * Indices are 16 bits each.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="D3DFMT_INDEX32"></a><a id="d3dfmt_index32"></a>D3DFMT_INDEX32
     * 
     * </td>
     * <td width="60%">
     * Indices are 32 bits each.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Pool Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a> enumerated type, describing a valid memory class into which to place the resource.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>; set it to <b>NULL</b> to not share a resource. This parameter is not used in Direct3D 9 for operating systems earlier than Windows Vista; set it to <b>NULL</b>.
     * @returns {IDirect3DIndexBuffer9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dindexbuffer9">IDirect3DIndexBuffer9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dindexbuffer9">IDirect3DIndexBuffer9</a> interface, representing the created index buffer resource.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-createindexbuffer
     */
    CreateIndexBuffer(Length, Usage, Format, Pool, pSharedHandle) {
        result := ComCall(27, this, "uint", Length, "uint", Usage, "uint", Format, "int", Pool, "ptr*", &ppIndexBuffer := 0, "ptr", pSharedHandle, "HRESULT")
        return IDirect3DIndexBuffer9(ppIndexBuffer)
    }

    /**
     * Creates a render-target surface.
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the render-target surface, in pixels.
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the render-target surface, in pixels.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, describing the format of the render target.
     * @param {Integer} MultiSample Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmultisample-type">D3DMULTISAMPLE_TYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmultisample-type">D3DMULTISAMPLE_TYPE</a> enumerated type, which describes the multisampling buffer type. This parameter specifies the antialiasing type for this render target. When this surface is passed to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setrendertarget">IDirect3DDevice9::SetRenderTarget</a>, its multisample type must be the same as that of the depth-stencil set by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setdepthstencilsurface">IDirect3DDevice9::SetDepthStencilSurface</a>.
     * @param {Integer} MultisampleQuality Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Quality level. The valid range is between zero and one less than the level returned by pQualityLevels used by  <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-checkdevicemultisampletype">IDirect3D9::CheckDeviceMultiSampleType</a>. Passing a larger value returns the error, D3DERR_INVALIDCALL. The MultisampleQuality values of paired render targets, depth stencil surfaces, and the multisample type must all match.
     * @param {BOOL} Lockable Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Render targets are not lockable unless the application specifies <b>TRUE</b> for Lockable.
     * 
     * Note that lockable render targets reduce performance on some graphics hardware. The readback performance (moving data from video memory to system memory) depends on the type of hardware used (AGP vs. PCI Express) and is usually far lower than upload performance (moving data from system to video memory). If you need read access to render targets, use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-getrendertargetdata">GetRenderTargetData</a> instead of lockable render targets.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-createrendertarget
     */
    CreateRenderTarget(Width, Height, Format, MultiSample, MultisampleQuality, Lockable, pSharedHandle) {
        result := ComCall(28, this, "uint", Width, "uint", Height, "uint", Format, "int", MultiSample, "uint", MultisampleQuality, "int", Lockable, "ptr*", &ppSurface := 0, "ptr", pSharedHandle, "HRESULT")
        return IDirect3DSurface9(ppSurface)
    }

    /**
     * Creates a depth-stencil resource.
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the depth-stencil surface, in pixels.
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the depth-stencil surface, in pixels.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, describing the format of the depth-stencil surface. This value must be one of the enumerated depth-stencil formats for this device.
     * @param {Integer} MultiSample Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmultisample-type">D3DMULTISAMPLE_TYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmultisample-type">D3DMULTISAMPLE_TYPE</a> enumerated type, describing the multisampling buffer type. This value must be one of the allowed multisample types. When this surface is passed to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setdepthstencilsurface">IDirect3DDevice9::SetDepthStencilSurface</a>, its multisample type must be the same as that of the render target set by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setrendertarget">IDirect3DDevice9::SetRenderTarget</a>.
     * @param {Integer} MultisampleQuality Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Quality level. The valid range is between zero and one less than the level returned by pQualityLevels used by  <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-checkdevicemultisampletype">IDirect3D9::CheckDeviceMultiSampleType</a>. Passing a larger value returns the error D3DERR_INVALIDCALL. The MultisampleQuality values of paired render targets, depth stencil surfaces, and the MultiSample type must all match.
     * @param {BOOL} Discard Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Set this flag to <b>TRUE</b> to enable z-buffer discarding, and <b>FALSE</b> otherwise.				
     * If this flag is set, the contents of the depth stencil buffer will be invalid after calling either <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-present">IDirect3DDevice9::Present</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setdepthstencilsurface">IDirect3DDevice9::SetDepthStencilSurface</a> with a different depth surface.
     * 
     * This flag has the same behavior as the constant,  D3DPRESENTFLAG_DISCARD_DEPTHSTENCIL, in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresentflag">D3DPRESENTFLAG</a>.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface, representing the created depth-stencil surface resource.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-createdepthstencilsurface
     */
    CreateDepthStencilSurface(Width, Height, Format, MultiSample, MultisampleQuality, Discard, pSharedHandle) {
        result := ComCall(29, this, "uint", Width, "uint", Height, "uint", Format, "int", MultiSample, "uint", MultisampleQuality, "int", Discard, "ptr*", &ppSurface := 0, "ptr", pSharedHandle, "HRESULT")
        return IDirect3DSurface9(ppSurface)
    }

    /**
     * Copies rectangular subsets of pixels from one surface to another.
     * @param {IDirect3DSurface9} pSourceSurface Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface, representing the source surface. This parameter must point to a different surface than pDestinationSurface.
     * @param {Pointer<RECT>} pSourceRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to a rectangle on the source surface. Specifying <b>NULL</b> for this parameter causes the entire surface to be copied.
     * @param {IDirect3DSurface9} pDestinationSurface Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface, representing the destination surface.
     * @param {Pointer<POINT>} pDestPoint Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">POINT</a>*</b>
     * 
     * Pointer to the upper left corner of the destination rectangle. Specifying <b>NULL</b> for this parameter causes the entire surface to be copied.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-updatesurface
     */
    UpdateSurface(pSourceSurface, pSourceRect, pDestinationSurface, pDestPoint) {
        result := ComCall(30, this, "ptr", pSourceSurface, "ptr", pSourceRect, "ptr", pDestinationSurface, "ptr", pDestPoint, "HRESULT")
        return result
    }

    /**
     * Updates the dirty portions of a texture.
     * @param {IDirect3DBaseTexture9} pSourceTexture Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a> interface, representing the source texture. The source texture must be in system memory (D3DPOOL_SYSTEMMEM).
     * @param {IDirect3DBaseTexture9} pDestinationTexture Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a> interface, representing the destination texture. The destination texture must be in the D3DPOOL_DEFAULT memory pool.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-updatetexture
     */
    UpdateTexture(pSourceTexture, pDestinationTexture) {
        result := ComCall(31, this, "ptr", pSourceTexture, "ptr", pDestinationTexture, "HRESULT")
        return result
    }

    /**
     * Copies the render-target data from device memory to system memory.
     * @param {IDirect3DSurface9} pRenderTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> object, representing a render target.
     * @param {IDirect3DSurface9} pDestSurface Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> object, representing a destination surface.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_DRIVERINTERNALERROR, D3DERR_DEVICELOST, D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getrendertargetdata
     */
    GetRenderTargetData(pRenderTarget, pDestSurface) {
        result := ComCall(32, this, "ptr", pRenderTarget, "ptr", pDestSurface, "HRESULT")
        return result
    }

    /**
     * Generates a copy of the device's front buffer and places that copy in a system memory buffer provided by the application.
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An unsigned integer specifying the swap chain.
     * @param {IDirect3DSurface9} pDestSurface Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface that will receive a copy of the contents of the front buffer. The data is returned in successive rows with no intervening space, starting from the vertically highest row on the device's output to the lowest.
     * 
     * 
     * 
     * For windowed mode, the size of the destination surface should be the size of the desktop. For full-screen mode, the size of the destination surface should be the screen size.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_DRIVERINTERNALERROR, D3DERR_DEVICELOST, D3DERR_INVALIDCALL
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getfrontbufferdata
     */
    GetFrontBufferData(iSwapChain, pDestSurface) {
        result := ComCall(33, this, "uint", iSwapChain, "ptr", pDestSurface, "HRESULT")
        return result
    }

    /**
     * Copy the contents of the source rectangle to the destination rectangle. The source rectangle can be stretched and filtered by the copy. This function is often used to change the aspect ratio of a video stream.
     * @param {IDirect3DSurface9} pSourceSurface Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to the source surface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>.
     * @param {Pointer<RECT>} pSourceRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to the source rectangle. A <b>NULL</b> for this parameter causes the entire source surface to be used.
     * @param {IDirect3DSurface9} pDestSurface Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to the destination surface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>.
     * @param {Pointer<RECT>} pDestRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to the destination rectangle. A <b>NULL</b> for this parameter causes the entire destination surface to be used.
     * @param {Integer} Filter Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturefiltertype">D3DTEXTUREFILTERTYPE</a></b>
     * 
     * Filter type. Allowable values are D3DTEXF_NONE, D3DTEXF_POINT, or D3DTEXF_LINEAR. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturefiltertype">D3DTEXTUREFILTERTYPE</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be:
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-stretchrect
     */
    StretchRect(pSourceSurface, pSourceRect, pDestSurface, pDestRect, Filter) {
        result := ComCall(34, this, "ptr", pSourceSurface, "ptr", pSourceRect, "ptr", pDestSurface, "ptr", pDestRect, "int", Filter, "HRESULT")
        return result
    }

    /**
     * Allows an application to fill a rectangular area of a D3DPOOL_DEFAULT surface with a specified color.
     * @param {IDirect3DSurface9} pSurface Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to the surface to be filled.
     * @param {Pointer<RECT>} pRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to the source rectangle. Using <b>NULL</b> means that the entire surface will be filled.
     * @param {Integer} color Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcolor">D3DCOLOR</a></b>
     * 
     * Color used for filling.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-colorfill
     */
    ColorFill(pSurface, pRect, color) {
        result := ComCall(35, this, "ptr", pSurface, "ptr", pRect, "uint", color, "HRESULT")
        return result
    }

    /**
     * Create an off-screen surface.
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the surface.
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the surface.
     * @param {Integer} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Format of the surface. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a>.
     * @param {Integer} Pool Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a></b>
     * 
     * Surface pool type. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a>.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>  interface created.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-createoffscreenplainsurface
     */
    CreateOffscreenPlainSurface(Width, Height, Format, Pool, pSharedHandle) {
        result := ComCall(36, this, "uint", Width, "uint", Height, "uint", Format, "int", Pool, "ptr*", &ppSurface := 0, "ptr", pSharedHandle, "HRESULT")
        return IDirect3DSurface9(ppSurface)
    }

    /**
     * Sets a new color buffer for the device.
     * @param {Integer} RenderTargetIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Index of the render target. See Remarks.
     * @param {IDirect3DSurface9} pRenderTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to a new color buffer. If <b>NULL</b>, the color buffer for the corresponding RenderTargetIndex is disabled. Devices always must be associated with a color buffer.
     *  The new render-target surface must have at least D3DUSAGE_RENDERTARGET specified.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     *  This method will return D3DERR_INVALIDCALL if either:
     * 
     * 
     * <ul>
     * <li>pRenderTarget = <b>NULL</b> and RenderTargetIndex = 0</li>
     * <li>pRenderTarget is != <b>NULL</b> and the render target is invalid.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setrendertarget
     */
    SetRenderTarget(RenderTargetIndex, pRenderTarget) {
        result := ComCall(37, this, "uint", RenderTargetIndex, "ptr", pRenderTarget, "HRESULT")
        return result
    }

    /**
     * Retrieves a render-target surface.
     * @param {Integer} RenderTargetIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Index of the render target. See Remarks.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface, representing the returned render-target surface for this device.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getrendertarget
     */
    GetRenderTarget(RenderTargetIndex) {
        result := ComCall(38, this, "uint", RenderTargetIndex, "ptr*", &ppRenderTarget := 0, "HRESULT")
        return IDirect3DSurface9(ppRenderTarget)
    }

    /**
     * Sets the depth stencil surface.
     * @param {IDirect3DSurface9} pNewZStencil Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface representing the depth stencil surface. Setting this to <b>NULL</b> disables the depth stencil operation.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     *  If pZStencilSurface is other than <b>NULL</b>, the return value is D3DERR_INVALIDCALL when the stencil surface is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setdepthstencilsurface
     */
    SetDepthStencilSurface(pNewZStencil) {
        result := ComCall(39, this, "ptr", pNewZStencil, "HRESULT")
        return result
    }

    /**
     * Gets the depth-stencil surface owned by the Direct3DDevice object.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface, representing the returned depth-stencil surface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getdepthstencilsurface
     */
    GetDepthStencilSurface() {
        result := ComCall(40, this, "ptr*", &ppZStencilSurface := 0, "HRESULT")
        return IDirect3DSurface9(ppZStencilSurface)
    }

    /**
     * Begins a scene.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. The method will fail with D3DERR_INVALIDCALL if <b>IDirect3DDevice9::BeginScene</b> is called 
     *       while already in a <b>IDirect3DDevice9::BeginScene</b>/<a href="/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-endscene">IDirect3DDevice9::EndScene</a> pair. This happens only 
     *       when <b>IDirect3DDevice9::BeginScene</b> is called twice without first calling <b>IDirect3DDevice9::EndScene</b>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-beginscene
     */
    BeginScene() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * Ends a scene that was begun by calling IDirect3DDevice9::BeginScene.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. The method will fail with D3DERR_INVALIDCALL if <a href="/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-beginscene">IDirect3DDevice9::BeginScene</a> is called while already in a <b>IDirect3DDevice9::BeginScene</b>/<b>IDirect3DDevice9::EndScene</b> pair. This happens only when <b>IDirect3DDevice9::BeginScene</b> is called twice without first calling <b>IDirect3DDevice9::EndScene</b>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-endscene
     */
    EndScene() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    /**
     * Clears one or more surfaces such as a render target, multiple render targets, a stencil buffer, and a depth buffer.
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Number of rectangles in the array at pRects. Must be set to 0 if pRects is <b>NULL</b>. May not be 0 if pRects is a valid pointer.
     * @param {Pointer<D3DRECT>} pRects Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drect">D3DRECT</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drect">D3DRECT</a> structures that describe the rectangles to clear. Set a rectangle to the dimensions of the rendering target to clear the entire surface. Each rectangle uses screen coordinates that correspond to points on the render target. Coordinates are clipped to the bounds of the viewport rectangle. To indicate that the entire viewport rectangle is to be cleared, set this parameter to <b>NULL</b> and Count to 0.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Combination of one or more <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dclear">D3DCLEAR</a> flags that specify the surface(s) that will be cleared.
     * @param {Integer} Color Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcolor">D3DCOLOR</a></b>
     * 
     * Clear a render target to this ARGB color.
     * @param {Float} Z Type: <b>float</b>
     * 
     * Clear the depth buffer to this new z value which ranges from 0 to 1. See remarks.
     * @param {Integer} Stencil Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Clear the stencil buffer to this new value which ranges from 0 to 2ⁿ-1 (n is the bit depth of the stencil buffer). See remarks.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be: D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-clear
     */
    Clear(Count, pRects, Flags, Color, Z, Stencil) {
        result := ComCall(43, this, "uint", Count, "ptr", pRects, "uint", Flags, "uint", Color, "float", Z, "uint", Stencil, "HRESULT")
        return result
    }

    /**
     * Sets a single device transformation-related state.
     * @param {Integer} State Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtransformstatetype">D3DTRANSFORMSTATETYPE</a></b>
     * 
     * Device-state variable that is being modified. This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtransformstatetype">D3DTRANSFORMSTATETYPE</a> enumerated type, or the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dts-worldmatrix">D3DTS_WORLDMATRIX</a> macro.
     * @param {Pointer<D3DMATRIX>} pMatrix Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmatrix">D3DMATRIX</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmatrix">D3DMATRIX</a> structure that modifies the current transformation.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if one of the arguments is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-settransform
     */
    SetTransform(State, pMatrix) {
        result := ComCall(44, this, "int", State, "ptr", pMatrix, "HRESULT")
        return result
    }

    /**
     * Retrieves a matrix describing a transformation state.
     * @param {Integer} State Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtransformstatetype">D3DTRANSFORMSTATETYPE</a></b>
     * 
     * Device state variable that is being modified. This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtransformstatetype">D3DTRANSFORMSTATETYPE</a> enumerated type, or the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dts-worldmatrix">D3DTS_WORLDMATRIX</a> macro.
     * @param {Pointer<D3DMATRIX>} pMatrix Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmatrix">D3DMATRIX</a>*</b>
     * 
     * Pointer to a 
     *     <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmatrix">D3DMATRIX</a> structure, describing the returned transformation state.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL if one of the arguments is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-gettransform
     */
    GetTransform(State, pMatrix) {
        result := ComCall(45, this, "int", State, "ptr", pMatrix, "HRESULT")
        return result
    }

    /**
     * Multiplies a device's world, view, or projection matrices by a specified matrix.
     * @param {Integer} param0 
     * @param {Pointer<D3DMATRIX>} param1 
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL if one of the arguments is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-multiplytransform
     */
    MultiplyTransform(param0, param1) {
        result := ComCall(46, this, "int", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * Sets the viewport parameters for the device.
     * @param {Pointer<D3DVIEWPORT9>} pViewport Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dviewport9">D3DVIEWPORT9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dviewport9">D3DVIEWPORT9</a> structure, specifying the viewport parameters to set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, it will return D3DERR_INVALIDCALL. This will happen if pViewport is invalid, or if pViewport describes a region that cannot exist within the render target surface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setviewport
     */
    SetViewport(pViewport) {
        result := ComCall(47, this, "ptr", pViewport, "HRESULT")
        return result
    }

    /**
     * Retrieves the viewport parameters currently set for the device.
     * @param {Pointer<D3DVIEWPORT9>} pViewport Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dviewport9">D3DVIEWPORT9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dviewport9">D3DVIEWPORT9</a> structure, representing the returned viewport parameters.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if the pViewport parameter is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getviewport
     */
    GetViewport(pViewport) {
        result := ComCall(48, this, "ptr", pViewport, "HRESULT")
        return result
    }

    /**
     * Sets the material properties for the device.
     * @param {Pointer<D3DMATERIAL9>} pMaterial Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmaterial9">D3DMATERIAL9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmaterial9">D3DMATERIAL9</a> structure, describing the material properties to set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL if the pMaterial parameter is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setmaterial
     */
    SetMaterial(pMaterial) {
        result := ComCall(49, this, "ptr", pMaterial, "HRESULT")
        return result
    }

    /**
     * Retrieves the current material properties for the device.
     * @param {Pointer<D3DMATERIAL9>} pMaterial Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmaterial9">D3DMATERIAL9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmaterial9">D3DMATERIAL9</a> structure to fill with the currently set material properties.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL if the pMaterial parameter is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getmaterial
     */
    GetMaterial(pMaterial) {
        result := ComCall(50, this, "ptr", pMaterial, "HRESULT")
        return result
    }

    /**
     * Assigns a set of lighting properties for this device.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Zero-based index of the set of lighting properties to set. If a set of lighting properties exists at this index, it is overwritten by the new properties specified in pLight.
     * @param {Pointer<D3DLIGHT9>} param1 
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setlight
     */
    SetLight(Index, param1) {
        result := ComCall(51, this, "uint", Index, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * Retrieves a set of lighting properties that this device uses.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Zero-based index of the lighting property set to retrieve. This method will fail if a lighting property has not been set for this index by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setlight">IDirect3DDevice9::SetLight</a> method.
     * @param {Pointer<D3DLIGHT9>} param1 
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getlight
     */
    GetLight(Index, param1) {
        result := ComCall(52, this, "uint", Index, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * Enables or disables a set of lighting parameters within a device.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Zero-based index of the set of lighting parameters that are the target of this method.
     * @param {BOOL} Enable Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Value that indicates if the set of lighting parameters are being enabled or disabled. Set this parameter to <b>TRUE</b> to enable lighting with the parameters at the specified index, or <b>FALSE</b> to disable it.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-lightenable
     */
    LightEnable(Index, Enable) {
        result := ComCall(53, this, "uint", Index, "int", Enable, "HRESULT")
        return result
    }

    /**
     * Retrieves the activity status - enabled or disabled - for a set of lighting parameters within a device.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Zero-based index of the set of lighting parameters that are the target of this method.
     * @param {Pointer<BOOL>} pEnable Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Pointer to a variable to fill with the status of the specified lighting parameters. After the call, a nonzero value at this address indicates that the specified lighting parameters are enabled; a value of 0 indicates that they are disabled.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getlightenable
     */
    GetLightEnable(Index, pEnable) {
        pEnableMarshal := pEnable is VarRef ? "int*" : "ptr"

        result := ComCall(54, this, "uint", Index, pEnableMarshal, pEnable, "HRESULT")
        return result
    }

    /**
     * Sets the coefficients of a user-defined clipping plane for the device.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Index of the clipping plane for which the plane equation coefficients are to be set.
     * @param {Pointer<Float>} pPlane Type: <b>const float*</b>
     * 
     * Pointer to an address of a four-element array of values that represent the clipping plane coefficients to be set, in the form of the general plane equation. See Remarks.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value is D3DERR_INVALIDCALL. This error indicates that the value in Index exceeds the maximum clipping plane index supported by the device or that the array at pPlane is not large enough to contain four floating-point values.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setclipplane
     */
    SetClipPlane(Index, pPlane) {
        pPlaneMarshal := pPlane is VarRef ? "float*" : "ptr"

        result := ComCall(55, this, "uint", Index, pPlaneMarshal, pPlane, "HRESULT")
        return result
    }

    /**
     * Retrieves the coefficients of a user-defined clipping plane for the device.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Index of the clipping plane for which the plane equation coefficients are retrieved.
     * @param {Pointer<Float>} pPlane Type: <b>float*</b>
     * 
     * Pointer to a four-element array of values that represent the coefficients of the clipping plane in the form of the general plane equation. See Remarks.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value is D3DERR_INVALIDCALL. This error indicates that the value in Index exceeds the maximum clipping plane index supported by the device, or that the array at pPlane is not large enough to contain four floating-point values.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getclipplane
     */
    GetClipPlane(Index, pPlane) {
        pPlaneMarshal := pPlane is VarRef ? "float*" : "ptr"

        result := ComCall(56, this, "uint", Index, pPlaneMarshal, pPlane, "HRESULT")
        return result
    }

    /**
     * Sets a single device render-state parameter.
     * @param {Integer} State Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drenderstatetype">D3DRENDERSTATETYPE</a></b>
     * 
     * Device state variable that is being modified. This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drenderstatetype">D3DRENDERSTATETYPE</a> enumerated type.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * New value for the device render state to be set. The meaning of this parameter is dependent on the value specified for <i>State</i>. For example, if <i>State</i> were D3DRS_SHADEMODE, the second parameter would be one member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dshademode">D3DSHADEMODE</a> enumerated type.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if one of the arguments is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setrenderstate
     */
    SetRenderState(State, Value) {
        result := ComCall(57, this, "int", State, "uint", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves a render-state value for a device.
     * @param {Integer} State Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drenderstatetype">D3DRENDERSTATETYPE</a></b>
     * 
     * Device state variable that is being queried. This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drenderstatetype">D3DRENDERSTATETYPE</a> enumerated type.
     * @param {Pointer<Integer>} pValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to a variable that receives the value of the queried render state variable when the method returns.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL if one of the arguments is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getrenderstate
     */
    GetRenderState(State, pValue) {
        pValueMarshal := pValue is VarRef ? "uint*" : "ptr"

        result := ComCall(58, this, "int", State, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * Creates a new state block that contains the values for all device states, vertex-related states, or pixel-related states.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dstateblocktype">D3DSTATEBLOCKTYPE</a></b>
     * 
     * Type of state data that the method should capture. This parameter can be set to a value defined in the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dstateblocktype">D3DSTATEBLOCKTYPE</a> enumerated type.
     * @returns {IDirect3DStateBlock9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dstateblock9">IDirect3DStateBlock9</a>**</b>
     * 
     * Pointer to a state block interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dstateblock9">IDirect3DStateBlock9</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-createstateblock
     */
    CreateStateBlock(Type) {
        result := ComCall(59, this, "int", Type, "ptr*", &ppSB := 0, "HRESULT")
        return IDirect3DStateBlock9(ppSB)
    }

    /**
     * Signals Direct3D to begin recording a device-state block.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_INVALIDCALL, E_OUTOFMEMORY.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-beginstateblock
     */
    BeginStateBlock() {
        result := ComCall(60, this, "HRESULT")
        return result
    }

    /**
     * Signals Direct3D to stop recording a device-state block and retrieve a pointer to the state block interface.
     * @returns {IDirect3DStateBlock9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dstateblock9">IDirect3DStateBlock9</a>**</b>
     * 
     * Pointer to a state block interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dstateblock9">IDirect3DStateBlock9</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-endstateblock
     */
    EndStateBlock() {
        result := ComCall(61, this, "ptr*", &ppSB := 0, "HRESULT")
        return IDirect3DStateBlock9(ppSB)
    }

    /**
     * Sets the clip status.
     * @param {Pointer<D3DCLIPSTATUS9>} pClipStatus Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dclipstatus9">D3DCLIPSTATUS9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dclipstatus9">D3DCLIPSTATUS9</a> structure, describing the clip status settings to be set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     *  If one of the arguments is invalid, the return value is D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setclipstatus
     */
    SetClipStatus(pClipStatus) {
        result := ComCall(62, this, "ptr", pClipStatus, "HRESULT")
        return result
    }

    /**
     * Retrieves the clip status.
     * @param {Pointer<D3DCLIPSTATUS9>} pClipStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dclipstatus9">D3DCLIPSTATUS9</a>*</b>
     * 
     *  Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dclipstatus9">D3DCLIPSTATUS9</a> structure that describes the clip status.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     * 
     * 
     * D3DERR_INVALIDCALL is returned if the argument is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getclipstatus
     */
    GetClipStatus(pClipStatus) {
        result := ComCall(63, this, "ptr", pClipStatus, "HRESULT")
        return result
    }

    /**
     * Retrieves a texture assigned to a stage for a device.
     * @param {Integer} Stage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Stage identifier of the texture to retrieve. Stage identifiers are zero-based.
     * @returns {IDirect3DBaseTexture9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a> interface, representing the returned texture.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-gettexture
     */
    GetTexture(Stage) {
        result := ComCall(64, this, "uint", Stage, "ptr*", &ppTexture := 0, "HRESULT")
        return IDirect3DBaseTexture9(ppTexture)
    }

    /**
     * Assigns a texture to a stage for a device.
     * @param {Integer} Stage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Zero based sampler number.  Textures are bound to samplers; samplers define sampling state such as the filtering mode and the address wrapping mode. Textures are referenced differently by the programmable and the fixed function pipeline:
     *     
     * 
     * 
     * <ul>
     * <li>Programmable shaders reference textures using the sampler number. The number of samplers available to a programmable shader is dependent on the shader version. For vertex shaders, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx9-graphics-reference-asm-vs-registers-sampler">Sampler (Direct3D 9 asm-vs)</a>. For pixel shaders see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx9-graphics-reference-asm-ps-registers-sampler">Sampler (Direct3D 9 asm-ps)</a>.</li>
     * <li>The fixed function pipeline on the other hand, references textures by texture stage number. The maximum number of samplers is determined from two caps: MaxSimultaneousTextures and MaxTextureBlendStages of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure.</li>
     * </ul>
     * There are two other special cases for stage/sampler numbers.
     * 
     * <ul>
     * <li>A special number called D3DDMAPSAMPLER is used for <a href="https://docs.microsoft.com/windows/desktop/direct3d9/displacement-mapping">Displacement Mapping (Direct3D 9)</a>.</li>
     * <li>A programmable vertex shader uses a special number defined by a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvertextexturesampler">D3DVERTEXTEXTURESAMPLER</a> when accessing <a href="https://docs.microsoft.com/windows/desktop/direct3d9/vertex-textures-in-vs-3-0">Vertex Textures in vs_3_0 (DirectX HLSL)</a>.</li>
     * </ul>
     * @param {IDirect3DBaseTexture9} pTexture Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a> interface, representing the texture being set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-settexture
     */
    SetTexture(Stage, pTexture) {
        result := ComCall(65, this, "uint", Stage, "ptr", pTexture, "HRESULT")
        return result
    }

    /**
     * Retrieves a state value for an assigned texture.
     * @param {Integer} Stage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Stage identifier of the texture for which the state is retrieved. Stage identifiers are zero-based. Devices can have up to eight set textures, so the maximum value allowed for Stage is 7.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturestagestatetype">D3DTEXTURESTAGESTATETYPE</a></b>
     * 
     * Texture state to retrieve. This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturestagestatetype">D3DTEXTURESTAGESTATETYPE</a> enumerated type.
     * @param {Pointer<Integer>} pValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer a variable to fill with the retrieved state value. The meaning of the retrieved value is determined by the Type parameter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-gettexturestagestate
     */
    GetTextureStageState(Stage, Type, pValue) {
        pValueMarshal := pValue is VarRef ? "uint*" : "ptr"

        result := ComCall(66, this, "uint", Stage, "int", Type, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * Sets the state value for the currently assigned texture.
     * @param {Integer} Stage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Stage identifier of the texture for which the state value is set. Stage identifiers are zero-based. Devices can have up to eight set textures, so the maximum value allowed for Stage is 7.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturestagestatetype">D3DTEXTURESTAGESTATETYPE</a></b>
     * 
     * Texture state to set. This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturestagestatetype">D3DTEXTURESTAGESTATETYPE</a> enumerated type.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * State value to set. The meaning of this value is determined by the Type parameter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-settexturestagestate
     */
    SetTextureStageState(Stage, Type, Value) {
        result := ComCall(67, this, "uint", Stage, "int", Type, "uint", Value, "HRESULT")
        return result
    }

    /**
     * Gets the sampler state value.
     * @param {Integer} Sampler Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The sampler stage index.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsamplerstatetype">D3DSAMPLERSTATETYPE</a></b>
     * 
     * This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsamplerstatetype">D3DSAMPLERSTATETYPE</a> enumerated type.
     * @param {Pointer<Integer>} pValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * State value to get. The meaning of this value is determined by the Type parameter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getsamplerstate
     */
    GetSamplerState(Sampler, Type, pValue) {
        pValueMarshal := pValue is VarRef ? "uint*" : "ptr"

        result := ComCall(68, this, "uint", Sampler, "int", Type, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * Sets the sampler state value.
     * @param {Integer} Sampler Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The sampler stage index. For more info about sampler stage, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/vertex-textures-in-vs-3-0">Sampling Stage Registers in vs_3_0 (DirectX HLSL)</a>.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsamplerstatetype">D3DSAMPLERSTATETYPE</a></b>
     * 
     * This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsamplerstatetype">D3DSAMPLERSTATETYPE</a> enumerated type.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * State value to set. The meaning of this value is determined by the Type parameter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setsamplerstate
     */
    SetSamplerState(Sampler, Type, Value) {
        result := ComCall(69, this, "uint", Sampler, "int", Type, "uint", Value, "HRESULT")
        return result
    }

    /**
     * Reports the device's ability to render the current texture-blending operations and arguments in a single pass.
     * @param {Pointer<Integer>} pNumPasses Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to a DWORD value to fill with the number of rendering passes needed to complete the desired effect through multipass rendering.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_CONFLICTINGRENDERSTATE, D3DERR_CONFLICTINGTEXTUREFILTER, D3DERR_DEVICELOST, D3DERR_DRIVERINTERNALERROR, D3DERR_TOOMANYOPERATIONS, D3DERR_UNSUPPORTEDALPHAARG, D3DERR_UNSUPPORTEDALPHAOPERATION, D3DERR_UNSUPPORTEDCOLORARG, D3DERR_UNSUPPORTEDCOLOROPERATION, D3DERR_UNSUPPORTEDFACTORVALUE, D3DERR_UNSUPPORTEDTEXTUREFILTER, D3DERR_WRONGTEXTUREFORMAT,.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-validatedevice
     */
    ValidateDevice(pNumPasses) {
        pNumPassesMarshal := pNumPasses is VarRef ? "uint*" : "ptr"

        result := ComCall(70, this, pNumPassesMarshal, pNumPasses, "HRESULT")
        return result
    }

    /**
     * Sets palette entries.
     * @param {Integer} PaletteNumber Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An ordinal value identifying the particular palette upon which the operation is to be performed.
     * @param {Pointer<PALETTEENTRY>} pEntries Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-paletteentry">PALETTEENTRY</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-paletteentry">PALETTEENTRY</a> structure, representing the palette entries to set. The number of <b>PALETTEENTRY</b> structures pointed to by pEntries is assumed to be 256. See Remarks.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setpaletteentries
     */
    SetPaletteEntries(PaletteNumber, pEntries) {
        result := ComCall(71, this, "uint", PaletteNumber, "ptr", pEntries, "HRESULT")
        return result
    }

    /**
     * Retrieves palette entries.
     * @param {Integer} PaletteNumber Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An ordinal value identifying the particular palette to retrieve.
     * @param {Pointer<PALETTEENTRY>} pEntries Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-paletteentry">PALETTEENTRY</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-paletteentry">PALETTEENTRY</a> structure, representing the returned palette entries.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getpaletteentries
     */
    GetPaletteEntries(PaletteNumber, pEntries) {
        result := ComCall(72, this, "uint", PaletteNumber, "ptr", pEntries, "HRESULT")
        return result
    }

    /**
     * Sets the current texture palette.
     * @param {Integer} PaletteNumber Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Value that specifies the texture palette to set as the current texture palette.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setcurrenttexturepalette
     */
    SetCurrentTexturePalette(PaletteNumber) {
        result := ComCall(73, this, "uint", PaletteNumber, "HRESULT")
        return result
    }

    /**
     * Retrieves the current texture palette.
     * @param {Pointer<Integer>} PaletteNumber Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to a returned value that identifies the current texture palette.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be: D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getcurrenttexturepalette
     */
    GetCurrentTexturePalette(PaletteNumber) {
        PaletteNumberMarshal := PaletteNumber is VarRef ? "uint*" : "ptr"

        result := ComCall(74, this, PaletteNumberMarshal, PaletteNumber, "HRESULT")
        return result
    }

    /**
     * Sets the scissor rectangle.
     * @param {Pointer<RECT>} pRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that defines the rendering area within the render target if scissor test is enabled. This parameter may not be <b>NULL</b>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setscissorrect
     */
    SetScissorRect(pRect) {
        result := ComCall(75, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * Gets the scissor rectangle.
     * @param {Pointer<RECT>} pRect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Returns a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that defines the rendering area within the render target if scissor test is enabled.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be the following:
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getscissorrect
     */
    GetScissorRect(pRect) {
        result := ComCall(76, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * Use this method to switch between software and hardware vertex processing.
     * @param {BOOL} bSoftware Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> to specify software vertex processing; <b>FALSE</b> to specify hardware vertex processing.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setsoftwarevertexprocessing
     */
    SetSoftwareVertexProcessing(bSoftware) {
        result := ComCall(77, this, "int", bSoftware, "HRESULT")
        return result
    }

    /**
     * Gets the vertex processing (hardware or software) mode.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns <b>TRUE</b> if software vertex processing is set. Otherwise, it returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getsoftwarevertexprocessing
     */
    GetSoftwareVertexProcessing() {
        result := ComCall(78, this, "int")
        return result
    }

    /**
     * Enable or disable N-patches.
     * @param {Float} nSegments Type: <b>float</b>
     * 
     * Specifies the number of subdivision segments. If the number of segments is less than 1.0, N-patches are disabled. The default value is 0.0.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setnpatchmode
     */
    SetNPatchMode(nSegments) {
        result := ComCall(79, this, "float", nSegments, "HRESULT")
        return result
    }

    /**
     * Gets the N-patch mode segments.
     * @returns {Float} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Specifies the number of subdivision segments. If the number of segments is less than 1.0, N-patches are disabled. The default value is 0.0.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getnpatchmode
     */
    GetNPatchMode() {
        result := ComCall(80, this, "float")
        return result
    }

    /**
     * Renders a sequence of nonindexed, geometric primitives of the specified type from the current set of data input streams.
     * @param {Integer} PrimitiveType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dprimitivetype">D3DPRIMITIVETYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dprimitivetype">D3DPRIMITIVETYPE</a> enumerated type, describing the type of primitive to render.
     * @param {Integer} StartVertex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the first vertex to load. Beginning at StartVertex the correct number of vertices will be read out of the vertex buffer.
     * @param {Integer} PrimitiveCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of primitives to render. The maximum number of primitives allowed is determined by checking the MaxPrimitiveCount member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure. PrimitiveCount is the number of primitives as determined by the primitive type. If it is a line list, each primitive has two vertices. If it is a triangle list, each primitive has three vertices.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be 
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-drawprimitive
     */
    DrawPrimitive(PrimitiveType, StartVertex, PrimitiveCount) {
        result := ComCall(81, this, "int", PrimitiveType, "uint", StartVertex, "uint", PrimitiveCount, "HRESULT")
        return result
    }

    /**
     * Based on indexing, renders the specified geometric primitive into an array of vertices.
     * @param {Integer} param0 
     * @param {Integer} BaseVertexIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Offset from the start of the vertex buffer to the first vertex. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/rendering-from-vertex-and-index-buffers">Scenario 4</a>.
     * @param {Integer} MinVertexIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Minimum vertex index for vertices used during this call. This is a zero based index relative to BaseVertexIndex.
     * @param {Integer} NumVertices Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of vertices used during this call. The first vertex is located at index: BaseVertexIndex + MinIndex.
     * @param {Integer} startIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the first index to use when accesssing the vertex buffer. Beginning at StartIndex to index vertices from the vertex buffer.
     * @param {Integer} primCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of primitives to render. The number of vertices used is a function of the primitive count and the primitive type. The maximum number of primitives allowed is determined by checking the MaxPrimitiveCount member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be the following:
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-drawindexedprimitive
     */
    DrawIndexedPrimitive(param0, BaseVertexIndex, MinVertexIndex, NumVertices, startIndex, primCount) {
        result := ComCall(82, this, "int", param0, "int", BaseVertexIndex, "uint", MinVertexIndex, "uint", NumVertices, "uint", startIndex, "uint", primCount, "HRESULT")
        return result
    }

    /**
     * Renders data specified by a user memory pointer as a sequence of geometric primitives of the specified type.
     * @param {Integer} PrimitiveType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dprimitivetype">D3DPRIMITIVETYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dprimitivetype">D3DPRIMITIVETYPE</a> enumerated type, describing the type of primitive to render.
     * @param {Integer} PrimitiveCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of primitives to render. The maximum number of primitives allowed is determined by checking the MaxPrimitiveCount member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure.
     * @param {Pointer<Void>} pVertexStreamZeroData Type: <b>const void*</b>
     * 
     * User memory pointer to the vertex data.
     * @param {Integer} VertexStreamZeroStride Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of bytes of data for each vertex. This value may not be 0.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be: D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-drawprimitiveup
     */
    DrawPrimitiveUP(PrimitiveType, PrimitiveCount, pVertexStreamZeroData, VertexStreamZeroStride) {
        pVertexStreamZeroDataMarshal := pVertexStreamZeroData is VarRef ? "ptr" : "ptr"

        result := ComCall(83, this, "int", PrimitiveType, "uint", PrimitiveCount, pVertexStreamZeroDataMarshal, pVertexStreamZeroData, "uint", VertexStreamZeroStride, "HRESULT")
        return result
    }

    /**
     * Renders the specified geometric primitive with data specified by a user memory pointer.
     * @param {Integer} PrimitiveType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dprimitivetype">D3DPRIMITIVETYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dprimitivetype">D3DPRIMITIVETYPE</a> enumerated type, describing the type of primitive to render.
     * @param {Integer} MinVertexIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Minimum vertex index. This is a zero-based index.
     * @param {Integer} NumVertices Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     *  Number of vertices used during this call. The first vertex is located at index: MinVertexIndex.
     * @param {Integer} PrimitiveCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of primitives to render. The maximum number of primitives allowed is determined by checking the MaxPrimitiveCount member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure (the number of indices is a function of the primitive count and the primitive type).
     * @param {Pointer<Void>} pIndexData Type: <b>const void*</b>
     * 
     * User memory pointer to the index data.
     * @param {Integer} IndexDataFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, describing the format of the index data. The valid settings are either: 
     * 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFMT_INDEX16</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFMT_INDEX32</a>
     * </li>
     * </ul>
     * @param {Pointer<Void>} pVertexStreamZeroData Type: <b>const void*</b>
     * 
     * User memory pointer to the vertex data. The vertex data must be in stream 0.
     * @param {Integer} VertexStreamZeroStride Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of bytes of data for each vertex. This value may not be 0.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be the following:
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-drawindexedprimitiveup
     */
    DrawIndexedPrimitiveUP(PrimitiveType, MinVertexIndex, NumVertices, PrimitiveCount, pIndexData, IndexDataFormat, pVertexStreamZeroData, VertexStreamZeroStride) {
        pIndexDataMarshal := pIndexData is VarRef ? "ptr" : "ptr"
        pVertexStreamZeroDataMarshal := pVertexStreamZeroData is VarRef ? "ptr" : "ptr"

        result := ComCall(84, this, "int", PrimitiveType, "uint", MinVertexIndex, "uint", NumVertices, "uint", PrimitiveCount, pIndexDataMarshal, pIndexData, "uint", IndexDataFormat, pVertexStreamZeroDataMarshal, pVertexStreamZeroData, "uint", VertexStreamZeroStride, "HRESULT")
        return result
    }

    /**
     * Applies the vertex processing defined by the vertex shader to the set of input data streams, generating a single stream of interleaved vertex data to the destination vertex buffer.
     * @param {Integer} SrcStartIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of first vertex to load.
     * @param {Integer} DestIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of first vertex in the destination vertex buffer into which the results are placed.
     * @param {Integer} VertexCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of vertices to process.
     * @param {IDirect3DVertexBuffer9} pDestBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a> interface, the destination vertex buffer representing the stream of interleaved vertex data.
     * @param {IDirect3DVertexDeclaration9} pVertexDecl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9">IDirect3DVertexDeclaration9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9">IDirect3DVertexDeclaration9</a> interface that represents the output vertex data declaration. When vertex shader 3.0 or above is set as the current vertex shader, the output vertex declaration must be present.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Processing options. Set this parameter to 0 for default processing. Set to D3DPV_DONOTCOPYDATA to prevent the system from copying vertex data not affected by the vertex operation into the destination buffer. The D3DPV_DONOTCOPYDATA value may be combined with one or more <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK</a> values appropriate for the destination buffer.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-processvertices
     */
    ProcessVertices(SrcStartIndex, DestIndex, VertexCount, pDestBuffer, pVertexDecl, Flags) {
        result := ComCall(85, this, "uint", SrcStartIndex, "uint", DestIndex, "uint", VertexCount, "ptr", pDestBuffer, "ptr", pVertexDecl, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Create a vertex shader declaration from the device and the vertex elements.
     * @param {Pointer<D3DVERTEXELEMENT9>} pVertexElements Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvertexelement9">D3DVERTEXELEMENT9</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvertexelement9">D3DVERTEXELEMENT9</a> vertex elements.
     * @returns {IDirect3DVertexDeclaration9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9">IDirect3DVertexDeclaration9</a>**</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9">IDirect3DVertexDeclaration9</a> pointer that returns the created vertex shader declaration.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-createvertexdeclaration
     */
    CreateVertexDeclaration(pVertexElements) {
        result := ComCall(86, this, "ptr", pVertexElements, "ptr*", &ppDecl := 0, "HRESULT")
        return IDirect3DVertexDeclaration9(ppDecl)
    }

    /**
     * Sets a Vertex Declaration (Direct3D 9).
     * @param {IDirect3DVertexDeclaration9} pDecl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9">IDirect3DVertexDeclaration9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9">IDirect3DVertexDeclaration9</a> object, which contains the vertex declaration.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     *  The return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setvertexdeclaration
     */
    SetVertexDeclaration(pDecl) {
        result := ComCall(87, this, "ptr", pDecl, "HRESULT")
        return result
    }

    /**
     * Gets a vertex shader declaration.
     * @returns {IDirect3DVertexDeclaration9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9">IDirect3DVertexDeclaration9</a>**</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9">IDirect3DVertexDeclaration9</a> object that is returned.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getvertexdeclaration
     */
    GetVertexDeclaration() {
        result := ComCall(88, this, "ptr*", &ppDecl := 0, "HRESULT")
        return IDirect3DVertexDeclaration9(ppDecl)
    }

    /**
     * Sets the current vertex stream declaration.
     * @param {Integer} FVF Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * DWORD containing the fixed function vertex type. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dfvf">D3DFVF</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be:
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setfvf
     */
    SetFVF(FVF) {
        result := ComCall(89, this, "uint", FVF, "HRESULT")
        return result
    }

    /**
     * Gets the fixed vertex function declaration.
     * @param {Pointer<Integer>} pFVF Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * A DWORD pointer to the fixed function vertex type. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dfvf">D3DFVF</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getfvf
     */
    GetFVF(pFVF) {
        pFVFMarshal := pFVF is VarRef ? "uint*" : "ptr"

        result := ComCall(90, this, pFVFMarshal, pFVF, "HRESULT")
        return result
    }

    /**
     * Creates a vertex shader.
     * @param {Pointer<Integer>} pFunction Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to an array of tokens that represents the vertex shader, including any embedded debug and symbol table information. 
     *     
     * 
     * 
     * <ul>
     * <li>Use a function such as <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dxcompileshader">D3DXCompileShader</a> to create the array from a HLSL shader.</li>
     * <li>Use a function like <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dxassembleshader">D3DXAssembleShader</a> to create the token array from an assembly language shader.</li>
     * <li>Use a function like <a href="https://docs.microsoft.com/windows/desktop/direct3d9/id3dxeffectcompiler--compileshader">ID3DXEffectCompiler::CompileShader</a> to create the array from an effect.</li>
     * </ul>
     * @returns {IDirect3DVertexShader9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexshader9">IDirect3DVertexShader9</a>**</b>
     * 
     * Pointer to the returned vertex shader interface (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexshader9">IDirect3DVertexShader9</a>).
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-createvertexshader
     */
    CreateVertexShader(pFunction) {
        pFunctionMarshal := pFunction is VarRef ? "uint*" : "ptr"

        result := ComCall(91, this, pFunctionMarshal, pFunction, "ptr*", &ppShader := 0, "HRESULT")
        return IDirect3DVertexShader9(ppShader)
    }

    /**
     * Sets the vertex shader.
     * @param {IDirect3DVertexShader9} pShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexshader9">IDirect3DVertexShader9</a>*</b>
     * 
     * Vertex shader interface. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexshader9">IDirect3DVertexShader9</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setvertexshader
     */
    SetVertexShader(pShader) {
        result := ComCall(92, this, "ptr", pShader, "HRESULT")
        return result
    }

    /**
     * Retrieves the currently set vertex shader.
     * @returns {IDirect3DVertexShader9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexshader9">IDirect3DVertexShader9</a>**</b>
     * 
     * Pointer to a vertex shader interface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getvertexshader
     */
    GetVertexShader() {
        result := ComCall(93, this, "ptr*", &ppShader := 0, "HRESULT")
        return IDirect3DVertexShader9(ppShader)
    }

    /**
     * Sets a floating-point vertex shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Float>} pConstantData Type: <b>const float*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4fCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four float vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setvertexshaderconstantf
     */
    SetVertexShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "float*" : "ptr"

        result := ComCall(94, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4fCount, "HRESULT")
        return result
    }

    /**
     * Gets a floating-point vertex shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Float>} pConstantData Type: <b>float*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4fCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four float vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getvertexshaderconstantf
     */
    GetVertexShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "float*" : "ptr"

        result := ComCall(95, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4fCount, "HRESULT")
        return result
    }

    /**
     * Sets an integer vertex shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Integer>} pConstantData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4iCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four integer vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setvertexshaderconstanti
     */
    SetVertexShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(96, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4iCount, "HRESULT")
        return result
    }

    /**
     * Gets an integer vertex shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Integer>} pConstantData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4iCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four integer vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getvertexshaderconstanti
     */
    GetVertexShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(97, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4iCount, "HRESULT")
        return result
    }

    /**
     * Sets a Boolean vertex shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<BOOL>} pConstantData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} BoolCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of boolean values in the array of constants.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setvertexshaderconstantb
     */
    SetVertexShaderConstantB(StartRegister, pConstantData, BoolCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(98, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", BoolCount, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean vertex shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<BOOL>} pConstantData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} BoolCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of Boolean values in the array of constants.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getvertexshaderconstantb
     */
    GetVertexShaderConstantB(StartRegister, pConstantData, BoolCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(99, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", BoolCount, "HRESULT")
        return result
    }

    /**
     * Binds a vertex buffer to a device data stream. For more information, see Setting the Stream Source (Direct3D 9).
     * @param {Integer} StreamNumber Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the data stream, in the range from 0 to the maximum number of streams -1.
     * @param {IDirect3DVertexBuffer9} pStreamData Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a> interface, representing the vertex buffer to bind to the specified data stream.
     * @param {Integer} OffsetInBytes Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Offset from the beginning of the stream to the beginning of the vertex data, in bytes. To find out if the device supports stream offsets, see the D3DDEVCAPS2_STREAMOFFSET constant in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevcaps2">D3DDEVCAPS2</a>.
     * @param {Integer} Stride Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Stride of the component, in bytes. See Remarks.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setstreamsource
     */
    SetStreamSource(StreamNumber, pStreamData, OffsetInBytes, Stride) {
        result := ComCall(100, this, "uint", StreamNumber, "ptr", pStreamData, "uint", OffsetInBytes, "uint", Stride, "HRESULT")
        return result
    }

    /**
     * Retrieves a vertex buffer bound to the specified data stream.
     * @param {Integer} StreamNumber Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the data stream, in the range from 0 to the maximum number of streams minus one.
     * @param {Pointer<Integer>} pOffsetInBytes 
     * @param {Pointer<Integer>} pStride Type: [out] <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to a returned stride of the component, in bytes. See Remarks.
     * @returns {IDirect3DVertexBuffer9} Type: [in, out] <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a> interface, representing the returned vertex buffer bound to the specified data stream.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getstreamsource
     */
    GetStreamSource(StreamNumber, pOffsetInBytes, pStride) {
        pOffsetInBytesMarshal := pOffsetInBytes is VarRef ? "uint*" : "ptr"
        pStrideMarshal := pStride is VarRef ? "uint*" : "ptr"

        result := ComCall(101, this, "uint", StreamNumber, "ptr*", &ppStreamData := 0, pOffsetInBytesMarshal, pOffsetInBytes, pStrideMarshal, pStride, "HRESULT")
        return IDirect3DVertexBuffer9(ppStreamData)
    }

    /**
     * Sets the stream source frequency divider value. This may be used to draw several instances of geometry.
     * @param {Integer} StreamNumber Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Stream source number.
     * @param {Integer} Setting 
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setstreamsourcefreq
     */
    SetStreamSourceFreq(StreamNumber, Setting) {
        result := ComCall(102, this, "uint", StreamNumber, "uint", Setting, "HRESULT")
        return result
    }

    /**
     * Gets the stream source frequency divider value.
     * @param {Integer} StreamNumber Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Stream source number.
     * @param {Pointer<Integer>} pSetting 
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getstreamsourcefreq
     */
    GetStreamSourceFreq(StreamNumber, pSetting) {
        pSettingMarshal := pSetting is VarRef ? "uint*" : "ptr"

        result := ComCall(103, this, "uint", StreamNumber, pSettingMarshal, pSetting, "HRESULT")
        return result
    }

    /**
     * Sets index data.
     * @param {IDirect3DIndexBuffer9} pIndexData Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dindexbuffer9">IDirect3DIndexBuffer9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dindexbuffer9">IDirect3DIndexBuffer9</a> interface, representing the index data to be set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be: D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setindices
     */
    SetIndices(pIndexData) {
        result := ComCall(104, this, "ptr", pIndexData, "HRESULT")
        return result
    }

    /**
     * Retrieves index data.
     * @returns {IDirect3DIndexBuffer9} Type: [out] <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dindexbuffer9">IDirect3DIndexBuffer9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dindexbuffer9">IDirect3DIndexBuffer9</a> interface, representing the returned index data.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getindices
     */
    GetIndices() {
        result := ComCall(105, this, "ptr*", &ppIndexData := 0, "HRESULT")
        return IDirect3DIndexBuffer9(ppIndexData)
    }

    /**
     * Creates a pixel shader.
     * @param {Pointer<Integer>} pFunction Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to the pixel shader function token array, specifying the blending operations. This value cannot be <b>NULL</b>.
     * @returns {IDirect3DPixelShader9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dpixelshader9">IDirect3DPixelShader9</a>**</b>
     * 
     * Pointer to the returned pixel shader interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dpixelshader9">IDirect3DPixelShader9</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-createpixelshader
     */
    CreatePixelShader(pFunction) {
        pFunctionMarshal := pFunction is VarRef ? "uint*" : "ptr"

        result := ComCall(106, this, pFunctionMarshal, pFunction, "ptr*", &ppShader := 0, "HRESULT")
        return IDirect3DPixelShader9(ppShader)
    }

    /**
     * Sets the current pixel shader to a previously created pixel shader.
     * @param {IDirect3DPixelShader9} pShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dpixelshader9">IDirect3DPixelShader9</a>*</b>
     * 
     * Pixel shader interface.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setpixelshader
     */
    SetPixelShader(pShader) {
        result := ComCall(107, this, "ptr", pShader, "HRESULT")
        return result
    }

    /**
     * Retrieves the currently set pixel shader.
     * @returns {IDirect3DPixelShader9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dpixelshader9">IDirect3DPixelShader9</a>**</b>
     * 
     * Pointer to a pixel shader interface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getpixelshader
     */
    GetPixelShader() {
        result := ComCall(108, this, "ptr*", &ppShader := 0, "HRESULT")
        return IDirect3DPixelShader9(ppShader)
    }

    /**
     * Sets a floating-point shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Float>} pConstantData Type: <b>const float*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4fCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four float vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setpixelshaderconstantf
     */
    SetPixelShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "float*" : "ptr"

        result := ComCall(109, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4fCount, "HRESULT")
        return result
    }

    /**
     * Gets a floating-point shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Float>} pConstantData Type: <b>float*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4fCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four float vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getpixelshaderconstantf
     */
    GetPixelShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "float*" : "ptr"

        result := ComCall(110, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4fCount, "HRESULT")
        return result
    }

    /**
     * Sets an integer shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Integer>} pConstantData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4iCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four integer vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setpixelshaderconstanti
     */
    SetPixelShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(111, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4iCount, "HRESULT")
        return result
    }

    /**
     * Gets an integer shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Integer>} pConstantData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4iCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four integer vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getpixelshaderconstanti
     */
    GetPixelShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(112, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4iCount, "HRESULT")
        return result
    }

    /**
     * Sets a Boolean shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<BOOL>} pConstantData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} BoolCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of boolean values in the array of constants.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-setpixelshaderconstantb
     */
    SetPixelShaderConstantB(StartRegister, pConstantData, BoolCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(113, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", BoolCount, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<BOOL>} pConstantData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} BoolCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of Boolean values in the array of constants.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-getpixelshaderconstantb
     */
    GetPixelShaderConstantB(StartRegister, pConstantData, BoolCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(114, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", BoolCount, "HRESULT")
        return result
    }

    /**
     * Draws a rectangular patch using the currently set streams.
     * @param {Integer} Handle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Handle to the rectangular patch to draw.
     * @param {Pointer<Float>} pNumSegs Type: <b>const float*</b>
     * 
     * Pointer to an array of four floating-point values that identify the number of segments each edge of the rectangle patch should be divided into when tessellated. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drectpatch-info">D3DRECTPATCH_INFO</a>.
     * @param {Pointer<D3DRECTPATCH_INFO>} pRectPatchInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drectpatch-info">D3DRECTPATCH_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drectpatch-info">D3DRECTPATCH_INFO</a> structure, describing the rectangular patch to draw.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be 
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-drawrectpatch
     */
    DrawRectPatch(Handle, pNumSegs, pRectPatchInfo) {
        pNumSegsMarshal := pNumSegs is VarRef ? "float*" : "ptr"

        result := ComCall(115, this, "uint", Handle, pNumSegsMarshal, pNumSegs, "ptr", pRectPatchInfo, "HRESULT")
        return result
    }

    /**
     * Draws a triangular patch using the currently set streams.
     * @param {Integer} Handle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Handle to the triangular patch to draw.
     * @param {Pointer<Float>} pNumSegs Type: <b>const float*</b>
     * 
     * Pointer to an array of three floating-point values that identify the number of segments each edge of the triangle patch should be divided into when tessellated. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtripatch-info">D3DTRIPATCH_INFO</a>.
     * @param {Pointer<D3DTRIPATCH_INFO>} pTriPatchInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtripatch-info">D3DTRIPATCH_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtripatch-info">D3DTRIPATCH_INFO</a> structure, describing the triangular high-order patch to draw.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be 
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-drawtripatch
     */
    DrawTriPatch(Handle, pNumSegs, pTriPatchInfo) {
        pNumSegsMarshal := pNumSegs is VarRef ? "float*" : "ptr"

        result := ComCall(116, this, "uint", Handle, pNumSegsMarshal, pNumSegs, "ptr", pTriPatchInfo, "HRESULT")
        return result
    }

    /**
     * Frees a cached high-order patch.
     * @param {Integer} Handle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Handle of the cached high-order patch to delete.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be 
     *      D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-deletepatch
     */
    DeletePatch(Handle) {
        result := ComCall(117, this, "uint", Handle, "HRESULT")
        return result
    }

    /**
     * Creates a status query.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dquerytype">D3DQUERYTYPE</a></b>
     * 
     * Identifies the query type. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dquerytype">D3DQUERYTYPE</a>.
     * @returns {IDirect3DQuery9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dquery9">IDirect3DQuery9</a>**</b>
     * 
     * Returns a pointer to the query interface that manages the query object. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dquery9">IDirect3DQuery9</a>. 
     * 
     * This parameter can be set to <b>NULL</b> to see if a query is supported. If the query is not supported, the method returns D3DERR_NOTAVAILABLE.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3ddevice9-createquery
     */
    CreateQuery(Type) {
        result := ComCall(118, this, "int", Type, "ptr*", &ppQuery := 0, "HRESULT")
        return IDirect3DQuery9(ppQuery)
    }
}
