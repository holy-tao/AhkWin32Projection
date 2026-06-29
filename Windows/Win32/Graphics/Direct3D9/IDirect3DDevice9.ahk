#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3DTRIPATCH_INFO.ahk" { D3DTRIPATCH_INFO }
#Import ".\D3DCLIPSTATUS9.ahk" { D3DCLIPSTATUS9 }
#Import ".\IDirect3DCubeTexture9.ahk" { IDirect3DCubeTexture9 }
#Import ".\IDirect3DVertexDeclaration9.ahk" { IDirect3DVertexDeclaration9 }
#Import ".\D3DRENDERSTATETYPE.ahk" { D3DRENDERSTATETYPE }
#Import ".\IDirect3DPixelShader9.ahk" { IDirect3DPixelShader9 }
#Import ".\IDirect3DBaseTexture9.ahk" { IDirect3DBaseTexture9 }
#Import ".\IDirect3DVolumeTexture9.ahk" { IDirect3DVolumeTexture9 }
#Import ".\IDirect3DStateBlock9.ahk" { IDirect3DStateBlock9 }
#Import ".\IDirect3DVertexShader9.ahk" { IDirect3DVertexShader9 }
#Import ".\D3DCAPS9.ahk" { D3DCAPS9 }
#Import ".\D3DMULTISAMPLE_TYPE.ahk" { D3DMULTISAMPLE_TYPE }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import ".\D3DFORMAT.ahk" { D3DFORMAT }
#Import ".\D3DPRESENT_PARAMETERS.ahk" { D3DPRESENT_PARAMETERS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDirect3DTexture9.ahk" { IDirect3DTexture9 }
#Import "..\Gdi\PALETTEENTRY.ahk" { PALETTEENTRY }
#Import ".\IDirect3DIndexBuffer9.ahk" { IDirect3DIndexBuffer9 }
#Import ".\D3DPRIMITIVETYPE.ahk" { D3DPRIMITIVETYPE }
#Import ".\IDirect3DQuery9.ahk" { IDirect3DQuery9 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3DLIGHT9.ahk" { D3DLIGHT9 }
#Import ".\D3DTEXTURESTAGESTATETYPE.ahk" { D3DTEXTURESTAGESTATETYPE }
#Import ".\D3DMATERIAL9.ahk" { D3DMATERIAL9 }
#Import ".\D3DQUERYTYPE.ahk" { D3DQUERYTYPE }
#Import ".\D3DSTATEBLOCKTYPE.ahk" { D3DSTATEBLOCKTYPE }
#Import "..\Gdi\RGNDATA.ahk" { RGNDATA }
#Import ".\D3DDISPLAYMODE.ahk" { D3DDISPLAYMODE }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\D3DRECTPATCH_INFO.ahk" { D3DRECTPATCH_INFO }
#Import ".\IDirect3D9.ahk" { IDirect3D9 }
#Import ".\D3DRECT.ahk" { D3DRECT }
#Import ".\D3DGAMMARAMP.ahk" { D3DGAMMARAMP }
#Import ".\D3DPOOL.ahk" { D3DPOOL }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\IDirect3DSwapChain9.ahk" { IDirect3DSwapChain9 }
#Import ".\D3DTRANSFORMSTATETYPE.ahk" { D3DTRANSFORMSTATETYPE }
#Import ".\D3DSAMPLERSTATETYPE.ahk" { D3DSAMPLERSTATETYPE }
#Import "..\Direct3D\D3DMATRIX.ahk" { D3DMATRIX }
#Import ".\D3DDEVICE_CREATION_PARAMETERS.ahk" { D3DDEVICE_CREATION_PARAMETERS }
#Import ".\D3DVERTEXELEMENT9.ahk" { D3DVERTEXELEMENT9 }
#Import ".\D3DRASTER_STATUS.ahk" { D3DRASTER_STATUS }
#Import ".\D3DVIEWPORT9.ahk" { D3DVIEWPORT9 }
#Import ".\D3DBACKBUFFER_TYPE.ahk" { D3DBACKBUFFER_TYPE }
#Import ".\D3DTEXTUREFILTERTYPE.ahk" { D3DTEXTUREFILTERTYPE }
#Import ".\IDirect3DVertexBuffer9.ahk" { IDirect3DVertexBuffer9 }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * The IDirect3DDevice9 (d3d9.h) applications use the methods of the IDirect3DDevice9 interface to perform DrawPrimitive-based rendering and create resources.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3ddevice9
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct IDirect3DDevice9 extends IUnknown {
    /**
     * The interface identifier for IDirect3DDevice9
     * @type {Guid}
     */
    static IID := Guid("{d0223b96-bf7a-43fd-92bd-a43b0d82b9eb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirect3DDevice9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        TestCooperativeLevel        : IntPtr
        GetAvailableTextureMem      : IntPtr
        EvictManagedResources       : IntPtr
        GetDirect3D                 : IntPtr
        GetDeviceCaps               : IntPtr
        GetDisplayMode              : IntPtr
        GetCreationParameters       : IntPtr
        SetCursorProperties         : IntPtr
        SetCursorPosition           : IntPtr
        ShowCursor                  : IntPtr
        CreateAdditionalSwapChain   : IntPtr
        GetSwapChain                : IntPtr
        GetNumberOfSwapChains       : IntPtr
        Reset                       : IntPtr
        Present                     : IntPtr
        GetBackBuffer               : IntPtr
        GetRasterStatus             : IntPtr
        SetDialogBoxMode            : IntPtr
        SetGammaRamp                : IntPtr
        GetGammaRamp                : IntPtr
        CreateTexture               : IntPtr
        CreateVolumeTexture         : IntPtr
        CreateCubeTexture           : IntPtr
        CreateVertexBuffer          : IntPtr
        CreateIndexBuffer           : IntPtr
        CreateRenderTarget          : IntPtr
        CreateDepthStencilSurface   : IntPtr
        UpdateSurface               : IntPtr
        UpdateTexture               : IntPtr
        GetRenderTargetData         : IntPtr
        GetFrontBufferData          : IntPtr
        StretchRect                 : IntPtr
        ColorFill                   : IntPtr
        CreateOffscreenPlainSurface : IntPtr
        SetRenderTarget             : IntPtr
        GetRenderTarget             : IntPtr
        SetDepthStencilSurface      : IntPtr
        GetDepthStencilSurface      : IntPtr
        BeginScene                  : IntPtr
        EndScene                    : IntPtr
        Clear                       : IntPtr
        SetTransform                : IntPtr
        GetTransform                : IntPtr
        MultiplyTransform           : IntPtr
        SetViewport                 : IntPtr
        GetViewport                 : IntPtr
        SetMaterial                 : IntPtr
        GetMaterial                 : IntPtr
        SetLight                    : IntPtr
        GetLight                    : IntPtr
        LightEnable                 : IntPtr
        GetLightEnable              : IntPtr
        SetClipPlane                : IntPtr
        GetClipPlane                : IntPtr
        SetRenderState              : IntPtr
        GetRenderState              : IntPtr
        CreateStateBlock            : IntPtr
        BeginStateBlock             : IntPtr
        EndStateBlock               : IntPtr
        SetClipStatus               : IntPtr
        GetClipStatus               : IntPtr
        GetTexture                  : IntPtr
        SetTexture                  : IntPtr
        GetTextureStageState        : IntPtr
        SetTextureStageState        : IntPtr
        GetSamplerState             : IntPtr
        SetSamplerState             : IntPtr
        ValidateDevice              : IntPtr
        SetPaletteEntries           : IntPtr
        GetPaletteEntries           : IntPtr
        SetCurrentTexturePalette    : IntPtr
        GetCurrentTexturePalette    : IntPtr
        SetScissorRect              : IntPtr
        GetScissorRect              : IntPtr
        SetSoftwareVertexProcessing : IntPtr
        GetSoftwareVertexProcessing : IntPtr
        SetNPatchMode               : IntPtr
        GetNPatchMode               : IntPtr
        DrawPrimitive               : IntPtr
        DrawIndexedPrimitive        : IntPtr
        DrawPrimitiveUP             : IntPtr
        DrawIndexedPrimitiveUP      : IntPtr
        ProcessVertices             : IntPtr
        CreateVertexDeclaration     : IntPtr
        SetVertexDeclaration        : IntPtr
        GetVertexDeclaration        : IntPtr
        SetFVF                      : IntPtr
        GetFVF                      : IntPtr
        CreateVertexShader          : IntPtr
        SetVertexShader             : IntPtr
        GetVertexShader             : IntPtr
        SetVertexShaderConstantF    : IntPtr
        GetVertexShaderConstantF    : IntPtr
        SetVertexShaderConstantI    : IntPtr
        GetVertexShaderConstantI    : IntPtr
        SetVertexShaderConstantB    : IntPtr
        GetVertexShaderConstantB    : IntPtr
        SetStreamSource             : IntPtr
        GetStreamSource             : IntPtr
        SetStreamSourceFreq         : IntPtr
        GetStreamSourceFreq         : IntPtr
        SetIndices                  : IntPtr
        GetIndices                  : IntPtr
        CreatePixelShader           : IntPtr
        SetPixelShader              : IntPtr
        GetPixelShader              : IntPtr
        SetPixelShaderConstantF     : IntPtr
        GetPixelShaderConstantF     : IntPtr
        SetPixelShaderConstantI     : IntPtr
        GetPixelShaderConstantI     : IntPtr
        SetPixelShaderConstantB     : IntPtr
        GetPixelShaderConstantB     : IntPtr
        DrawRectPatch               : IntPtr
        DrawTriPatch                : IntPtr
        DeletePatch                 : IntPtr
        CreateQuery                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirect3DDevice9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDirect3DDevice9::TestCooperativeLevel method (d3d9.h) reports the current cooperative-level status of the Direct3D device for a windowed or full-screen application.
     * @remarks
     * If the device is lost but cannot be restored at the current time, <b>IDirect3DDevice9::TestCooperativeLevel</b> returns the D3DERR_DEVICELOST return code. This would be the case, for example, when a full-screen device has lost focus. If an application detects a lost device, it should pause and periodically call <b>IDirect3DDevice9::TestCooperativeLevel</b> until it receives a return value of D3DERR_DEVICENOTRESET. The application may then attempt to reset the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-reset">IDirect3DDevice9::Reset</a> and, if this succeeds, restore the necessary resources and resume normal operation. Note that <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-present">IDirect3DDevice9::Present</a> will return D3DERR_DEVICELOST if the device is either "lost" or "not reset".
     * 
     * A call to <b>IDirect3DDevice9::TestCooperativeLevel</b> will fail if called on a different thread than that used to create the device being reset.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK, indicating that the device is operational and the calling application can continue.
     *  If the method fails, the return value can be one of the following values: D3DERR_DEVICELOST, D3DERR_DEVICENOTRESET, D3DERR_DRIVERINTERNALERROR.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-testcooperativelevel
     */
    TestCooperativeLevel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetAvailableTextureMem method (d3d9.h) returns an estimate of the amount of available texture memory.
     * @remarks
     * The returned value is rounded to the nearest MB. This is done to reflect the fact that video memory estimates are never precise due to alignment and other issues that affect consumption by certain resources. Applications can use this value to make gross estimates of memory availability to make large-scale resource decisions such as how many levels of a mipmap to attempt to allocate, but applications cannot use this value to make small-scale decisions such as if there is enough memory left to allocate another resource.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The function returns an estimate of the available texture memory.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getavailabletexturemem
     */
    GetAvailableTextureMem() {
        result := ComCall(4, this, UInt32)
        return result
    }

    /**
     * The IDirect3DDevice9::EvictManagedResources method (d3d9.h) evicts all managed resources, including both Direct3D and driver-managed resources.
     * @remarks
     * This function causes only the D3DPOOL_DEFAULT copy of resources to be evicted. The resource copy in system memory is retained. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_OUTOFVIDEOMEMORY, D3DERR_COMMAND_UNPARSED.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-evictmanagedresources
     */
    EvictManagedResources() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetDirect3D method (d3d9.h) returns an interface to the instance of the Direct3D object that created the device.
     * @remarks
     * Calling <b>IDirect3DDevice9::GetDirect3D</b> will increase the internal reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a> interface. Failure to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when finished using this <b>IDirect3D9</b> interface results in a memory leak.
     * @returns {IDirect3D9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a> interface, representing the interface of the Direct3D object that created the device.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getdirect3d
     */
    GetDirect3D() {
        result := ComCall(6, this, "ptr*", &ppD3D9 := 0, "HRESULT")
        return IDirect3D9(ppD3D9)
    }

    /**
     * The IDirect3DDevice9::GetDeviceCaps method (d3d9.h) retrieves the capabilities of the rendering device.
     * @remarks
     * <b>IDirect3DDevice9::GetDeviceCaps</b> retrieves the software vertex pipeline capabilities when the device is being used in software vertex processing mode.
     * @param {Pointer<D3DCAPS9>} pCaps Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure, describing the returned device.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getdevicecaps
     */
    GetDeviceCaps(pCaps) {
        result := ComCall(7, this, D3DCAPS9.Ptr, pCaps, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetDisplayMode method (d3d9.h) retrieves the display mode's spatial resolution, color resolution, and refresh frequency.
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An unsigned integer specifying the swap chain.
     * @param {Pointer<D3DDISPLAYMODE>} pMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymode">D3DDISPLAYMODE</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddisplaymode">D3DDISPLAYMODE</a> structure containing data about the display mode of the adapter. As opposed to the display mode of the device, which may not be active if the device does not own full-screen mode.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getdisplaymode
     */
    GetDisplayMode(iSwapChain, pMode) {
        result := ComCall(8, this, "uint", iSwapChain, D3DDISPLAYMODE.Ptr, pMode, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetCreationParameters method (d3d9.h) retrieves the creation parameters of the device.
     * @remarks
     * You can query the AdapterOrdinal member of the returned <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevice-creation-parameters">D3DDEVICE_CREATION_PARAMETERS</a> structure to retrieve the ordinal of the adapter represented by this device.
     * @param {Pointer<D3DDEVICE_CREATION_PARAMETERS>} pParameters Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevice-creation-parameters">D3DDEVICE_CREATION_PARAMETERS</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevice-creation-parameters">D3DDEVICE_CREATION_PARAMETERS</a> structure, describing the creation parameters of the device.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     * 
     * 
     * D3DERR_INVALIDCALL is returned if the argument is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getcreationparameters
     */
    GetCreationParameters(pParameters) {
        result := ComCall(9, this, D3DDEVICE_CREATION_PARAMETERS.Ptr, pParameters, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetCursorProperties method (d3d9.h) sets properties for the cursor.
     * @remarks
     * An operating system cursor is created and used under either of these conditions:
     * 
     * <ul>
     * <li>The hardware has set D3DCURSORCAPS_COLOR (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcursorcaps">D3DCURSORCAPS</a>), and the cursor size is 32x32 (which is the cursor size in the operating system).</li>
     * <li>The application is running in windowed mode.</li>
     * </ul>
     * Otherwise, DirectX uses an emulated cursor. An application uses <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setcursorposition">IDirect3DDevice9::SetCursorPosition</a> to move an emulated cursor to follow mouse movement.
     * 
     * It is recommended for applications to always trap WM_MOUSEMOVE events and call DXSetCursorPosition.
     * 
     * Direct3D cursor functions use either GDI cursor or software emulation, depending on the hardware. Users typically want to respond to a WM_SETCURSOR message. For example, they might want to write the message handler as follows:
     * 
     * 
     * ```
     * 
     * case WM_SETCURSOR:
     * // Turn off window cursor. 
     * SetCursor( NULL );
     * m_pd3dDevice->ShowCursor( TRUE );
     * return TRUE; // Prevent Windows from setting cursor to window class cursor.
     * break;
     * 
     * ```
     * 
     * 
     * Or, users might want to call the <b>IDirect3DDevice9::SetCursorProperties</b> method if they want to change the cursor. 
     * 
     * The application can determine what hardware support is available for cursors by examining appropriate members of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure. Typically, hardware supports only 32x32 cursors and, when windowed, the system might support only 32x32 cursors. In this case, <b>IDirect3DDevice9::SetCursorProperties</b> still succeeds but the cursor might be reduced to that size. The hot spot is scaled appropriately.
     * 
     * The cursor does not survive when the device is lost. This method must be called after the device is reset.
     * @param {Integer} XHotSpot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * X-coordinate offset (in pixels) that marks the center of the cursor. The offset is relative to the upper-left corner of the cursor. When the cursor is given a new position, the image is drawn at an offset from this new position determined by subtracting the hot spot coordinates from the position.
     * @param {Integer} YHotSpot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Y-coordinate offset (in pixels) that marks the center of the cursor. The offset is relative to the upper-left corner of the cursor. When the cursor is given a new position, the image is drawn at an offset from this new position determined by subtracting the hot spot coordinates from the position.
     * @param {IDirect3DSurface9} pCursorBitmap Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface. This parameter must point to an 8888 ARGB surface (format D3DFMT_A8R8G8B8). The contents of this surface will be copied and potentially format-converted into an internal buffer from which the cursor is displayed. The dimensions of this surface must be less than the dimensions of the display mode, and must be a power of two in each direction, although not necessarily the same power of two. The alpha channel must be either 0.0 or 1.0.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setcursorproperties
     */
    SetCursorProperties(XHotSpot, YHotSpot, pCursorBitmap) {
        result := ComCall(10, this, "uint", XHotSpot, "uint", YHotSpot, "ptr", pCursorBitmap, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetCursorPosition method (d3d9.h) sets the cursor position and update options.
     * @remarks
     * When running in full-screen mode, screen space coordinates are the back buffer coordinates appropriately scaled to the current display mode. When running in windowed mode, screen space coordinates are the desktop coordinates. The cursor image is drawn at the specified position minus the hotspot-offset specified by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setcursorproperties">SetCursorProperties</a> method.
     * 
     * If the cursor has been hidden by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-showcursor">ShowCursor</a>, the cursor is not drawn.
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setcursorposition
     */
    SetCursorPosition(X, Y, Flags) {
        ComCall(11, this, "int", X, "int", Y, "uint", Flags)
    }

    /**
     * The IDirect3DDevice9::ShowCursor method (d3d9helper.h) displays or hides the cursor.
     * @remarks
     * Direct3D cursor functions use either GDI cursor or software emulation, depending on the hardware. Users usually want to respond to a WM_SETCURSOR message. For example, the users might want to write the message handler like this:
     * 
     * 
     * ```
     * 
     *     
     * case WM_SETCURSOR:
     * 
     * // Turn off window cursor 
     *     
     * SetCursor( NULL );
     *     
     * m_pd3dDevice->ShowCursor( TRUE );
     *     
     * return TRUE; // prevent Windows from setting cursor to window class cursor
     *     
     * break;
     * 
     * ```
     * 
     * 
     * Or users might want to call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setcursorproperties">IDirect3DDevice9::SetCursorProperties</a> method if they want to change the cursor. See the code in the DirectX Graphics C/C++ Samples for more detail.
     * @param {BOOL} bShow Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If bShow is <b>TRUE</b>, the cursor is shown. If bShow is <b>FALSE</b>, the cursor is hidden.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Value indicating whether the cursor was previously visible. <b>TRUE</b> if the cursor was previously visible, or <b>FALSE</b> if the cursor was not previously visible.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-showcursor
     */
    ShowCursor(bShow) {
        result := ComCall(12, this, BOOL, bShow, BOOL)
        return result
    }

    /**
     * The IDirect3DDevice9::CreateAdditionalSwapChain method (d3d9.h) creates an additional swap chain for rendering multiple views.
     * @remarks
     * There is always at least one swap chain (the implicit swap chain) for each device because Direct3D 9 has one swap chain as a property of the device. 
     * 
     * Note that any given device can support only one full-screen swap chain.
     * 
     * D3DFMT_UNKNOWN can be specified for the windowed mode back buffer format when calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">IDirect3D9::CreateDevice</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-reset">IDirect3DDevice9::Reset</a> and CreateAdditionalSwapChain. This means the application does not have to query the current desktop format before calling CreateDevice for windowed mode. For full-screen mode, the back buffer format must be specified.
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createadditionalswapchain
     */
    CreateAdditionalSwapChain(pPresentationParameters) {
        result := ComCall(13, this, D3DPRESENT_PARAMETERS.Ptr, pPresentationParameters, "ptr*", &pSwapChain := 0, "HRESULT")
        return IDirect3DSwapChain9(pSwapChain)
    }

    /**
     * The IDirect3DDevice9::GetSwapChain method (d3d9.h) gets a pointer to a swap chain.
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The swap chain ordinal value.  For more information, see NumberOfAdaptersInGroup in <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a>.
     * @returns {IDirect3DSwapChain9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dswapchain9">IDirect3DSwapChain9</a>**</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dswapchain9">IDirect3DSwapChain9</a> interface that will receive a copy of swap chain.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getswapchain
     */
    GetSwapChain(iSwapChain) {
        result := ComCall(14, this, "uint", iSwapChain, "ptr*", &pSwapChain := 0, "HRESULT")
        return IDirect3DSwapChain9(pSwapChain)
    }

    /**
     * The IDirect3DDevice9::GetNumberOfSwapChains method (d3d9.h) gets the number of implicit swap chains.
     * @remarks
     * Implicit swap chains are created by the device during <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">IDirect3D9::CreateDevice</a>. This method returns the number of swap chains created by CreateDevice. 
     *     
     * 
     * 
     * An application may create additional swap chains using <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createadditionalswapchain">IDirect3DDevice9::CreateAdditionalSwapChain</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of implicit swap chains. See Remarks.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getnumberofswapchains
     */
    GetNumberOfSwapChains() {
        result := ComCall(15, this, UInt32)
        return result
    }

    /**
     * The IDirect3DDevice9::Reset method (d3d9.h) resets the type, size, and format of the swap chain.
     * @remarks
     * If a call to <b>IDirect3DDevice9::Reset</b> fails, the device will be placed in the "lost" state (as indicated by a return value of D3DERR_DEVICELOST from a call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-testcooperativelevel">IDirect3DDevice9::TestCooperativeLevel</a>) unless it is already in the "not reset" state (as indicated by a return value of D3DERR_DEVICENOTRESET from a call to <b>IDirect3DDevice9::TestCooperativeLevel</b>). Refer to <b>IDirect3DDevice9::TestCooperativeLevel</b> and <a href="https://docs.microsoft.com/windows/desktop/direct3d9/lost-devices">Lost Devices (Direct3D 9)</a> for further information concerning the use of <b>IDirect3DDevice9::Reset</b> in the context of lost devices.
     * 
     * Calling <b>IDirect3DDevice9::Reset</b> causes all texture memory surfaces to be lost, managed textures to be flushed from video memory, and all state information to be lost. Before calling the <b>IDirect3DDevice9::Reset</b> method for a device, an application should release any explicit render targets, depth stencil surfaces, additional swap chains, state blocks, and D3DPOOL_DEFAULT resources associated with the device.
     * 
     * There are two different types of swap chains: full-screen or windowed. If the new swap chain is full-screen, the adapter will be placed in the display mode that matches the new size.
     * 
     * Direct3D 9 applications can expect messages to be sent to them during this call (for example, before this call is returned); applications should take precautions not to call into Direct3D at this time. In addition, when <b>IDirect3DDevice9::Reset</b> fails, the only valid methods that can be called are <b>IDirect3DDevice9::Reset</b>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-testcooperativelevel">IDirect3DDevice9::TestCooperativeLevel</a>, and the various Release member functions. Calling any other method can result in an exception.
     * 
     * A call to <b>IDirect3DDevice9::Reset</b> will fail if called on a different thread than that used to create the device being reset.
     * 
     * Pixel shaders and vertex shaders survive <b>IDirect3DDevice9::Reset</b> calls for Direct3D 9. They do not need to be re-created explicitly by the application.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFMT_UNKNOWN</a> can be specified for the windowed mode back buffer format when calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">IDirect3D9::CreateDevice</a>, <b>IDirect3DDevice9::Reset</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createadditionalswapchain">IDirect3DDevice9::CreateAdditionalSwapChain</a>. This means the application does not have to query the current desktop format before calling <b>IDirect3D9::CreateDevice</b> for windowed mode. For full-screen mode, the back buffer format must be specified. Setting BackBufferCount equal to zero  (BackBufferCount = 0) results in one back buffer.
     * 
     * When trying to reset more than one display adapter in a group, set pPresentationParameters to point to an array of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a> structures, one for each display in the adapter group.
     * 
     * If a multihead device was created with <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE_ADAPTERGROUP_DEVICE</a>, <b>IDirect3DDevice9::Reset</b> requires an array of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpresent-parameters">D3DPRESENT_PARAMETERS</a> structures wherein each structure must specify a full-screen display. To switch back to windowed mode, the application must destroy the device and re-create a non-multihead device in windowed mode.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Possible return values include: D3D_OK, D3DERR_DEVICELOST, D3DERR_DEVICEREMOVED, D3DERR_DRIVERINTERNALERROR, or D3DERR_OUTOFVIDEOMEMORY (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3derr">D3DERR</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-reset
     */
    Reset(pPresentationParameters) {
        result := ComCall(16, this, D3DPRESENT_PARAMETERS.Ptr, pPresentationParameters, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::Present method (d3d9.h) presents the contents of the next buffer in the sequence of back buffers owned by the device.
     * @remarks
     * If necessary, a stretch operation is applied to transfer the pixels within the source rectangle to the destination rectangle in the client area of the target window. 
     * 
     * <b>Present</b> will fail, returning D3DERR_INVALIDCALL, if called between BeginScene and EndScene pairs unless the render target is not the current render target (such as the back buffer you get from creating an additional swap chain). This is a new behavior for Direct3D 9.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Possible return values include: D3D_OK or D3DERR_DEVICEREMOVED (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3derr">D3DERR</a>).
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-present
     */
    Present(pSourceRect, pDestRect, hDestWindowOverride, pDirtyRegion) {
        result := ComCall(17, this, RECT.Ptr, pSourceRect, RECT.Ptr, pDestRect, HWND, hDestWindowOverride, RGNDATA.Ptr, pDirtyRegion, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetBackBuffer method (d3d9.h) retrieves a back buffer from the device's swap chain.
     * @remarks
     * Calling this method will increase the internal reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface. Failure to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when finished using this <b>IDirect3DSurface9</b> interface results in a memory leak.
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An unsigned integer specifying the swap chain.
     * @param {Integer} iBackBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the back buffer object to return. Back buffers are numbered from 0 to the total number of back buffers minus one. A value of 0 returns the first back buffer, not the front buffer. The front buffer is not accessible through this method. Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-getfrontbufferdata">IDirect3DDevice9::GetFrontBufferData</a> to retrieve a copy of the front buffer.
     * @param {D3DBACKBUFFER_TYPE} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dbackbuffer-type">D3DBACKBUFFER_TYPE</a></b>
     * 
     * Stereo view is not supported in Direct3D 9, so the only valid value for this parameter is D3DBACKBUFFER_TYPE_MONO.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface, representing the returned back buffer surface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getbackbuffer
     */
    GetBackBuffer(iSwapChain, iBackBuffer, Type) {
        result := ComCall(18, this, "uint", iSwapChain, "uint", iBackBuffer, D3DBACKBUFFER_TYPE, Type, "ptr*", &ppBackBuffer := 0, "HRESULT")
        return IDirect3DSurface9(ppBackBuffer)
    }

    /**
     * The IDirect3DDevice9::GetRasterStatus method (d3d9.h) returns information describing the raster of the monitor on which the swap chain is presented.
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An unsigned integer specifying the swap chain.
     * @param {Pointer<D3DRASTER_STATUS>} pRasterStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3draster-status">D3DRASTER_STATUS</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3draster-status">D3DRASTER_STATUS</a> structure filled with information about the position or other status of the raster on the monitor driven by this adapter.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if pRasterStatus is invalid or if the device does not support reading the current scan line. To determine if the device supports reading the scan line, check for the D3DCAPS_READ_SCANLINE flag in the Caps member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getrasterstatus
     */
    GetRasterStatus(iSwapChain, pRasterStatus) {
        result := ComCall(19, this, "uint", iSwapChain, D3DRASTER_STATUS.Ptr, pRasterStatus, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetDialogBoxMode method (d3d9.h) allows the use of GDI dialog boxes in full-screen mode applications.
     * @remarks
     * The GDI dialog boxes must be created as child to the device window. They should also be created within the same thread that created the device because this enables the parent window to manage redrawing the child window.
     * 
     * The method has no effect for windowed mode applications, but this setting will be respected if the application resets the device into full-screen mode. If SetDialogBoxMode succeeds in a windowed mode application, any subsequent reset to full-screen mode will be checked against the restrictions listed above.  Also, SetDialogBoxMode causes all back buffers on the swap chain to be discarded, so an application is expected to refresh its content for all back buffers after this call.
     * @param {BOOL} bEnableDialogs Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> to enable GDI dialog boxes, and <b>FALSE</b> to disable them.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setdialogboxmode
     */
    SetDialogBoxMode(bEnableDialogs) {
        result := ComCall(20, this, BOOL, bEnableDialogs, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetGammaRamp method (d3d9.h) sets the gamma correction ramp for the implicit swap chain.
     * @remarks
     * There is always at least one swap chain (the implicit swap chain) for each device, because Direct3D 9 has one swap chain as a property of the device. The gamma ramp takes effect immediately; there is no wait for a vertical sync.
     * 
     * If the device does not support gamma ramps in the swap chain's current presentation mode (full-screen or windowed), no error return is given. Applications can check the D3DCAPS2_FULLSCREENGAMMA and D3DCAPS2_CANCALIBRATEGAMMA capability bits in the Caps2 member of the D3DCAPS9 structure to determine the capabilities of the device and whether a calibrator is installed.
     * 
     * For windowed gamma correction presentation, use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dswapchain9-present">IDirect3DSwapChain9::Present</a> if the hardware supports the feature. In DirectX 8, SetGammaRamp will set the gamma ramp only on a full-screen mode application. For more information about gamma correction, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/gamma">Gamma (Direct3D 9)</a>.
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Unsigned integer specifying the swap chain.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @param {Pointer<D3DGAMMARAMP>} pRamp Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dgammaramp">D3DGAMMARAMP</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dgammaramp">D3DGAMMARAMP</a> structure, representing the gamma correction ramp to be set for the implicit swap chain.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setgammaramp
     */
    SetGammaRamp(iSwapChain, Flags, pRamp) {
        ComCall(21, this, "uint", iSwapChain, "uint", Flags, D3DGAMMARAMP.Ptr, pRamp)
    }

    /**
     * The IDirect3DDevice9::GetGammaRamp method (d3d9.h) retrieves the gamma correction ramp for the swap chain.
     * @param {Integer} iSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An unsigned integer specifying the swap chain.
     * @param {Pointer<D3DGAMMARAMP>} pRamp Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dgammaramp">D3DGAMMARAMP</a>*</b>
     * 
     * Pointer to an application-supplied <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dgammaramp">D3DGAMMARAMP</a> structure to fill with the gamma correction ramp.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getgammaramp
     */
    GetGammaRamp(iSwapChain, pRamp) {
        ComCall(22, this, "uint", iSwapChain, D3DGAMMARAMP.Ptr, pRamp)
    }

    /**
     * The IDirect3DDevice9::CreateTexture method (d3d9.h) creates a texture resource.
     * @remarks
     * An application can discover support for <a href="https://docs.microsoft.com/windows/desktop/direct3d9/automatic-generation-of-mipmaps">Automatic Generation of Mipmaps (Direct3D 9)</a> in a particular format by calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-checkdeviceformat">IDirect3D9::CheckDeviceFormat</a> with D3DUSAGE_AUTOGENMIPMAP. If <b>IDirect3D9::CheckDeviceFormat</b> returns D3DOK_NOAUTOGEN, 
     *       <b>IDirect3DDevice9::CreateTexture</b> will succeed but it will return a one-level texture.
     * 
     * In Windows Vista CreateTexture can create a texture from a system memory pointer allowing the application more flexibility over the use, allocation and deletion of 
     *       the system memory.  For example, an application could pass a GDI system memory bitmap pointer and get a Direct3D texture interface around it.  Using a system memory 
     *       pointer with CreateTexture has the following restrictions.
     * 
     * <ul>
     * <li>The pitch of the texture must be equal to the width multiplied by the number of bytes per pixel.</li>
     * <li>Only textures with a single mipmap level are supported.  The <i>Levels</i> argument must be 1.</li>
     * <li>The <i>Pool</i> argument must be D3DPOOL_SYSTEMMEM.</li>
     * <li>The <i>pSharedHandle</i> argument must be a valid pointer to a buffer that can hold the system memory point; <i>*pSharedHandle</i> must 
     *         be a valid pointer to system memory with a size in bytes of texture width * texture height * bytes per pixel of the texture format.</li>
     * </ul>
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the top-level of the texture, in pixels. The pixel dimensions of subsequent levels will be the truncated value of half of the previous level's 
     *         pixel dimension (independently). Each dimension clamps at a size of 1 pixel. Thus, if the division by 2 results in 0, 1 will be taken instead.
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the top-level of the texture, in pixels. The pixel dimensions of subsequent levels will be the truncated value of half of the previous level's 
     *         pixel dimension (independently). Each dimension clamps at a size of 1 pixel. Thus, if the division by 2 results in 0, 1 will be taken instead.
     * @param {Integer} _Levels Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of levels in the texture. If this is zero, Direct3D will generate all texture sublevels down to 1 by 1 pixels for hardware that supports 
     *         mipmapped textures. Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dbasetexture9-getlevelcount">IDirect3DBaseTexture9::GetLevelCount</a> to see the number of levels generated.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Usage can be 0, which indicates no usage value. However, if usage is desired, use a combination of one or more <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a> constants. It is 
     *         good practice to match the usage parameter with the behavior flags in <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">IDirect3D9::CreateDevice</a>.
     * @param {D3DFORMAT} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, describing the format of all levels in the texture.
     * @param {D3DPOOL} Pool Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a> enumerated type, describing the memory class into which the texture should be placed.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to 
     *         <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @returns {IDirect3DTexture9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dtexture9">IDirect3DTexture9</a>**</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dtexture9">IDirect3DTexture9</a> interface, representing the created texture resource.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createtexture
     */
    CreateTexture(Width, Height, _Levels, Usage, Format, Pool, pSharedHandle) {
        result := ComCall(23, this, "uint", Width, "uint", Height, "uint", _Levels, "uint", Usage, D3DFORMAT, Format, D3DPOOL, Pool, "ptr*", &ppTexture := 0, HANDLE.Ptr, pSharedHandle, "HRESULT")
        return IDirect3DTexture9(ppTexture)
    }

    /**
     * The IDirect3DDevice9::CreateVolumeTexture method (d3d9.h) creates a volume texture resource.
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the top-level of the volume texture, in pixels. This value must be a power of two if the D3DPTEXTURECAPS_VOLUMEMAP_POW2 member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> is set. The pixel dimensions of subsequent levels will be the truncated value of half of the previous level's pixel dimension (independently). Each dimension clamps at a size of 1 pixel. Thus, if the division by two results in 0 (zero), 1 will be taken instead. The maximum dimension that a driver supports (for width, height, and depth) can be found in MaxVolumeExtent in <b>D3DCAPS9</b>.
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the top-level of the volume texture, in pixels. This value must be a power of two if the D3DPTEXTURECAPS_VOLUMEMAP_POW2 member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> is set. The pixel dimensions of subsequent levels will be the truncated value of half of the previous level's pixel dimension (independently). Each dimension clamps at a size of 1 pixel. Thus, if the division by 2 results in 0 (zero), 1 will be taken instead. The maximum dimension that a driver supports (for width, height, and depth) can be found in MaxVolumeExtent in <b>D3DCAPS9</b>.
     * @param {Integer} Depth Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Depth of the top-level of the volume texture, in pixels. This value must be a power of two if the D3DPTEXTURECAPS_VOLUMEMAP_POW2 member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> is set. The pixel dimensions of subsequent levels will be the truncated value of half of the previous level's pixel dimension (independently). Each dimension clamps at a size of 1 pixel. Thus, if the division by 2 results in 0 (zero), 1 will be taken instead. The maximum dimension that a driver supports (for width, height, and depth) can be found in MaxVolumeExtent in <b>D3DCAPS9</b>.
     * @param {Integer} _Levels Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of levels in the texture. If this is zero, Direct3D will generate all texture sublevels down to 1x1 pixels for hardware that supports mipmapped volume textures. Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dbasetexture9-getlevelcount">IDirect3DBaseTexture9::GetLevelCount</a> to see the number of levels generated.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Usage can be 0, which indicates no usage value. If usage is desired, use D3DUSAGE_DYNAMIC or D3DUSAGE_SOFTWAREPROCESSING. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a>.
     * @param {D3DFORMAT} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, describing the format of all levels in the volume texture.
     * @param {D3DPOOL} Pool Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a> enumerated type, describing the memory class into which the volume texture should be placed.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @returns {IDirect3DVolumeTexture9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvolumetexture9">IDirect3DVolumeTexture9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvolumetexture9">IDirect3DVolumeTexture9</a> interface, representing the created volume texture resource.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createvolumetexture
     */
    CreateVolumeTexture(Width, Height, Depth, _Levels, Usage, Format, Pool, pSharedHandle) {
        result := ComCall(24, this, "uint", Width, "uint", Height, "uint", Depth, "uint", _Levels, "uint", Usage, D3DFORMAT, Format, D3DPOOL, Pool, "ptr*", &ppVolumeTexture := 0, HANDLE.Ptr, pSharedHandle, "HRESULT")
        return IDirect3DVolumeTexture9(ppVolumeTexture)
    }

    /**
     * The IDirect3DDevice9::CreateCubeTexture method (d3d9.h) creates a cube texture resource.
     * @remarks
     * A mipmap (texture) is a collection of successively downsampled (mipmapped) surfaces. On the other hand, a cube texture (created by <b>IDirect3DDevice9::CreateCubeTexture</b>) is a collection of six textures (mipmaps), one for each face. All faces must be present in the cube texture. Also, a cube map surface must be the same pixel size in all three dimensions (x, y, and z).
     * 
     * An application can discover support for <a href="https://docs.microsoft.com/windows/desktop/direct3d9/automatic-generation-of-mipmaps">Automatic Generation of Mipmaps (Direct3D 9)</a> in a particular format by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-checkdeviceformat">IDirect3D9::CheckDeviceFormat</a> with D3DUSAGE_AUTOGENMIPMAP. If <b>IDirect3D9::CheckDeviceFormat</b> returns D3DOK_NOAUTOGEN, <b>IDirect3DDevice9::CreateCubeTexture</b> will succeed but it will return a one-level texture.
     * @param {Integer} EdgeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the edges of all the top-level faces of the cube texture. The pixel dimensions of subsequent levels of each face will be the truncated value of half of the previous level's pixel dimension (independently). Each dimension clamps at a size of 1 pixel. Thus, if the division by 2 results in 0 (zero), 1 will be taken instead.
     * @param {Integer} _Levels Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of levels in each face of the cube texture. If this is zero, Direct3D will generate all cube texture sublevels down to 1x1 pixels for each face for hardware that supports mipmapped cube textures.  Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dbasetexture9-getlevelcount">IDirect3DBaseTexture9::GetLevelCount</a> to see the number of levels generated.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Usage can be 0, which indicates no usage value. However, if usage is desired, use a combination of one or more <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a> constants. It is good practice to match the usage parameter in CreateCubeTexture with the behavior flags in <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">IDirect3D9::CreateDevice</a>. For more information, see Remarks.
     * @param {D3DFORMAT} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, describing the format of all levels in all faces of the cube texture.
     * @param {D3DPOOL} Pool Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a> enumerated type, describing the memory class into which the cube texture should be placed.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @returns {IDirect3DCubeTexture9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dcubetexture9">IDirect3DCubeTexture9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dcubetexture9">IDirect3DCubeTexture9</a> interface, representing the created cube texture resource.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createcubetexture
     */
    CreateCubeTexture(EdgeLength, _Levels, Usage, Format, Pool, pSharedHandle) {
        result := ComCall(25, this, "uint", EdgeLength, "uint", _Levels, "uint", Usage, D3DFORMAT, Format, D3DPOOL, Pool, "ptr*", &ppCubeTexture := 0, HANDLE.Ptr, pSharedHandle, "HRESULT")
        return IDirect3DCubeTexture9(ppCubeTexture)
    }

    /**
     * The IDirect3DDevice9::CreateVertexBuffer method (d3d9.h) creates a vertex buffer.
     * @remarks
     * A vertex buffer can be used with either hardware or software vertex processing. This is determined by how the device and the vertex buffer are created.
     * 
     * When a device is created, CreateDevice uses the behavior flag to determine whether to process vertices in hardware or software. There are three possibilities:
     * 
     * <ul>
     * <li>Process vertices in hardware by setting D3DCREATE_HARDWARE_VERTEXPROCESSING.</li>
     * <li>Process vertices in software by setting D3DCREATE_SOFTWARE_VERTEXPROCESSING.</li>
     * <li>Process vertices in either hardware or software by setting D3DCREATE_MIXED_VERTEXPROCESSING.</li>
     * </ul>
     * Mixed-mode devices might need to switch between software and hardware processing (using <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setsoftwarevertexprocessing">IDirect3DDevice9::SetSoftwareVertexProcessing</a>) after the device is created.   
     *     
     *     
     *     
     * 
     * When a vertex buffer is created, CreateVertexBuffer uses the usage parameter to decide whether to process vertices in hardware or software.
     * 
     * <ul>
     * <li>If CreateDevice uses D3DCREATE_HARDWARE_VERTEXPROCESSING, CreateVertexBuffer must use 0.</li>
     * <li>If CreateDevice uses D3DCREATE_SOFTWARE_VERTEXPROCESSING, CreateVertexBuffer must use either 0 or D3DUSAGE_SOFTWAREPROCESSING. For either value, vertices will be processed in software.</li>
     * <li>If CreateDevice uses D3DCREATE_MIXED_VERTEXPROCESSING, CreateVertexBuffer can use either 0 or D3DUSAGE_SOFTWAREPROCESSING.</li>
     * </ul>
     * To use a vertex buffer with a mixed mode device, create a single vertex buffer which can be used for both hardware or software processing. Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setstreamsource">IDirect3DDevice9::SetStreamSource</a> to set the current vertex buffer and use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setrenderstate">IDirect3DDevice9::SetRenderState</a>, if necessary, to change the device behavior to match. It is recommended that the vertex buffer usage matches the device behavior. Note that a vertex buffer created for software processing cannot be located in video memory.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a> interface supports rendering of primitives using vertex data stored in vertex buffer objects. Vertex buffers are created from the IDirect3DDevice9, and are usable only with the IDirect3DDevice9 object from which they are created.
     * 
     * When set to a nonzero value, which must be a valid FVF code, the FVF parameter indicates that the buffer content is to be characterized by an FVF code. A vertex buffer that is created with an FVF code is referred to as an FVF vertex buffer. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/fvf-vertex-buffers">FVF Vertex Buffers (Direct3D 9)</a>. 
     * 
     * Non-FVF buffers can be used to interleave data during multipass rendering or multitexture rendering in a single pass. To do this, one buffer contains geometry data and the others contain texture coordinates for each texture to be rendered. When rendering, the buffer containing the geometry data is interleaved with each of the buffers containing the texture coordinates. If FVF buffers were used instead, each of them would need to contain identical geometry data in addition to the texture coordinate data specific to each texture rendered. This would result in either a speed or memory penalty, depending on the strategy used. For more information about texture coordinates, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/texture-coordinates">Texture Coordinates (Direct3D 9)</a>.
     * @param {Integer} Length Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the vertex buffer, in bytes. For FVF vertex buffers, Length must be large enough to contain at least one vertex, but it need not be a multiple of the vertex size. Length is not validated for non-FVF buffers. See Remarks.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Usage can be 0, which indicates no usage value. However, if usage is desired, use a combination of one or more <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a> constants. It is good practice to match the usage parameter in CreateVertexBuffer with the behavior flags in <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">IDirect3D9::CreateDevice</a>. For more information, see Remarks.
     * @param {Integer} FVF Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Combination of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dfvf">D3DFVF</a>, a usage specifier that describes the vertex format of the vertices in this buffer. If this parameter is set to a valid FVF code, the created vertex buffer is an FVF vertex buffer (see Remarks). Otherwise, if this parameter is set to zero, the vertex buffer is a non-FVF vertex buffer.
     * @param {D3DPOOL} Pool Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a> enumerated type, describing a valid memory class into which to place the resource. Do not set to D3DPOOL_SCRATCH.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @returns {IDirect3DVertexBuffer9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a> interface, representing the created vertex buffer resource.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createvertexbuffer
     */
    CreateVertexBuffer(Length, Usage, FVF, Pool, pSharedHandle) {
        result := ComCall(26, this, "uint", Length, "uint", Usage, "uint", FVF, D3DPOOL, Pool, "ptr*", &ppVertexBuffer := 0, HANDLE.Ptr, pSharedHandle, "HRESULT")
        return IDirect3DVertexBuffer9(ppVertexBuffer)
    }

    /**
     * The IDirect3DDevice9::CreateIndexBuffer method (d3d9.h) creates an index buffer.
     * @remarks
     * Index buffers are memory resources used to hold indices, they are similar to both surfaces and vertex buffers. The use of index buffers enables Direct3D to avoid unnecessary data copying and to place the buffer in the optimal memory type for the expected usage.
     * 
     * To use index buffers, create an index buffer, lock it, fill it with indices, unlock it, pass it to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setindices">IDirect3DDevice9::SetIndices</a>, set up the vertices, set up the vertex shader, and call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-drawindexedprimitive">IDirect3DDevice9::DrawIndexedPrimitive</a> for rendering.
     * 
     * The MaxVertexIndex member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure indicates the types of index buffers that are valid for rendering.
     * @param {Integer} Length Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the index buffer, in bytes.
     * @param {Integer} Usage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Usage can be 0, which indicates no usage value. However, if usage is desired, use a combination of one or more <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a> constants. It is good practice to match the usage parameter in CreateIndexBuffer with the behavior flags in <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">IDirect3D9::CreateDevice</a>. For more information, see Remarks.
     * @param {D3DFORMAT} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
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
     * @param {D3DPOOL} Pool Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a> enumerated type, describing a valid memory class into which to place the resource.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>; set it to <b>NULL</b> to not share a resource. This parameter is not used in Direct3D 9 for operating systems earlier than Windows Vista; set it to <b>NULL</b>.
     * @returns {IDirect3DIndexBuffer9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dindexbuffer9">IDirect3DIndexBuffer9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dindexbuffer9">IDirect3DIndexBuffer9</a> interface, representing the created index buffer resource.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createindexbuffer
     */
    CreateIndexBuffer(Length, Usage, Format, Pool, pSharedHandle) {
        result := ComCall(27, this, "uint", Length, "uint", Usage, D3DFORMAT, Format, D3DPOOL, Pool, "ptr*", &ppIndexBuffer := 0, HANDLE.Ptr, pSharedHandle, "HRESULT")
        return IDirect3DIndexBuffer9(ppIndexBuffer)
    }

    /**
     * The IDirect3DDevice9::CreateRenderTarget method (d3d9.h) creates a render-target surface.
     * @remarks
     * Render-target surfaces are placed in the D3DPOOL_DEFAULT memory class.
     * 
     * The creation of lockable, multisampled render targets is not supported.
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the render-target surface, in pixels.
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the render-target surface, in pixels.
     * @param {D3DFORMAT} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, describing the format of the render target.
     * @param {D3DMULTISAMPLE_TYPE} MultiSample Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmultisample-type">D3DMULTISAMPLE_TYPE</a></b>
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createrendertarget
     */
    CreateRenderTarget(Width, Height, Format, MultiSample, MultisampleQuality, Lockable, pSharedHandle) {
        result := ComCall(28, this, "uint", Width, "uint", Height, D3DFORMAT, Format, D3DMULTISAMPLE_TYPE, MultiSample, "uint", MultisampleQuality, BOOL, Lockable, "ptr*", &ppSurface := 0, HANDLE.Ptr, pSharedHandle, "HRESULT")
        return IDirect3DSurface9(ppSurface)
    }

    /**
     * The IDirect3DDevice9::CreateDepthStencilSurface method (d3d9.h) creates a depth-stencil resource.
     * @remarks
     * The memory class of the depth-stencil buffer is always D3DPOOL_DEFAULT.
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the depth-stencil surface, in pixels.
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the depth-stencil surface, in pixels.
     * @param {D3DFORMAT} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a> enumerated type, describing the format of the depth-stencil surface. This value must be one of the enumerated depth-stencil formats for this device.
     * @param {D3DMULTISAMPLE_TYPE} MultiSample Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmultisample-type">D3DMULTISAMPLE_TYPE</a></b>
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createdepthstencilsurface
     */
    CreateDepthStencilSurface(Width, Height, Format, MultiSample, MultisampleQuality, Discard, pSharedHandle) {
        result := ComCall(29, this, "uint", Width, "uint", Height, D3DFORMAT, Format, D3DMULTISAMPLE_TYPE, MultiSample, "uint", MultisampleQuality, BOOL, Discard, "ptr*", &ppSurface := 0, HANDLE.Ptr, pSharedHandle, "HRESULT")
        return IDirect3DSurface9(ppSurface)
    }

    /**
     * The IDirect3DDevice9::UpdateSurface method (d3d9.h) copies rectangular subsets of pixels from one surface to another.
     * @remarks
     * This method is similar to CopyRects in DirectX 8.
     * 
     * This function has the following restrictions.
     * 
     * <ul>
     * <li>The source surface must have been created with D3DPOOL_SYSTEMMEM.</li>
     * <li>The destination surface must have been created with D3DPOOL_DEFAULT.</li>
     * <li>Neither surface can be locked or holding an outstanding device context.</li>
     * <li>Neither surface can be created with multisampling. The only valid flag for both surfaces is D3DMULTISAMPLE_NONE.</li>
     * <li>The surface format cannot be a depth stencil format.</li>
     * <li>The source and dest rects must fit within the surface.</li>
     * <li>No stretching or shrinking is allowed (the rects must be the same size).</li>
     * <li>The source format must match the dest format.</li>
     * </ul>
     * The following table shows the supported combinations.
     * 
     * <table>
     * <tr>
     * <th></th>
     * <th></th>
     * <th>Dest formats</th>
     * <th></th>
     * <th></th>
     * <th></th>
     * </tr>
     * <tr>
     * <th></th>
     * <td></td>
     * <td>Texture</td>
     * <td>RT texture</td>
     * <td>RT</td>
     * <td>Off-screen plain</td>
     * </tr>
     * <tr>
     * <th>Src formats</th>
     * <td>Texture</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes*</td>
     * <td>Yes</td>
     * </tr>
     * <tr>
     * <th></th>
     * <td>RT texture</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th></th>
     * <td>RT</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th></th>
     * <td>Off-screen plain</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * </tr>
     * </table>
     *  
     * 
     * * If the driver does not support the requested copy, it will be emulated using lock and copy.
     * 
     * If the application needs to copy data from a D3DPOOL_DEFAULT render target to a D3DPOOL_SYSTEMMEM surface, it can use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-getrendertargetdata">GetRenderTargetData</a>.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-updatesurface
     */
    UpdateSurface(pSourceSurface, pSourceRect, pDestinationSurface, pDestPoint) {
        result := ComCall(30, this, "ptr", pSourceSurface, RECT.Ptr, pSourceRect, "ptr", pDestinationSurface, POINT.Ptr, pDestPoint, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::UpdateTexture method (d3d9.h) updates the dirty portions of a texture.
     * @remarks
     * You can dirty a portion of a texture by locking it, or by calling one of the following methods. 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcubetexture9-adddirtyrect">IDirect3DCubeTexture9::AddDirtyRect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dtexture9-adddirtyrect">IDirect3DTexture9::AddDirtyRect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dvolumetexture9-adddirtybox">IDirect3DVolumeTexture9::AddDirtyBox</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatesurface">IDirect3DDevice9::UpdateSurface</a>
     * </li>
     * </ul>
     * <b>IDirect3DDevice9::UpdateTexture</b> retrieves the dirty portions of the texture by calculating what has been accumulated since the last update operation.
     * 
     * For performance reasons, dirty regions are only recorded for level zero of a texture. For sublevels, it is assumed that the corresponding (scaled) rectangle or box is also dirty. Dirty regions are automatically recorded when LockRect or <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dvolumetexture9-lockbox">IDirect3DVolumeTexture9::LockBox</a> is called without D3DLOCK_NO_DIRTY_UPDATE or D3DLOCK_READONLY. Also, the destination surface of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatesurface">IDirect3DDevice9::UpdateSurface</a> is marked dirty.
     * 
     * This method fails if the textures are of different types, if their bottom-level buffers are of different sizes, or if their matching levels do not match. For example, consider a six-level source texture with the following dimensions.
     *     
     *     
     *     
     * 
     * 
     * 
     * 
     * ```
     * 
     * 32x16, 16x8, 8x4, 4x2, 2x1, 1x1
     * 
     * ```
     * 
     * 
     * This six-level source texture could be the source for the following one-level destination.
     * 
     * 
     * 
     * 
     * ```
     * 
     * 1x1
     * 
     * ```
     * 
     * 
     * For the following two-level destination.
     * 
     * 
     * 
     * 
     * ```
     * 
     * 2x1, 1x1
     * 
     * ```
     * 
     * 
     * Or, for the following three-level destination.
     * 
     * 
     * 
     * 
     * ```
     * 
     * 4x2, 2x1, 1x1
     * 
     * ```
     * 
     * 
     * In addition, this method will fail if the textures are of different formats. If the destination texture has fewer levels than the source, only the matching levels are copied. If the source texture has fewer levels than the destination, the method will fail. 
     * 
     * If the source texture has dirty regions, the copy can be optimized by restricting the copy to only those regions. It is not guaranteed that only those bytes marked dirty will be copied.
     * 
     * Here are the possibilities for source and destination surface combinations:
     * 
     * <ul>
     * <li>If pSourceTexture is a non-autogenerated mipmap and pDestinationTexture is an autogenerated mipmap, only the topmost matching level is updated, and the destination sublevels are regenerated. All other source sublevels are ignored.</li>
     * <li>If both pSourceTexture and pDestinationTexture are autogenerated mipmaps, only the topmost matching level is updated. The sublevels from the source are ignored and the destination sublevels are regenerated.</li>
     * <li>If pSourceTexture is an autogenerated mipmap and pDestinationTexture a non-autogenerated mipmap, UpdateTexture will fail.</li>
     * </ul>
     * @param {IDirect3DBaseTexture9} pSourceTexture Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a> interface, representing the source texture. The source texture must be in system memory (D3DPOOL_SYSTEMMEM).
     * @param {IDirect3DBaseTexture9} pDestinationTexture Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a> interface, representing the destination texture. The destination texture must be in the D3DPOOL_DEFAULT memory pool.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-updatetexture
     */
    UpdateTexture(pSourceTexture, pDestinationTexture) {
        result := ComCall(31, this, "ptr", pSourceTexture, "ptr", pDestinationTexture, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetRenderTargetData method (d3d9.h) copies the render-target data from device memory to system memory.
     * @remarks
     * The destination surface must be either an off-screen plain surface or a level of a texture (mipmap or cube texture) created with D3DPOOL_SYSTEMMEM.
     * 
     * The source surface must be a regular render target or a level of a render-target texture (mipmap or cube texture) created with POOL_DEFAULT.
     * 
     * This method will fail if:
     * 
     * <ul>
     * <li>The render target is multisampled.</li>
     * <li>The source render target is a different size than the destination surface.</li>
     * <li>The source render target and destination surface formats do not match.</li>
     * </ul>
     * @param {IDirect3DSurface9} pRenderTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> object, representing a render target.
     * @param {IDirect3DSurface9} pDestSurface Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> object, representing a destination surface.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_DRIVERINTERNALERROR, D3DERR_DEVICELOST, D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getrendertargetdata
     */
    GetRenderTargetData(pRenderTarget, pDestSurface) {
        result := ComCall(32, this, "ptr", pRenderTarget, "ptr", pDestSurface, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetFrontBufferData method (d3d9.h) copies the device's front buffer into a system memory buffer provided by the application.
     * @remarks
     * The buffer pointed to by pDestSurface will be filled with a representation of the front buffer, converted to the standard 32 bits per pixel format D3DFMT_A8R8G8B8. 
     * 
     * This method is the only way to capture an antialiased screen shot.
     * 
     * This function is very slow, by design, and should not be used in any performance-critical path.
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/lost-devices">Lost Devices and Retrieved Data</a>.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_DRIVERINTERNALERROR, D3DERR_DEVICELOST, D3DERR_INVALIDCALL
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getfrontbufferdata
     */
    GetFrontBufferData(iSwapChain, pDestSurface) {
        result := ComCall(33, this, "uint", iSwapChain, "ptr", pDestSurface, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::StretchRect method (d3d9helper.h) allows you to copy the contents of the source rectangle to the destination rectangle. The source can be stretched and filtered by the copy.
     * @remarks
     * StretchRect Restrictions
     * 
     * <ul>
     * <li>Driver support varies. See the section on driver support (below) to see which drivers support which source and destination formats.</li>
     * <li>The source and destination surfaces must be created in the default memory pool.</li>
     * <li>If filtering is specified, you must set the appropriate filter caps (see StretchRectFilterCaps in <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a>).</li>
     * <li>Stretching is not supported between source and destination rectangles on the same surface.</li>
     * <li>Stretching is not supported if the destination surface is an off-screen plain surface but the source is not.</li>
     * <li>You many not stretch between source and destination rectangles if either surface is in a compressed format (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/using-compressed-textures">Using Compressed Textures (Direct3D 9)</a>).</li>
     * <li>Stretching supports color-space conversion from YUV to high-precision RGBA only. Since color conversion support is not supported by software emulation, use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-checkdeviceformatconversion">IDirect3D9::CheckDeviceFormatConversion</a> to test the hardware for color conversion support.</li>
     * <li>If the source or destination surface is a texture surface (or a cube texture surface), you must use a Direct3D 9 driver that supports D3DDEVCAPS2_CAN_STRETCHRECT_FROM_TEXTURES (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevcaps2">D3DDEVCAPS2</a>).</li>
     * </ul>
     * Additional Restrictions for Depth and Stencil Surfaces
     * 
     * <ul>
     * <li>The source and destination surfaces must be plain depth stencil surfaces (not textures) (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createdepthstencilsurface">IDirect3DDevice9::CreateDepthStencilSurface</a>).</li>
     * <li>Neither of the surfaces can be discardable.</li>
     * <li>The entire surface must be copied (that is: sub-rectangle copies are not allowed).</li>
     * <li>Format conversion, stretching, and shrinking are not supported.</li>
     * <li>StretchRect cannot be called inside of a BeginScene/EndScene pair.</li>
     * </ul>
     * Using StretchRect to downsample a Multisample Rendertarget
     * 
     * You can use StretchRect to copy from one rendertarget to another. If the source rendertarget is multisampled, this results in downsampling the source rendertarget. For instance you could:
     * 
     * <ul>
     * <li>Create a multisampled rendertarget.</li>
     * <li>Create a second rendertarget of the same size, that is not multisampled.</li>
     * <li>Copy (using StretchRect the multisample rendertarget to the second rendertarget.</li>
     * </ul>
     * Note that use of the extra surface involved in using StretchRect to downsample a Multisample Rendertarget will result in a performance hit.
     * 
     * Driver Support
     * 
     * There are many restrictions as to which surface combinations are valid for StretchRect. Factors include whether the driver is a Direct3D 9 driver or older, and whether the operation will result in stretching/shrinking.  Since applications are not expected to recognize if the driver is a Direct3D 9 driver or not, the runtime will automatically set a new cap, D3DDEVCAPS2_CAN_STRETCHRECT_FROM_TEXTURES cap (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevcaps2">D3DDEVCAPS2</a>), for Direct3D 9-level drivers and above.
     * 
     * <table>
     * <tr>
     * <th>DirectX 8 Driver (no stretching)</th>
     * <th></th>
     * <th></th>
     * <th></th>
     * <th></th>
     * <th></th>
     * </tr>
     * <tr>
     * <th></th>
     * <th></th>
     * <th>Dest formats</th>
     * <th></th>
     * <th></th>
     * <th></th>
     * </tr>
     * <tr>
     * <th></th>
     * <th></th>
     * <th>Texture</th>
     * <th>RT texture</th>
     * <th>RT</th>
     * <th>Off-screen plain</th>
     * </tr>
     * <tr>
     * <th>Src formats</th>
     * <th>Texture</th>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th></th>
     * <th>RT texture</th>
     * <td>No</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th></th>
     * <th>RT</th>
     * <td>No</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th></th>
     * <th>Off-screen plain</th>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * </tr>
     * </table>
     *  
     * 
     * <table>
     * <tr>
     * <th>DirectX 8 Driver (stretching)</th>
     * <th></th>
     * <th></th>
     * <th></th>
     * <th></th>
     * <th></th>
     * </tr>
     * <tr>
     * <th></th>
     * <th></th>
     * <th>Dest formats</th>
     * <th></th>
     * <th></th>
     * <th></th>
     * </tr>
     * <tr>
     * <th></th>
     * <th></th>
     * <th>Texture</th>
     * <th>RT texture</th>
     * <th>RT</th>
     * <th>Off-screen plain</th>
     * </tr>
     * <tr>
     * <th>Src formats</th>
     * <th>Texture</th>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th></th>
     * <th>RT texture</th>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th></th>
     * <th>RT</th>
     * <td>No</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th></th>
     * <th>Off-screen plain</th>
     * <td>No</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * </table>
     *  
     * 
     * <table>
     * <tr>
     * <th>Direct3D 9 Driver (no stretching)</th>
     * <th></th>
     * <th></th>
     * <th></th>
     * <th></th>
     * <th></th>
     * </tr>
     * <tr>
     * <th></th>
     * <th></th>
     * <th>Dest formats</th>
     * <th></th>
     * <th></th>
     * <th></th>
     * </tr>
     * <tr>
     * <th></th>
     * <th></th>
     * <th>Texture</th>
     * <th>RT texture</th>
     * <th>RT</th>
     * <th>Off-screen plain</th>
     * </tr>
     * <tr>
     * <th>Src formats</th>
     * <th>Texture</th>
     * <td>No</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th></th>
     * <th>RT texture</th>
     * <td>No</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th></th>
     * <th>RT</th>
     * <td>No</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th></th>
     * <th>Off-screen plain</th>
     * <td>No</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * </tr>
     * </table>
     *  
     * 
     * <table>
     * <tr>
     * <th>Direct3D 9 Driver (stretching)</th>
     * <th></th>
     * <th></th>
     * <th></th>
     * <th></th>
     * <th></th>
     * </tr>
     * <tr>
     * <th></th>
     * <th></th>
     * <th>Dest formats</th>
     * <th></th>
     * <th></th>
     * <th></th>
     * </tr>
     * <tr>
     * <th></th>
     * <th></th>
     * <th>Texture</th>
     * <th>RT texture</th>
     * <th>RT</th>
     * <th>Off-screen plain</th>
     * </tr>
     * <tr>
     * <th>Src formats</th>
     * <th>Texture</th>
     * <td>No</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th></th>
     * <th>RT texture</th>
     * <td>No</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th></th>
     * <th>RT</th>
     * <td>No</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * <tr>
     * <th></th>
     * <th>Off-screen plain</th>
     * <td>No</td>
     * <td>Yes</td>
     * <td>Yes</td>
     * <td>No</td>
     * </tr>
     * </table>
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
     * @param {D3DTEXTUREFILTERTYPE} Filter Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturefiltertype">D3DTEXTUREFILTERTYPE</a></b>
     * 
     * Filter type. Allowable values are D3DTEXF_NONE, D3DTEXF_POINT, or D3DTEXF_LINEAR. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturefiltertype">D3DTEXTUREFILTERTYPE</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be:
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-stretchrect
     */
    StretchRect(pSourceSurface, pSourceRect, pDestSurface, pDestRect, Filter) {
        result := ComCall(34, this, "ptr", pSourceSurface, RECT.Ptr, pSourceRect, "ptr", pDestSurface, RECT.Ptr, pDestRect, D3DTEXTUREFILTERTYPE, Filter, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::ColorFill method (d3d9.h) allows an application to fill a rectangular area of a D3DPOOL_DEFAULT surface with a specified color.
     * @remarks
     * This method can only be applied to a render target, a render-target texture surface, or an off-screen plain surface with a pool type of D3DPOOL_DEFAULT.
     * 
     * <b>IDirect3DDevice9::ColorFill</b> will work with all formats. However, when using a reference or software device, the only formats supported are D3DFMT_X1R5G5B5, D3DFMT_A1R5G5B5, D3DFMT_R5G6B5, D3DFMT_X8R8G8B8, D3DFMT_A8R8G8B8, D3DFMT_YUY2, D3DFMT_G8R8_G8B8, D3DFMT_UYVY, D3DFMT_R8G8_B8G8, D3DFMT_R16F, D3DFMT_G16R16F, D3DFMT_A16B16G16R16F, D3DFMT_R32F, D3DFMT_G32R32F, and D3DFMT_A32B32G32R32F.
     * 
     * When using a DirectX 7 or DirectX 8.x driver, the only YUV formats supported are D3DFMT_UYVY and D3DFMT_YUY2.
     * @param {IDirect3DSurface9} pSurface Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to the surface to be filled.
     * @param {Pointer<RECT>} pRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to the source rectangle. Using <b>NULL</b> means that the entire surface will be filled.
     * @param {Integer} _color Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcolor">D3DCOLOR</a></b>
     * 
     * Color used for filling.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-colorfill
     */
    ColorFill(pSurface, pRect, _color) {
        result := ComCall(35, this, "ptr", pSurface, RECT.Ptr, pRect, "uint", _color, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::CreateOffscreenPlainSurface method (d3d9.h) creates an off-screen surface.
     * @remarks
     * D3DPOOL_SCRATCH will return a surface that has identical characteristics to a surface created by the DirectX 8.x method CreateImageSurface.
     * 
     * D3DPOOL_DEFAULT is the appropriate pool for use with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-stretchrect">IDirect3DDevice9::StretchRect</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-colorfill">IDirect3DDevice9::ColorFill</a>.
     * 
     * D3DPOOL_MANAGED is not allowed when creating an offscreen plain surface. For more information about memory pools, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a>.
     * 
     * Off-screen plain surfaces are always lockable, regardless of their pool types.
     * @param {Integer} Width Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Width of the surface.
     * @param {Integer} Height Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Height of the surface.
     * @param {D3DFORMAT} Format Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
     * 
     * Format of the surface. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a>.
     * @param {D3DPOOL} Pool Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a></b>
     * 
     * Surface pool type. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpool">D3DPOOL</a>.
     * @param {Pointer<HANDLE>} pSharedHandle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * Reserved. Set this parameter to <b>NULL</b>. This parameter can be used in Direct3D 9 for Windows Vista to <a href="https://docs.microsoft.com/windows/desktop/direct3d9/dx9lh">share resources</a>.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>  interface created.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createoffscreenplainsurface
     */
    CreateOffscreenPlainSurface(Width, Height, Format, Pool, pSharedHandle) {
        result := ComCall(36, this, "uint", Width, "uint", Height, D3DFORMAT, Format, D3DPOOL, Pool, "ptr*", &ppSurface := 0, HANDLE.Ptr, pSharedHandle, "HRESULT")
        return IDirect3DSurface9(ppSurface)
    }

    /**
     * The IDirect3DDevice9::SetRenderTarget method (d3d9helper.h) sets a new color buffer for the device.
     * @remarks
     * The device can support multiple render targets. The number of render targets supported by a device is contained in the NumSimultaneousRTs member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a>. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/multiple-render-targets">Multiple Render Targets (Direct3D 9)</a>.
     * 
     * Setting a new render target will cause the viewport (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/viewports-and-clipping">Viewports and Clipping (Direct3D 9)</a>) to be set to the full size of the new render target.
     * 
     * Some hardware tests the compatibility of the depth stencil buffer with the color buffer. If this is done, it is only done in a debug build.
     * 
     * Restrictions for using this method include the following:
     * 
     * <ul>
     * <li>The multisample type must be the same for the render target and the depth stencil surface.</li>
     * <li>The formats must be compatible for the render target and the depth stencil surface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-checkdepthstencilmatch">IDirect3D9::CheckDepthStencilMatch</a>.</li>
     * <li>The size of the depth stencil surface must be greater than or equal to the size of the render target.</li>
     * </ul>
     * These restrictions are validated only when using the debug runtime when any of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a>Draw methods are called.
     * 
     * Cube textures differ from other surfaces in that they are collections of surfaces. To call <b>IDirect3DDevice9::SetRenderTarget</b> with a cube texture, you must select an individual face using <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcubetexture9-getcubemapsurface">IDirect3DCubeTexture9::GetCubeMapSurface</a> and pass the resulting surface to <b>IDirect3DDevice9::SetRenderTarget</b>.
     * @param {Integer} RenderTargetIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Index of the render target. See Remarks.
     * @param {IDirect3DSurface9} pRenderTarget Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Pointer to a new color buffer. If <b>NULL</b>, the color buffer for the corresponding RenderTargetIndex is disabled. Devices always must be associated with a color buffer.
     *  The new render-target surface must have at least D3DUSAGE_RENDERTARGET specified.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     *  This method will return D3DERR_INVALIDCALL if either:
     * 
     * 
     * <ul>
     * <li>pRenderTarget = <b>NULL</b> and RenderTargetIndex = 0</li>
     * <li>pRenderTarget is != <b>NULL</b> and the render target is invalid.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setrendertarget
     */
    SetRenderTarget(RenderTargetIndex, pRenderTarget) {
        result := ComCall(37, this, "uint", RenderTargetIndex, "ptr", pRenderTarget, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetRenderTarget method (d3d9.h) retrieves a render-target surface.
     * @remarks
     * Typically, methods that return state will not work on a device that is created using D3DCREATE_PUREDEVICE. This method however, will work even on a pure device because it returns an interface.
     * 
     * The device can now support multiple render targets. The number of render targets supported by a device is contained in the NumSimultaneousRTs member of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a>. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/multiple-render-targets">Multiple Render Targets (Direct3D 9)</a>.
     * 
     * Calling this method will increase the internal reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface. Failure to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when finished using the <b>IDirect3DSurface9</b> interface results in a memory leak.
     * @param {Integer} RenderTargetIndex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Index of the render target. See Remarks.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface, representing the returned render-target surface for this device.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getrendertarget
     */
    GetRenderTarget(RenderTargetIndex) {
        result := ComCall(38, this, "uint", RenderTargetIndex, "ptr*", &ppRenderTarget := 0, "HRESULT")
        return IDirect3DSurface9(ppRenderTarget)
    }

    /**
     * The IDirect3DDevice9::SetDepthStencilSurface method (d3d9.h) sets the depth stencil surface.
     * @remarks
     * Restrictions for using this method include the following:
     * 
     * <ul>
     * <li>The multisample type must be the same for the render target and the depth stencil surface.</li>
     * <li>The formats must be compatible for the render target and the depth stencil surface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-checkdepthstencilmatch">IDirect3D9::CheckDepthStencilMatch</a>.</li>
     * <li>The size of the depth stencil surface must be greater than or equal to the size of the render target.</li>
     * </ul>
     * These restrictions are validated only when using the debug runtime when any of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a>Draw methods are called.
     * 
     * Cube textures differ from other surfaces in that they are collections of surfaces. To call <b>IDirect3DDevice9::SetDepthStencilSurface</b> with a cube texture, you must select an individual face using <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcubetexture9-getcubemapsurface">IDirect3DCubeTexture9::GetCubeMapSurface</a> and pass the resulting surface to <b>IDirect3DDevice9::SetDepthStencilSurface</b>.
     * @param {IDirect3DSurface9} pNewZStencil Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>*</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface representing the depth stencil surface. Setting this to <b>NULL</b> disables the depth stencil operation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     *  If pZStencilSurface is other than <b>NULL</b>, the return value is D3DERR_INVALIDCALL when the stencil surface is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setdepthstencilsurface
     */
    SetDepthStencilSurface(pNewZStencil) {
        result := ComCall(39, this, "ptr", pNewZStencil, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetDepthStencilSurface method (d3d9.h) gets the depth-stencil surface owned by the Direct3DDevice object.
     * @remarks
     * Calling this method will increase the internal reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface. Failure to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when finished using this <b>IDirect3DSurface9</b> interface results in a memory leak.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface, representing the returned depth-stencil surface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getdepthstencilsurface
     */
    GetDepthStencilSurface() {
        result := ComCall(40, this, "ptr*", &ppZStencilSurface := 0, "HRESULT")
        return IDirect3DSurface9(ppZStencilSurface)
    }

    /**
     * The IDirect3DDevice9::BeginScene method (d3d9.h) begins a scene.
     * @remarks
     * Applications must call <b>IDirect3DDevice9::BeginScene</b> before performing any rendering and must call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-endscene">IDirect3DDevice9::EndScene</a> 
     *       when rendering is complete and before calling <b>IDirect3DDevice9::BeginScene</b> again.
     * 
     * If <b>IDirect3DDevice9::BeginScene</b> fails, the device was unable to begin the scene, and there is no need to 
     *       call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-endscene">IDirect3DDevice9::EndScene</a>. In fact, calls to <b>IDirect3DDevice9::EndScene</b> will fail if the 
     *       previous <b>IDirect3DDevice9::BeginScene</b> failed. This applies to any application that creates multiple swap chains.
     * 
     * There should be one <b>IDirect3DDevice9::BeginScene</b>/<a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-endscene">IDirect3DDevice9::EndScene</a> pair between any successive calls to 
     *       present (either <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-present">IDirect3DDevice9::Present</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dswapchain9-present">IDirect3DSwapChain9::Present</a>). <b>IDirect3DDevice9::BeginScene</b> should 
     *       be called once before any rendering is performed, and <b>IDirect3DDevice9::EndScene</b> should be called once after all rendering for a frame has been
     *       submitted to the runtime. Multiple non-nested <b>IDirect3DDevice9::BeginScene</b>/<b>IDirect3DDevice9::EndScene</b> pairs between calls to present
     *       are legal, but having more than one pair may incur a performance hit.
     *       To enable maximal parallelism between the CPU and the graphics accelerator, it is advantageous to 
     *       call <b>IDirect3DDevice9::EndScene</b> as far ahead of calling present as possible.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. The method will fail with D3DERR_INVALIDCALL if <b>IDirect3DDevice9::BeginScene</b> is called 
     *       while already in a <b>IDirect3DDevice9::BeginScene</b>/<a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-endscene">IDirect3DDevice9::EndScene</a> pair. This happens only 
     *       when <b>IDirect3DDevice9::BeginScene</b> is called twice without first calling <b>IDirect3DDevice9::EndScene</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-beginscene
     */
    BeginScene() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::EndScene method (d3d9.h) ends a scene that was begun by calling IDirect3DDevice9::BeginScene.
     * @remarks
     * When this method succeeds, the scene has been queued up for rendering by the driver. This is not a synchronous method, so the scene is not guaranteed to have completed rendering when this method returns.
     * 
     * Applications must call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-beginscene">IDirect3DDevice9::BeginScene</a> before performing any rendering and must call <b>IDirect3DDevice9::EndScene</b> when rendering is complete and before calling <b>IDirect3DDevice9::BeginScene</b> again.
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-beginscene">IDirect3DDevice9::BeginScene</a> fails, the device was unable to begin the scene, and there is no need to call <b>IDirect3DDevice9::EndScene</b>. In fact, calls to 
     *     
     * <b>IDirect3DDevice9::EndScene</b> will fail if the previous <b>IDirect3DDevice9::BeginScene</b> failed. This applies to any application that creates multiple swap chains.
     * 
     * There should be at most one <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-beginscene">IDirect3DDevice9::BeginScene</a>/<b>IDirect3DDevice9::EndScene</b> pair between any successive calls to present (either <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-present">IDirect3DDevice9::Present</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dswapchain9-present">IDirect3DSwapChain9::Present</a>). <b>IDirect3DDevice9::BeginScene</b> should be called once before any rendering is performed, and <b>IDirect3DDevice9::EndScene</b> should be called once after all rendering for a frame has been submitted to the runtime. To enable maximal parallelism between the CPU and the graphics accelerator, it is advantageous to call <b>IDirect3DDevice9::EndScene</b> as far ahead of calling present as possible.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. The method will fail with D3DERR_INVALIDCALL if <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-beginscene">IDirect3DDevice9::BeginScene</a> is called while already in a <b>IDirect3DDevice9::BeginScene</b>/<b>IDirect3DDevice9::EndScene</b> pair. This happens only when <b>IDirect3DDevice9::BeginScene</b> is called twice without first calling <b>IDirect3DDevice9::EndScene</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-endscene
     */
    EndScene() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::Clear method (d3d9.h) clears one or more surfaces such as a render target, multiple render targets, a stencil buffer, or a depth buffer.
     * @remarks
     * Use this method to clear a surface including: a render target, all render targets in an MRT, a stencil buffer, or a depth buffer. Flags determines how many surfaces are cleared. Use pRects to clear a subset of a surface defined by an array of rectangles.
     * 
     * <b>IDirect3DDevice9::Clear</b> will fail if you:
     * 
     * <ul>
     * <li>Try to clear either the depth buffer or the stencil buffer of a render target that does not have an attached depth buffer.</li>
     * <li>Try to clear the stencil buffer when the depth buffer does not contain stencil data.</li>
     * </ul>
     * @param {Integer} Count Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Number of rectangles in the array at pRects. Must be set to 0 if pRects is <b>NULL</b>. May not be 0 if pRects is a valid pointer.
     * @param {Pointer<D3DRECT>} pRects Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drect">D3DRECT</a>*</b>
     * 
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drect">D3DRECT</a> structures that describe the rectangles to clear. Set a rectangle to the dimensions of the rendering target to clear the entire surface. Each rectangle uses screen coordinates that correspond to points on the render target. Coordinates are clipped to the bounds of the viewport rectangle. To indicate that the entire viewport rectangle is to be cleared, set this parameter to <b>NULL</b> and Count to 0.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Combination of one or more <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dclear">D3DCLEAR</a> flags that specify the surface(s) that will be cleared.
     * @param {Integer} _Color Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcolor">D3DCOLOR</a></b>
     * 
     * Clear a render target to this ARGB color.
     * @param {Float} Z Type: <b>float</b>
     * 
     * Clear the depth buffer to this new z value which ranges from 0 to 1. See remarks.
     * @param {Integer} Stencil Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Clear the stencil buffer to this new value which ranges from 0 to 2ⁿ-1 (n is the bit depth of the stencil buffer). See remarks.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be: D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-clear
     */
    Clear(Count, pRects, Flags, _Color, Z, Stencil) {
        result := ComCall(43, this, "uint", Count, D3DRECT.Ptr, pRects, "uint", Flags, "uint", _Color, "float", Z, "uint", Stencil, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetTransform method (d3d9helper.h) sets a single device transformation-related state.
     * @param {D3DTRANSFORMSTATETYPE} State Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtransformstatetype">D3DTRANSFORMSTATETYPE</a></b>
     * 
     * Device-state variable that is being modified. This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtransformstatetype">D3DTRANSFORMSTATETYPE</a> enumerated type, or the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dts-worldmatrix">D3DTS_WORLDMATRIX</a> macro.
     * @param {Pointer<D3DMATRIX>} pMatrix Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmatrix">D3DMATRIX</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmatrix">D3DMATRIX</a> structure that modifies the current transformation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if one of the arguments is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-settransform
     */
    SetTransform(State, pMatrix) {
        result := ComCall(44, this, D3DTRANSFORMSTATETYPE, State, D3DMATRIX.Ptr, pMatrix, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetTransform method (d3d9.h) retrieves a matrix describing a transformation state.
     * @remarks
     * This method will not return device state for a device that is created using D3DCREATE_PUREDEVICE. If you want to use this method, you must create your device with any of the other flag values in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE</a>.
     * @param {D3DTRANSFORMSTATETYPE} State Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtransformstatetype">D3DTRANSFORMSTATETYPE</a></b>
     * 
     * Device state variable that is being modified. This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtransformstatetype">D3DTRANSFORMSTATETYPE</a> enumerated type, or the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dts-worldmatrix">D3DTS_WORLDMATRIX</a> macro.
     * @param {Pointer<D3DMATRIX>} pMatrix Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmatrix">D3DMATRIX</a>*</b>
     * 
     * Pointer to a 
     *     <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmatrix">D3DMATRIX</a> structure, describing the returned transformation state.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL if one of the arguments is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-gettransform
     */
    GetTransform(State, pMatrix) {
        result := ComCall(45, this, D3DTRANSFORMSTATETYPE, State, D3DMATRIX.Ptr, pMatrix, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::MultiplyTransform method (d3d9.h) multiplies a device's world, view, or projection matrices by a specified matrix.
     * @remarks
     * The multiplication order is pMatrix times State.
     * 
     * An application might use the <b>IDirect3DDevice9::MultiplyTransform</b> method to work with hierarchies of transformations. For example, the geometry and transformations describing an arm might be arranged in the following hierarchy.
     * 
     * 
     * ```
     * 
     *     
     *     shoulder_transformation
     *     
     *     upper_arm geometry
     *     
     *     elbow transformation
     *     
     *     lower_arm geometry
     *     
     *     wrist transformation
     *     
     *     hand geometry
     * 
     * ```
     * 
     * 
     * An application might use the following series of calls to render this hierarchy. Not all the parameters are shown in this pseudocode.
     *     
     *             
     * 
     * 
     * ```
     * 
     * IDirect3DDevice9::SetTransform(D3DTS_WORLDMATRIX(0), 
     *                                shoulder_transform)
     * IDirect3DDevice9::DrawPrimitive(upper_arm)
     * IDirect3DDevice9::MultiplyTransform(D3DTS_WORLDMATRIX(0), 
     *                                     elbow_transform)
     * IDirect3DDevice9::DrawPrimitive(lower_arm)
     * IDirect3DDevice9::MultiplyTransform(D3DTS_WORLDMATRIX(0), 
     *                                     wrist_transform)
     * IDirect3DDevice9::DrawPrimitive(hand)
     * ```
     * @param {D3DTRANSFORMSTATETYPE} param0 
     * @param {Pointer<D3DMATRIX>} param1 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL if one of the arguments is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-multiplytransform
     */
    MultiplyTransform(param0, param1) {
        result := ComCall(46, this, D3DTRANSFORMSTATETYPE, param0, D3DMATRIX.Ptr, param1, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetViewport method (d3d9helper.h) sets the viewport parameters for the device.
     * @remarks
     * Direct3D sets the following default values for the viewport.
     * 
     * 
     * 
     * 
     * ```
     * 
     * D3DVIEWPORT9 vp;
     * vp.X      = 0;
     * vp.Y      = 0;
     * vp.Width  = RenderTarget.Width;
     * vp.Height = RenderTarget.Height;
     * vp.MinZ   = 0.0f;
     * vp.MaxZ   = 1.0f;
     * 
     * ```
     * 
     * 
     * <b>IDirect3DDevice9::SetViewport</b> can be used to draw on part of the screen. Make sure to call it before any geometry is drawn so the viewport settings will take effect.
     * 
     * To draw multiple views within a scene, repeat the <b>IDirect3DDevice9::SetViewport</b> and draw geometry sequence for each view.
     * @param {Pointer<D3DVIEWPORT9>} pViewport Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dviewport9">D3DVIEWPORT9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dviewport9">D3DVIEWPORT9</a> structure, specifying the viewport parameters to set.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, it will return D3DERR_INVALIDCALL. This will happen if pViewport is invalid, or if pViewport describes a region that cannot exist within the render target surface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setviewport
     */
    SetViewport(pViewport) {
        result := ComCall(47, this, D3DVIEWPORT9.Ptr, pViewport, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetViewport method (d3d9.h) retrieves the viewport parameters currently set for the device.
     * @remarks
     * Typically, methods that return state will not work on a device that is created using D3DCREATE_PUREDEVICE. This method however, will work even on a pure device.
     * @param {Pointer<D3DVIEWPORT9>} pViewport Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dviewport9">D3DVIEWPORT9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dviewport9">D3DVIEWPORT9</a> structure, representing the returned viewport parameters.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if the pViewport parameter is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getviewport
     */
    GetViewport(pViewport) {
        result := ComCall(48, this, D3DVIEWPORT9.Ptr, pViewport, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetMaterial method (d3d9.h) sets the material properties for the device.
     * @param {Pointer<D3DMATERIAL9>} pMaterial Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmaterial9">D3DMATERIAL9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmaterial9">D3DMATERIAL9</a> structure, describing the material properties to set.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL if the pMaterial parameter is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setmaterial
     */
    SetMaterial(pMaterial) {
        result := ComCall(49, this, D3DMATERIAL9.Ptr, pMaterial, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetMaterial method (d3d9.h) retrieves the current material properties for the device.
     * @remarks
     * This method will not return device state for a device that is created using D3DCREATE_PUREDEVICE. If you want to use this method, you must create your device with any of the other values in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE</a>.
     * @param {Pointer<D3DMATERIAL9>} pMaterial Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmaterial9">D3DMATERIAL9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dmaterial9">D3DMATERIAL9</a> structure to fill with the currently set material properties.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL if the pMaterial parameter is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getmaterial
     */
    GetMaterial(pMaterial) {
        result := ComCall(50, this, D3DMATERIAL9.Ptr, pMaterial, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetLight method (d3d9.h) assigns a set of lighting properties for this device.
     * @remarks
     * Set light properties by preparing a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlight9">D3DLIGHT9</a> structure and then calling the <b>IDirect3DDevice9::SetLight</b> method. The 
     *     
     * <b>IDirect3DDevice9::SetLight</b> method accepts the index at which the device should place the set of light properties to its internal list of light properties, and the address of a prepared <b>D3DLIGHT9</b> structure that defines those properties. You can call <b>IDirect3DDevice9::SetLight</b> with new information as needed to update the light's illumination properties.
     * 
     * The system allocates memory to accommodate a set of lighting properties each time you call the <b>IDirect3DDevice9::SetLight</b> method with an index that has never been assigned properties. Applications can set a number of lights, with only a subset of the assigned lights enabled at a time. Check the MaxActiveLights member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure when you retrieve device capabilities to determine the maximum number of active lights supported by that device. If you no longer need a light, you can disable it or overwrite it with a new set of light properties.
     * 
     * The following example prepares and sets properties for a white point-light whose emitted light will not attenuate over distance.
     * 
     * 
     * ```
     * 
     * // Assume d3dDevice is a valid pointer to an IDirect3DDevice9 interface.
     * D3DLIGHT9 d3dLight;
     * HRESULT   hr;
     *     
     * // Initialize the structure.
     * ZeroMemory(&d3dLight, sizeof(d3dLight));
     *     
     * // Set up a white point light.
     * d3dLight.Type = D3DLIGHT_POINT;
     * d3dLight.Diffuse.r  = 1.0f;
     * d3dLight.Diffuse.g  = 1.0f;
     * d3dLight.Diffuse.b  = 1.0f;
     * d3dLight.Ambient.r  = 1.0f;
     * d3dLight.Ambient.g  = 1.0f;
     * d3dLight.Ambient.b  = 1.0f;
     * d3dLight.Specular.r = 1.0f;
     * d3dLight.Specular.g = 1.0f;
     * d3dLight.Specular.b = 1.0f;
     *     
     * // Position it high in the scene and behind the user.
     * // Remember, these coordinates are in world space, so
     * // the user could be anywhere in world space, too. 
     * // For the purposes of this example, assume the user
     * // is at the origin of world space.
     * d3dLight.Position.x = 0.0f;
     * d3dLight.Position.y = 1000.0f;
     * d3dLight.Position.z = -100.0f;
     *     
     * // Don't attenuate.
     * d3dLight.Attenuation0 = 1.0f; 
     * d3dLight.Range        = 1000.0f;
     *     
     * // Set the property information for the first light.
     * hr = d3dDevice->SetLight(0, &d3dLight);
     * if (SUCCEEDED(hr))
     *     // Handle Success
     * else
     *     // Handle failure
     * 
     * ```
     * 
     * 
     * Enable a light source by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-lightenable">IDirect3DDevice9::LightEnable</a> method for the device.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Zero-based index of the set of lighting properties to set. If a set of lighting properties exists at this index, it is overwritten by the new properties specified in pLight.
     * @param {Pointer<D3DLIGHT9>} param1 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setlight
     */
    SetLight(Index, param1) {
        result := ComCall(51, this, "uint", Index, D3DLIGHT9.Ptr, param1, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetLight method (d3d9.h) retrieves a set of lighting properties that this device uses.
     * @remarks
     * This method will not return device state for a device that is created using D3DCREATE_PUREDEVICE. If you want to use this method, you must create your device with any of the other values in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE</a>.
     * 
     * Retrieve all the properties for an existing light source by calling the <b>IDirect3DDevice9::GetLight</b> method for the device. When calling the <b>IDirect3DDevice9::GetLight</b> method, pass the zero-based index of the light source for which the properties will be retrieved as the first parameter, and supply the address of a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlight9">D3DLIGHT9</a> structure as the second parameter. The device fills the <b>D3DLIGHT9</b> structure to describe the lighting properties it uses for the light source at that index.
     * 
     * 
     * ```
     * 
     * // Assume d3dDevice is a valid pointer to an IDirect3DDevice9 interface.
     * HRESULT hr;
     * D3DLight9 light;
     *     
     * // Get the property information for the first light.
     * hr = pd3dDevice->GetLight(0, &light);
     * if (SUCCEEDED(hr))
     *     // Handle Success
     * else
     *     // Handle failure
     * 
     * ```
     * 
     * 
     * If you supply an index outside the range of the light sources assigned in the device, the <b>IDirect3DDevice9::GetLight</b> method fails, returning D3DERR_INVALIDCALL.
     * 
     * When you assign a set of light properties for a light source in a scene, the light source can be activated by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-lightenable">IDirect3DDevice9::LightEnable</a> method for the device. New light sources are disabled by default. The <b>IDirect3DDevice9::LightEnable</b> method accepts two parameters. Set the first parameter to the zero-based index of the light source to be affected by the method, and set the second parameter to <b>TRUE</b> to enable the light or <b>FALSE</b> to disable it. The following code example illustrates the use of this method by enabling the first light source in the device's list of light source properties.
     * 
     * 
     * ```
     * 
     * // Assume d3dDevice is a valid pointer to an IDirect3DDevice9 interface.
     * HRESULT hr;
     *     
     * hr = pd3dDevice->LightEnable(0, TRUE);
     * if (SUCCEEDED(hr))
     *     // Handle Success
     * else
     *     // Handle failure
     * 
     * ```
     * 
     * 
     * Check the MaxActiveLights member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure when you retrieve device capabilities to determine the maximum number of active lights supported by that device.
     * 
     * If you enable or disable a light that has no properties that are set with <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setlight">IDirect3DDevice9::SetLight</a>, the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-lightenable">IDirect3DDevice9::LightEnable</a> method creates a light source with the properties listed in following table and enables or disables it.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Zero-based index of the lighting property set to retrieve. This method will fail if a lighting property has not been set for this index by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setlight">IDirect3DDevice9::SetLight</a> method.
     * @param {Pointer<D3DLIGHT9>} param1 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getlight
     */
    GetLight(Index, param1) {
        result := ComCall(52, this, "uint", Index, D3DLIGHT9.Ptr, param1, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::LightEnable method (d3d9.h) enables or disables a set of lighting parameters within a device.
     * @remarks
     * If a value for LightIndex is outside the range of the light property sets assigned within the device, the <b>IDirect3DDevice9::LightEnable</b> method creates a light source represented by a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlight9">D3DLIGHT9</a> structure with the following properties and sets its enabled state to the value specified in bEnable.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Default</th>
     * </tr>
     * <tr>
     * <td>Type
     *     
     *     </td>
     * <td>D3DLIGHT_DIRECTIONAL</td>
     * </tr>
     * <tr>
     * <td>Diffuse
     *     
     *     </td>
     * <td>(R:1, G:1, B:1, A:0)</td>
     * </tr>
     * <tr>
     * <td>Specular
     *     
     *     </td>
     * <td>(R:0, G:0, B:0, A:0)</td>
     * </tr>
     * <tr>
     * <td>Ambient
     *     
     *     </td>
     * <td>(R:0, G:0, B:0, A:0)</td>
     * </tr>
     * <tr>
     * <td>Position
     *     
     *     </td>
     * <td>(0, 0, 0)</td>
     * </tr>
     * <tr>
     * <td>Direction
     *     
     *     </td>
     * <td>(0, 0, 1)</td>
     * </tr>
     * <tr>
     * <td>Range
     *     
     *     </td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>Falloff
     *     
     *     </td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>Attenuation0
     *     
     *     </td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>Attenuation1
     *     
     *     </td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>Attenuation2
     *     
     *     </td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>Theta
     *     
     *     </td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>Phi
     *     
     *     </td>
     * <td>0</td>
     * </tr>
     * </table>
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Zero-based index of the set of lighting parameters that are the target of this method.
     * @param {BOOL} Enable Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Value that indicates if the set of lighting parameters are being enabled or disabled. Set this parameter to <b>TRUE</b> to enable lighting with the parameters at the specified index, or <b>FALSE</b> to disable it.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-lightenable
     */
    LightEnable(Index, Enable) {
        result := ComCall(53, this, "uint", Index, BOOL, Enable, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetLightEnable method (d3d9.h) retrieves the activity status for a set of lighting parameters within a device.
     * @remarks
     * This method will not return device state for a device that is created using D3DCREATE_PUREDEVICE. If you want to use this method, you must create your device with any of the other values in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE</a>.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Zero-based index of the set of lighting parameters that are the target of this method.
     * @param {Pointer<BOOL>} pEnable Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Pointer to a variable to fill with the status of the specified lighting parameters. After the call, a nonzero value at this address indicates that the specified lighting parameters are enabled; a value of 0 indicates that they are disabled.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getlightenable
     */
    GetLightEnable(Index, pEnable) {
        pEnableMarshal := pEnable is VarRef ? "int*" : "ptr"

        result := ComCall(54, this, "uint", Index, pEnableMarshal, pEnable, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetClipPlane method (d3d9.h) sets the coefficients of a user-defined clipping plane for the device.
     * @remarks
     * The coefficients that this method sets take the form of the general plane equation. If the values in the array at pPlane were labeled A, B, C, and D in the order that they appear in the array, they would fit into the general plane equation so that Ax + By + Cz + Dw = 0. A point with homogeneous coordinates (x, y, z, w) is visible in the half space of the plane if Ax + By + Cz + Dw &gt;= 0. Points that exist behind the clipping plane are clipped from the scene.
     * 
     * When the fixed function pipeline is used the plane equations are assumed to be in world space. When the programmable pipeline is used the plane equations are assumed to be in the clipping space (the same space as output vertices).
     * 
     * This method does not enable the clipping plane equation being set. To enable a clipping plane, set the corresponding bit in the DWORD value applied to the D3DRS_CLIPPLANEENABLE render state.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Index of the clipping plane for which the plane equation coefficients are to be set.
     * @param {Pointer<Float>} pPlane Type: <b>const float*</b>
     * 
     * Pointer to an address of a four-element array of values that represent the clipping plane coefficients to be set, in the form of the general plane equation. See Remarks.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value is D3DERR_INVALIDCALL. This error indicates that the value in Index exceeds the maximum clipping plane index supported by the device or that the array at pPlane is not large enough to contain four floating-point values.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setclipplane
     */
    SetClipPlane(Index, pPlane) {
        pPlaneMarshal := pPlane is VarRef ? "float*" : "ptr"

        result := ComCall(55, this, "uint", Index, pPlaneMarshal, pPlane, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetClipPlane method (d3d9.h) retrieves the coefficients of a user-defined clipping plane for the device.
     * @remarks
     * This method will not return device state for a device that is created using D3DCREATE_PUREDEVICE. If you want to use this method, you must create your device with any of the other values in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE</a>."
     *     
     * 
     * 
     * The coefficients that this method reports take the form of the general plane equation. If the values in the array at pPlane were labeled A, B, C, and D in the order that they appear in the array, they would fit into the general plane equation so that Ax + By + Cz + Dw = 0. A point with homogeneous coordinates (x, y, z, w) is visible in the half space of the plane if Ax + By + Cz + Dw &gt;= 0. Points that exist on or behind the clipping plane are clipped from the scene.
     * 
     * The plane equation used by this method exists in world space and is set by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setclipplane">IDirect3DDevice9::SetClipPlane</a> method.
     * @param {Integer} Index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Index of the clipping plane for which the plane equation coefficients are retrieved.
     * @param {Pointer<Float>} pPlane Type: <b>float*</b>
     * 
     * Pointer to a four-element array of values that represent the coefficients of the clipping plane in the form of the general plane equation. See Remarks.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value is D3DERR_INVALIDCALL. This error indicates that the value in Index exceeds the maximum clipping plane index supported by the device, or that the array at pPlane is not large enough to contain four floating-point values.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getclipplane
     */
    GetClipPlane(Index, pPlane) {
        pPlaneMarshal := pPlane is VarRef ? "float*" : "ptr"

        result := ComCall(56, this, "uint", Index, pPlaneMarshal, pPlane, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetRenderState method (d3d9helper.h) sets a single device render-state parameter.
     * @param {D3DRENDERSTATETYPE} State Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drenderstatetype">D3DRENDERSTATETYPE</a></b>
     * 
     * Device state variable that is being modified. This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drenderstatetype">D3DRENDERSTATETYPE</a> enumerated type.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * New value for the device render state to be set. The meaning of this parameter is dependent on the value specified for <i>State</i>. For example, if <i>State</i> were D3DRS_SHADEMODE, the second parameter would be one member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dshademode">D3DSHADEMODE</a> enumerated type.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if one of the arguments is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setrenderstate
     */
    SetRenderState(State, Value) {
        result := ComCall(57, this, D3DRENDERSTATETYPE, State, "uint", Value, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetRenderState method (d3d9.h) retrieves a render-state value for a device.
     * @remarks
     * This method will not return device state for a device that is created using D3DCREATE_PUREDEVICE. If you want to use this method, you must create your device with any of the other values in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE</a>."
     * @param {D3DRENDERSTATETYPE} State Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drenderstatetype">D3DRENDERSTATETYPE</a></b>
     * 
     * Device state variable that is being queried. This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drenderstatetype">D3DRENDERSTATETYPE</a> enumerated type.
     * @param {Pointer<Integer>} pValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to a variable that receives the value of the queried render state variable when the method returns.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL if one of the arguments is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getrenderstate
     */
    GetRenderState(State, pValue) {
        pValueMarshal := pValue is VarRef ? "uint*" : "ptr"

        result := ComCall(58, this, D3DRENDERSTATETYPE, State, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::CreateStateBlock method (d3d9.h) creates a new state block that contains the values for all device states, vertex-related states, or pixel-related states.
     * @remarks
     * Vertex-related device states typically refer to those states that affect how the system processes vertices. Pixel-related states generally refer to device states that affect how the system processes pixel or depth-buffer data during rasterization. Some states are contained in both groups. 
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 9 and Direct3D 10:
     * 
     * In Direct3D 9, a state block contains state data, for the states it was requested to capture, when the object is created. To change the value of the state block, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dstateblock9-capture">IDirect3DStateBlock9::Capture</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-beginstateblock">IDirect3DDevice9::BeginStateBlock</a>/<a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-endstateblock">IDirect3DDevice9::EndStateBlock</a>. There is no state saved when a state block object is created in Direct3D 10.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {D3DSTATEBLOCKTYPE} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dstateblocktype">D3DSTATEBLOCKTYPE</a></b>
     * 
     * Type of state data that the method should capture. This parameter can be set to a value defined in the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dstateblocktype">D3DSTATEBLOCKTYPE</a> enumerated type.
     * @returns {IDirect3DStateBlock9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dstateblock9">IDirect3DStateBlock9</a>**</b>
     * 
     * Pointer to a state block interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dstateblock9">IDirect3DStateBlock9</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createstateblock
     */
    CreateStateBlock(Type) {
        result := ComCall(59, this, D3DSTATEBLOCKTYPE, Type, "ptr*", &ppSB := 0, "HRESULT")
        return IDirect3DStateBlock9(ppSB)
    }

    /**
     * The IDirect3DDevice9::BeginStateBlock method (d3d9.h) signals Direct3D to begin recording a device-state block.
     * @remarks
     * Applications can ensure that all recorded states are valid by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-validatedevice">IDirect3DDevice9::ValidateDevice</a> method prior to calling this method.
     * 
     * The following methods can be recorded in a state block, after calling <b>IDirect3DDevice9::BeginStateBlock</b> and before <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-endstateblock">IDirect3DDevice9::EndStateBlock</a>. 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-lightenable">IDirect3DDevice9::LightEnable</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setclipplane">IDirect3DDevice9::SetClipPlane</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setcurrenttexturepalette">IDirect3DDevice9::SetCurrentTexturePalette</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setfvf">IDirect3DDevice9::SetFVF</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setindices">IDirect3DDevice9::SetIndices</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setlight">IDirect3DDevice9::SetLight</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setmaterial">IDirect3DDevice9::SetMaterial</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setnpatchmode">IDirect3DDevice9::SetNPatchMode</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setpixelshader">IDirect3DDevice9::SetPixelShader</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setpixelshaderconstantb">IDirect3DDevice9::SetPixelShaderConstantB</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setpixelshaderconstantf">IDirect3DDevice9::SetPixelShaderConstantF</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setpixelshaderconstanti">IDirect3DDevice9::SetPixelShaderConstantI</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setrenderstate">IDirect3DDevice9::SetRenderState</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setsamplerstate">IDirect3DDevice9::SetSamplerState</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setscissorrect">IDirect3DDevice9::SetScissorRect</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setstreamsource">IDirect3DDevice9::SetStreamSource</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setstreamsourcefreq">IDirect3DDevice9::SetStreamSourceFreq</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-settexture">IDirect3DDevice9::SetTexture</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-settexturestagestate">IDirect3DDevice9::SetTextureStageState</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-settransform">IDirect3DDevice9::SetTransform</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setviewport">IDirect3DDevice9::SetViewport</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setvertexdeclaration">IDirect3DDevice9::SetVertexDeclaration</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setvertexshader">IDirect3DDevice9::SetVertexShader</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setvertexshaderconstantb">IDirect3DDevice9::SetVertexShaderConstantB</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setvertexshaderconstantf">IDirect3DDevice9::SetVertexShaderConstantF</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setvertexshaderconstanti">IDirect3DDevice9::SetVertexShaderConstantI</a>
     * </li>
     * </ul>
     * The ordering of state changes in a state block is not guaranteed. If the same state is specified multiple times in a state block, only the last value is used.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_INVALIDCALL, E_OUTOFMEMORY.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-beginstateblock
     */
    BeginStateBlock() {
        result := ComCall(60, this, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::EndStateBlock method (d3d9.h) signals Direct3D to stop recording a device-state block and retrieve a pointer to the state block interface.
     * @returns {IDirect3DStateBlock9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dstateblock9">IDirect3DStateBlock9</a>**</b>
     * 
     * Pointer to a state block interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dstateblock9">IDirect3DStateBlock9</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-endstateblock
     */
    EndStateBlock() {
        result := ComCall(61, this, "ptr*", &ppSB := 0, "HRESULT")
        return IDirect3DStateBlock9(ppSB)
    }

    /**
     * The IDirect3DDevice9::SetClipStatus method (d3d9.h) sets the clip status.
     * @remarks
     * Clip status is used during software vertex processing. Therefore, this method is not supported on pure or nonpure hardware processing devices. For more information about pure devices, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE</a>.
     * 
     * When clipping is enabled during vertex processing (by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-processvertices">IDirect3DDevice9::ProcessVertices</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-drawprimitive">IDirect3DDevice9::DrawPrimitive</a>, or other drawing functions), Direct3D computes a clip code for every vertex. The clip code is a combination of D3DCS_* bits. When a vertex is outside a particular clipping plane, the corresponding bit is set in the clipping code. Direct3D maintains the clip status using <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dclipstatus9">D3DCLIPSTATUS9</a>, which has ClipUnion and ClipIntersection members. ClipUnion is a bitwise "OR" of all vertex clip codes and ClipIntersection is a bitwise "AND" of all vertex clip codes. Initial values are zero for ClipUnion and 0xFFFFFFFF for ClipIntersection. When D3DRS_CLIPPING is set to <b>FALSE</b>, ClipUnion and ClipIntersection are set to zero. Direct3D updates the clip status during drawing calls. To compute clip status for a particular object, set ClipUnion and ClipIntersection to their initial value and continue drawing.
     * 
     * Clip status is not updated by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-drawrectpatch">IDirect3DDevice9::DrawRectPatch</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-drawtripatch">IDirect3DDevice9::DrawTriPatch</a> because there is no software emulation for them.
     * @param {Pointer<D3DCLIPSTATUS9>} pClipStatus Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dclipstatus9">D3DCLIPSTATUS9</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dclipstatus9">D3DCLIPSTATUS9</a> structure, describing the clip status settings to be set.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     *  If one of the arguments is invalid, the return value is D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setclipstatus
     */
    SetClipStatus(pClipStatus) {
        result := ComCall(62, this, D3DCLIPSTATUS9.Ptr, pClipStatus, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetClipStatus method (d3d9.h) retrieves the clip status.
     * @remarks
     * When clipping is enabled during vertex processing (by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-processvertices">IDirect3DDevice9::ProcessVertices</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-drawprimitive">IDirect3DDevice9::DrawPrimitive</a>, or other drawing functions), Direct3D computes a clip code for every vertex. The clip code is a combination of D3DCS_* bits. When a vertex is outside a particular clipping plane, the corresponding bit is set in the clipping code. Direct3D maintains the clip status using <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dclipstatus9">D3DCLIPSTATUS9</a>, which has ClipUnion and ClipIntersection members. ClipUnion is a bitwise "OR" of all vertex clip codes and ClipIntersection is a bitwise "AND" of all vertex clip codes. Initial values are zero for ClipUnion and 0xFFFFFFFF for ClipIntersection. When D3DRS_CLIPPING is set to <b>FALSE</b>, ClipUnion and ClipIntersection are set to zero. Direct3D updates the clip status during drawing calls. To compute clip status for a particular object, set ClipUnion and ClipIntersection to their initial value and continue drawing.
     * 
     * Clip status is not updated by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-drawrectpatch">IDirect3DDevice9::DrawRectPatch</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-drawtripatch">IDirect3DDevice9::DrawTriPatch</a> because there is no software emulation for them.
     * 
     * Clip status is used during software vertex processing. Therefore, this method is not supported on pure or nonpure hardware processing devices. For more information about pure devices, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE</a>.
     * @param {Pointer<D3DCLIPSTATUS9>} pClipStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dclipstatus9">D3DCLIPSTATUS9</a>*</b>
     * 
     *  Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dclipstatus9">D3DCLIPSTATUS9</a> structure that describes the clip status.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     * 
     * 
     * D3DERR_INVALIDCALL is returned if the argument is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getclipstatus
     */
    GetClipStatus(pClipStatus) {
        result := ComCall(63, this, D3DCLIPSTATUS9.Ptr, pClipStatus, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetTexture method (d3d9.h) retrieves a texture assigned to a stage for a device.
     * @remarks
     * Typically, methods that return state will not work on a device that is created using D3DCREATE_PUREDEVICE. This method however, will work even on a pure device because it returns an interface.
     * 
     * Calling this method will increase the internal reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dtexture9">IDirect3DTexture9</a> interface. Failure to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when finished using this <b>IDirect3DTexture9</b> interface results in a memory leak.
     * @param {Integer} Stage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Stage identifier of the texture to retrieve. Stage identifiers are zero-based.
     * @returns {IDirect3DBaseTexture9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a> interface, representing the returned texture.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-gettexture
     */
    GetTexture(Stage) {
        result := ComCall(64, this, "uint", Stage, "ptr*", &ppTexture := 0, "HRESULT")
        return IDirect3DBaseTexture9(ppTexture)
    }

    /**
     * The IDirect3DDevice9::SetTexture method (d3d9helper.h) assigns a texture to a stage for a device.
     * @remarks
     * <b>SetTexture</b> is not allowed if the texture is created with a pool type of D3DPOOL_SCRATCH. <b>SetTexture</b> is not allowed with a pool type of D3DPOOL_SYSTEMMEM texture unless DevCaps is set with D3DDEVCAPS_TEXTURESYSTEMMEMORY.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-settexture
     */
    SetTexture(Stage, pTexture) {
        result := ComCall(65, this, "uint", Stage, "ptr", pTexture, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetTextureStageState method (d3d9.h) retrieves a state value for an assigned texture.
     * @remarks
     * This method will not return device state for a device that is created using D3DCREATE_PUREDEVICE. If you want to use this method, you must create your device with any of the other flag values in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE</a>."
     * @param {Integer} Stage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Stage identifier of the texture for which the state is retrieved. Stage identifiers are zero-based. Devices can have up to eight set textures, so the maximum value allowed for Stage is 7.
     * @param {D3DTEXTURESTAGESTATETYPE} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturestagestatetype">D3DTEXTURESTAGESTATETYPE</a></b>
     * 
     * Texture state to retrieve. This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturestagestatetype">D3DTEXTURESTAGESTATETYPE</a> enumerated type.
     * @param {Pointer<Integer>} pValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer a variable to fill with the retrieved state value. The meaning of the retrieved value is determined by the Type parameter.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-gettexturestagestate
     */
    GetTextureStageState(Stage, Type, pValue) {
        pValueMarshal := pValue is VarRef ? "uint*" : "ptr"

        result := ComCall(66, this, "uint", Stage, D3DTEXTURESTAGESTATETYPE, Type, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetTextureStageState method (d3d9helper.h) sets the state value for the currently assigned texture.
     * @param {Integer} Stage Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Stage identifier of the texture for which the state value is set. Stage identifiers are zero-based. Devices can have up to eight set textures, so the maximum value allowed for Stage is 7.
     * @param {D3DTEXTURESTAGESTATETYPE} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturestagestatetype">D3DTEXTURESTAGESTATETYPE</a></b>
     * 
     * Texture state to set. This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturestagestatetype">D3DTEXTURESTAGESTATETYPE</a> enumerated type.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * State value to set. The meaning of this value is determined by the Type parameter.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-settexturestagestate
     */
    SetTextureStageState(Stage, Type, Value) {
        result := ComCall(67, this, "uint", Stage, D3DTEXTURESTAGESTATETYPE, Type, "uint", Value, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetSamplerState method (d3d9.h) gets the sampler state value.
     * @remarks
     * This method will not return device state for a device that is created using D3DCREATE_PUREDEVICE. If you want to use this method, you must create your device with any of the other values in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE</a>."
     * @param {Integer} Sampler Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The sampler stage index.
     * @param {D3DSAMPLERSTATETYPE} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsamplerstatetype">D3DSAMPLERSTATETYPE</a></b>
     * 
     * This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsamplerstatetype">D3DSAMPLERSTATETYPE</a> enumerated type.
     * @param {Pointer<Integer>} pValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * State value to get. The meaning of this value is determined by the Type parameter.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getsamplerstate
     */
    GetSamplerState(Sampler, Type, pValue) {
        pValueMarshal := pValue is VarRef ? "uint*" : "ptr"

        result := ComCall(68, this, "uint", Sampler, D3DSAMPLERSTATETYPE, Type, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetSamplerState method (d3d9helper.h) sets the sampler state value.
     * @param {Integer} Sampler Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The sampler stage index. For more info about sampler stage, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/vertex-textures-in-vs-3-0">Sampling Stage Registers in vs_3_0 (DirectX HLSL)</a>.
     * @param {D3DSAMPLERSTATETYPE} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsamplerstatetype">D3DSAMPLERSTATETYPE</a></b>
     * 
     * This parameter can be any member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsamplerstatetype">D3DSAMPLERSTATETYPE</a> enumerated type.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * State value to set. The meaning of this value is determined by the Type parameter.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setsamplerstate
     */
    SetSamplerState(Sampler, Type, Value) {
        result := ComCall(69, this, "uint", Sampler, D3DSAMPLERSTATETYPE, Type, "uint", Value, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::ValidateDevice method (d3d9.h) reports the device's ability to render the current texture-blending operations and arguments in a single pass.
     * @remarks
     * The <b>IDirect3DDevice9::ValidateDevice</b> method should be used to validate scenarios only when other capabilities are deficient. For example, in a multistage texturing scenario, you could query the MaxTextureBlendStages and MaxSimultaneousTextures members of a <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure to determine if multistage texturing is possible on the device.
     * 
     * Current hardware does not necessarily implement all possible combinations of operations and arguments. You can determine whether a particular blending operation can be performed with given arguments by setting the desired blending operation, and then calling the <b>IDirect3DDevice9::ValidateDevice</b> method. 
     * 
     * The <b>IDirect3DDevice9::ValidateDevice</b> method uses the current render states, textures, and texture-stage states to perform validation at the time of the call. Changes to these factors after the call invalidate the previous result, and the method must be called again before rendering a scene.
     * 
     * For best performance, call <b>IDirect3DDevice9::ValidateDevice</b> at initialization time; do not use it within a render loop.
     * 
     * Using diffuse iterated values, either as an argument or as an operation (D3DTA_DIFFUSED3DTOP_BLENDDIFFUSEALPHA) is rarely supported on current hardware. Most hardware can introduce iterated color data only at the last texture operation stage.
     * 
     * Try to specify the texture (D3DTA_TEXTURE) for each stage as the first argument, rather than the second argument.
     * 
     * Many cards do not support use of diffuse or scalar values at arbitrary texture stages. Often, these are available only at the first or last texture-blending stage.
     * 
     * Many cards do not have a blending unit associated with the first texture that is capable of more than replicating alpha to color channels or inverting the input. Therefore, your application might need to use only the second texture stage, if possible. On such hardware, the first unit is presumed to be in its default state, which has the first color argument set to D3DTA_TEXTURE with the D3DTOP_SELECTARG1 operation.
     * 
     * Operations on the output alpha that are more intricate than or substantially different from the color operations are less likely to be supported. 
     * 
     * Some hardware does not support simultaneous use of D3DTA_TFACTOR and D3DTA_DIFFUSE.
     * 
     * Many cards do not support simultaneous use of multiple textures and mipmapped trilinear filtering. If trilinear filtering has been requested for a texture involved in multitexture blending operations and validation fails, turn off trilinear filtering and revalidate. In this case, you might want to perform multipass rendering instead.
     * @param {Pointer<Integer>} pNumPasses Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to a DWORD value to fill with the number of rendering passes needed to complete the desired effect through multipass rendering.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_CONFLICTINGRENDERSTATE, D3DERR_CONFLICTINGTEXTUREFILTER, D3DERR_DEVICELOST, D3DERR_DRIVERINTERNALERROR, D3DERR_TOOMANYOPERATIONS, D3DERR_UNSUPPORTEDALPHAARG, D3DERR_UNSUPPORTEDALPHAOPERATION, D3DERR_UNSUPPORTEDCOLORARG, D3DERR_UNSUPPORTEDCOLOROPERATION, D3DERR_UNSUPPORTEDFACTORVALUE, D3DERR_UNSUPPORTEDTEXTUREFILTER, D3DERR_WRONGTEXTUREFORMAT,.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-validatedevice
     */
    ValidateDevice(pNumPasses) {
        pNumPassesMarshal := pNumPasses is VarRef ? "uint*" : "ptr"

        result := ComCall(70, this, pNumPassesMarshal, pNumPasses, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetPaletteEntries method (d3d9.h) sets palette entries.
     * @remarks
     * For Direct3D 9 applications, any palette sent to this method must conform to the D3DPTEXTURECAPS_ALPHAPALETTE capability bit of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure. If D3DPTEXTURECAPS_ALPHAPALETTE is not set, every entry in the palette must have alpha set to 1.0 or this method will fail with D3DERR_INVALIDCALL. If D3DPTEXTURECAPS_ALPHAPALETTE is set, then any set of alpha values are allowed. Note that the debug runtime will print a warning message if all palette entries have alpha set to 0. 
     * 
     * A single logical palette is associated with the device, and is shared by all texture stages.
     * @param {Integer} PaletteNumber Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An ordinal value identifying the particular palette upon which the operation is to be performed.
     * @param {Pointer<PALETTEENTRY>} pEntries Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-paletteentry">PALETTEENTRY</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-paletteentry">PALETTEENTRY</a> structure, representing the palette entries to set. The number of <b>PALETTEENTRY</b> structures pointed to by pEntries is assumed to be 256. See Remarks.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setpaletteentries
     */
    SetPaletteEntries(PaletteNumber, pEntries) {
        result := ComCall(71, this, "uint", PaletteNumber, PALETTEENTRY.Ptr, pEntries, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetPaletteEntries method (d3d9.h) retrieves palette entries.
     * @remarks
     * For more information about <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-paletteentry">PALETTEENTRY</a>, see the Platform SDK.
     * 
     * <div class="alert"><b>Note</b>  As of Direct3D 9, the peFlags member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-paletteentry">PALETTEENTRY</a> structure does not work the way it is documented in the Platform SDK. The peFlags member is now the alpha channel for 8-bit palettized formats.</div>
     * <div> </div>
     * @param {Integer} PaletteNumber Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An ordinal value identifying the particular palette to retrieve.
     * @param {Pointer<PALETTEENTRY>} pEntries Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-paletteentry">PALETTEENTRY</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-paletteentry">PALETTEENTRY</a> structure, representing the returned palette entries.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getpaletteentries
     */
    GetPaletteEntries(PaletteNumber, pEntries) {
        result := ComCall(72, this, "uint", PaletteNumber, PALETTEENTRY.Ptr, pEntries, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetCurrentTexturePalette method (d3d9.h) sets the current texture palette.
     * @remarks
     * A single logical palette is associated with the device, and is shared by all texture stages.
     * @param {Integer} PaletteNumber Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Value that specifies the texture palette to set as the current texture palette.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setcurrenttexturepalette
     */
    SetCurrentTexturePalette(PaletteNumber) {
        result := ComCall(73, this, "uint", PaletteNumber, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetCurrentTexturePalette method (d3d9.h) retrieves the current texture palette.
     * @param {Pointer<Integer>} PaletteNumber Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to a returned value that identifies the current texture palette.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be: D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getcurrenttexturepalette
     */
    GetCurrentTexturePalette(PaletteNumber) {
        PaletteNumberMarshal := PaletteNumber is VarRef ? "uint*" : "ptr"

        result := ComCall(74, this, PaletteNumberMarshal, PaletteNumber, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetScissorRect method (d3d9helper.h) sets the scissor rectangle.
     * @remarks
     * The scissor rectangle is used as a rectangular clipping region.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/rectangles">Rectangles (Direct3D 9)</a> for further information on the use of rectangles in DirectX.
     * @param {Pointer<RECT>} pRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that defines the rendering area within the render target if scissor test is enabled. This parameter may not be <b>NULL</b>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setscissorrect
     */
    SetScissorRect(pRect) {
        result := ComCall(75, this, RECT.Ptr, pRect, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetScissorRect method (d3d9.h) gets the scissor rectangle.
     * @remarks
     * The scissor rectangle is used as a rectangular clipping region.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/rectangles">Rectangles (Direct3D 9)</a> for further information on the use of rectangles in DirectX.
     * @param {Pointer<RECT>} pRect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Returns a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that defines the rendering area within the render target if scissor test is enabled.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be the following:
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getscissorrect
     */
    GetScissorRect(pRect) {
        result := ComCall(76, this, RECT.Ptr, pRect, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetSoftwareVertexProcessing method (d3d9helper.h) allows you to switch between software and hardware vertex processing modes.
     * @remarks
     * The restrictions for changing modes are as follows (also refer to the notes on the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE</a> constants):
     * 
     * <ul>
     * <li>If a device is created with D3DCREATE_SOFTWARE_VERTEXPROCESSING, the vertex processing will be done in software and cannot be changed.</li>
     * <li>If a device is created with D3DCREATE_HARDWARE_VERTEXPROCESSING, the vertex processing will be done in hardware and cannot be changed.</li>
     * <li>If a device is created with D3DCREATE_MIXED_VERTEXPROCESSING, the vertex processing will be done in hardware by default. The processing can be switched to software (or back to hardware) using <b>IDirect3DDevice9::SetSoftwareVertexProcessing</b>.</li>
     * </ul>
     * An application can create a mixed-mode device to use both the software vertex processing and the hardware vertex processing. To switch between the two vertex processing modes in DirectX 8.x, use IDirect3DDevice8::SetRenderState with the render state D3DRS_SOFTWAREVERTEXPROCESSING and the appropriate DWORD argument. The drawback of the render state approach was the difficulty in defining the semantics for state blocks. Applications and the runtime had to do extra work and be careful while recording and playing back state blocks.
     * 
     * In Direct3D 9, use <b>SetSoftwareVertexProcessing</b> instead. This new API is not recorded by StateBlocks.
     * @param {BOOL} bSoftware Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> to specify software vertex processing; <b>FALSE</b> to specify hardware vertex processing.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setsoftwarevertexprocessing
     */
    SetSoftwareVertexProcessing(bSoftware) {
        result := ComCall(77, this, BOOL, bSoftware, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetSoftwareVertexProcessing method (d3d9.h) gets the vertex processing (hardware or software) mode.
     * @remarks
     * An application can create a mixed-mode device to use both the software vertex processing and the hardware vertex processing. To switch between the two vertex processing modes in DirectX 8.x, use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setrenderstate">IDirect3DDevice9::SetRenderState</a> with the render state D3DRS_SOFTWAREVERTEXPROCESSING and the appropriate BOOL argument. The drawback of the render state approach was the difficulty in defining the semantics for state blocks. Applications and the runtime had to do extra work and be careful while recording and playing back state blocks.
     * 
     * In Direct3D 9, use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setsoftwarevertexprocessing">IDirect3DDevice9::SetSoftwareVertexProcessing</a> instead. This new API is not recorded by StateBlocks.
     * 
     *  Also refer to the notes for the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcreate">D3DCREATE</a> constants.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns <b>TRUE</b> if software vertex processing is set. Otherwise, it returns <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getsoftwarevertexprocessing
     */
    GetSoftwareVertexProcessing() {
        result := ComCall(78, this, BOOL)
        return result
    }

    /**
     * The IDirect3DDevice9::SetNPatchMode method (d3d9.h) enables or disables N-patches.
     * @param {Float} nSegments Type: <b>float</b>
     * 
     * Specifies the number of subdivision segments. If the number of segments is less than 1.0, N-patches are disabled. The default value is 0.0.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setnpatchmode
     */
    SetNPatchMode(nSegments) {
        result := ComCall(79, this, "float", nSegments, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetNPatchMode method (d3d9.h) gets the N-patch mode segments.
     * @returns {Float} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Specifies the number of subdivision segments. If the number of segments is less than 1.0, N-patches are disabled. The default value is 0.0.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getnpatchmode
     */
    GetNPatchMode() {
        result := ComCall(80, this, Float32)
        return result
    }

    /**
     * The IDirect3DDevice9::DrawPrimitive method (d3d9.h) renders a sequence of non-indexed, geometric primitives of the specified type from the current set of data input streams.
     * @remarks
     * When converting a legacy application to Direct3D 9, you must add a call to either <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setfvf">IDirect3DDevice9::SetFVF</a> to use the fixed function pipeline, or <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setvertexdeclaration">IDirect3DDevice9::SetVertexDeclaration</a> to use a vertex shader before you make any Draw calls.
     * @param {D3DPRIMITIVETYPE} PrimitiveType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dprimitivetype">D3DPRIMITIVETYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dprimitivetype">D3DPRIMITIVETYPE</a> enumerated type, describing the type of primitive to render.
     * @param {Integer} StartVertex Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index of the first vertex to load. Beginning at StartVertex the correct number of vertices will be read out of the vertex buffer.
     * @param {Integer} PrimitiveCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of primitives to render. The maximum number of primitives allowed is determined by checking the MaxPrimitiveCount member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure. PrimitiveCount is the number of primitives as determined by the primitive type. If it is a line list, each primitive has two vertices. If it is a triangle list, each primitive has three vertices.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be 
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-drawprimitive
     */
    DrawPrimitive(PrimitiveType, StartVertex, PrimitiveCount) {
        result := ComCall(81, this, D3DPRIMITIVETYPE, PrimitiveType, "uint", StartVertex, "uint", PrimitiveCount, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::DrawIndexedPrimitive method (d3d9.h) renders the specified geometric primitive into an array of vertices.
     * @remarks
     * This method draws indexed primitives from the current set of data input streams. MinIndex  and all the indices in the index stream are relative to the BaseVertexIndex.
     * 
     * The MinIndex  and NumVertices  parameters specify the range of vertex indices used for each <b>IDirect3DDevice9::DrawIndexedPrimitive</b> call. These are used to optimize vertex processing of indexed primitives by processing a sequential range of vertices prior to indexing into these vertices. It is invalid for any indices used during this call to reference any vertices outside of this range.
     * 
     * <b>IDirect3DDevice9::DrawIndexedPrimitive</b> fails if no index array is set.
     * 
     * The D3DPT_POINTLIST member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dprimitivetype">D3DPRIMITIVETYPE</a> enumerated type is not supported and is not a valid type for this method.
     * 
     * When converting a legacy application to Direct3D 9, you must add a call to either <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setfvf">IDirect3DDevice9::SetFVF</a> to use the fixed function pipeline, or <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setvertexdeclaration">IDirect3DDevice9::SetVertexDeclaration</a> to use a vertex shader before you make any Draw calls.
     * @param {D3DPRIMITIVETYPE} param0 
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
     * Index of the first index to use when accessing the vertex buffer. Beginning at StartIndex to index vertices from the vertex buffer.
     * @param {Integer} primCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of primitives to render. The number of vertices used is a function of the primitive count and the primitive type. The maximum number of primitives allowed is determined by checking the MaxPrimitiveCount member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a> structure.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be the following:
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-drawindexedprimitive
     */
    DrawIndexedPrimitive(param0, BaseVertexIndex, MinVertexIndex, NumVertices, startIndex, primCount) {
        result := ComCall(82, this, D3DPRIMITIVETYPE, param0, "int", BaseVertexIndex, "uint", MinVertexIndex, "uint", NumVertices, "uint", startIndex, "uint", primCount, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::DrawPrimitiveUP method (d3d9.h) renders data specified by a user memory pointer as a sequence of geometric primitives of the specified type.
     * @remarks
     * This method is intended for use in applications that are unable to store their vertex data in vertex buffers. This method supports only a single vertex stream. The effect of this call is to use the provided vertex data pointer and stride for vertex stream 0. It is invalid to have the declaration of the current vertex shader refer to vertex streams other than stream 0.
     * 
     * Following any <b>IDirect3DDevice9::DrawPrimitiveUP</b> call, the stream 0 settings, referenced by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-getstreamsource">IDirect3DDevice9::GetStreamSource</a>, are set to <b>NULL</b>.
     * 
     * The vertex data passed to <b>IDirect3DDevice9::DrawPrimitiveUP</b> does not need to persist after the call. Direct3D completes its access to that data prior to returning from the call.
     * 
     * When converting a legacy application to Direct3D 9, you must add a call to either <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setfvf">IDirect3DDevice9::SetFVF</a> to use the fixed function pipeline, or <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setvertexdeclaration">IDirect3DDevice9::SetVertexDeclaration</a> to use a vertex shader before you make any Draw calls.
     * @param {D3DPRIMITIVETYPE} PrimitiveType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dprimitivetype">D3DPRIMITIVETYPE</a></b>
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be: D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-drawprimitiveup
     */
    DrawPrimitiveUP(PrimitiveType, PrimitiveCount, pVertexStreamZeroData, VertexStreamZeroStride) {
        pVertexStreamZeroDataMarshal := pVertexStreamZeroData is VarRef ? "ptr" : "ptr"

        result := ComCall(83, this, D3DPRIMITIVETYPE, PrimitiveType, "uint", PrimitiveCount, pVertexStreamZeroDataMarshal, pVertexStreamZeroData, "uint", VertexStreamZeroStride, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::DrawIndexedPrimitiveUP method (d3d9.h) renders the specified geometric primitive with data specified by a user memory pointer.
     * @remarks
     * This method is intended for use in applications that are unable to store their vertex data in vertex buffers. This method supports only a single vertex stream, which must be declared as stream 0.
     * 
     * Following any <b>IDirect3DDevice9::DrawIndexedPrimitiveUP</b> call, the stream 0 settings, referenced by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-getstreamsource">IDirect3DDevice9::GetStreamSource</a>, are set to <b>NULL</b>. Also, the index buffer setting for <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setindices">IDirect3DDevice9::SetIndices</a> is set to <b>NULL</b>.
     * 
     * The vertex data passed to <b>IDirect3DDevice9::DrawIndexedPrimitiveUP</b> does not need to persist after the call. Direct3D completes its access to that data prior to returning from the call.
     * 
     * When converting a legacy application to Direct3D 9, you must add a call to either <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setfvf">IDirect3DDevice9::SetFVF</a> to use the fixed function pipeline, or <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setvertexdeclaration">IDirect3DDevice9::SetVertexDeclaration</a> to use a vertex shader before you make any Draw calls.
     * @param {D3DPRIMITIVETYPE} PrimitiveType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dprimitivetype">D3DPRIMITIVETYPE</a></b>
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
     * @param {D3DFORMAT} IndexDataFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a></b>
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be the following:
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-drawindexedprimitiveup
     */
    DrawIndexedPrimitiveUP(PrimitiveType, MinVertexIndex, NumVertices, PrimitiveCount, pIndexData, IndexDataFormat, pVertexStreamZeroData, VertexStreamZeroStride) {
        pIndexDataMarshal := pIndexData is VarRef ? "ptr" : "ptr"
        pVertexStreamZeroDataMarshal := pVertexStreamZeroData is VarRef ? "ptr" : "ptr"

        result := ComCall(84, this, D3DPRIMITIVETYPE, PrimitiveType, "uint", MinVertexIndex, "uint", NumVertices, "uint", PrimitiveCount, pIndexDataMarshal, pIndexData, D3DFORMAT, IndexDataFormat, pVertexStreamZeroDataMarshal, pVertexStreamZeroData, "uint", VertexStreamZeroStride, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::ProcessVertices method (d3d9.h) applies the vertex processing defined by the vertex shader to the set of input data streams.
     * @remarks
     * The order of operations for this method is as follows:
     * 
     * <ul>
     * <li>Transform vertices to projection space using the world + view + projection matrix.</li>
     * <li>Compute screen coordinates using viewport settings.</li>
     * <li>If clipping is enabled, compute clipping codes and store them in an internal buffer, associated with the destination vertex buffer. If a vertex is inside the viewing frustum, its screen coordinates are computed. If the vertex is outside the viewing frustum, the vertex is stored in the destination vertex buffer in projection space coordinates.</li>
     * <li>Other notes: The user does not have access to the internal clip code buffer. No clipping is done on triangles or any other primitives.</li>
     * </ul>
     * The destination vertex buffer, pDestBuffer, must be created with a nonzero FVF parameter in <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createvertexbuffer">IDirect3DDevice9::CreateVertexBuffer</a>. The FVF code specified during the call to the <b>IDirect3DDevice9::CreateVertexBuffer</b> method specifies the vertex elements present in the destination vertex buffer.
     * 
     * When Direct3D generates texture coordinates, or copies or transforms input texture coordinates, and the output texture coordinate format defines more texture coordinate components than Direct3D generates, Direct3D does not change these extra components.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-processvertices
     */
    ProcessVertices(SrcStartIndex, DestIndex, VertexCount, pDestBuffer, pVertexDecl, Flags) {
        result := ComCall(85, this, "uint", SrcStartIndex, "uint", DestIndex, "uint", VertexCount, "ptr", pDestBuffer, "ptr", pVertexDecl, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::CreateVertexDeclaration method (d3d9.h) creates a vertex shader declaration from the device and the vertex elements.
     * @remarks
     * See the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/vertex-declaration">Vertex Declaration (Direct3D 9)</a> page for a detailed description of how to map vertex declarations between different versions of DirectX.
     * @param {Pointer<D3DVERTEXELEMENT9>} pVertexElements Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvertexelement9">D3DVERTEXELEMENT9</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvertexelement9">D3DVERTEXELEMENT9</a> vertex elements.
     * @returns {IDirect3DVertexDeclaration9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9">IDirect3DVertexDeclaration9</a>**</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9">IDirect3DVertexDeclaration9</a> pointer that returns the created vertex shader declaration.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createvertexdeclaration
     */
    CreateVertexDeclaration(pVertexElements) {
        result := ComCall(86, this, D3DVERTEXELEMENT9.Ptr, pVertexElements, "ptr*", &ppDecl := 0, "HRESULT")
        return IDirect3DVertexDeclaration9(ppDecl)
    }

    /**
     * The IDirect3DDevice9::SetVertexDeclaration method (d3d9helper.h) sets a Vertex Declaration (Direct3D 9).
     * @remarks
     * A vertex declaration is an IDirect3DVertexDeclaration9 object that defines the data members of a vertex (i.e. texture coordinates, colors, normals, etc.). This data can be useful for implementing <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-pguide">vertex shaders and pixel shaders</a>.
     * @param {IDirect3DVertexDeclaration9} pDecl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9">IDirect3DVertexDeclaration9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9">IDirect3DVertexDeclaration9</a> object, which contains the vertex declaration.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     *  The return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setvertexdeclaration
     */
    SetVertexDeclaration(pDecl) {
        result := ComCall(87, this, "ptr", pDecl, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetVertexDeclaration method (d3d9.h) gets a vertex shader declaration.
     * @returns {IDirect3DVertexDeclaration9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9">IDirect3DVertexDeclaration9</a>**</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexdeclaration9">IDirect3DVertexDeclaration9</a> object that is returned.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getvertexdeclaration
     */
    GetVertexDeclaration() {
        result := ComCall(88, this, "ptr*", &ppDecl := 0, "HRESULT")
        return IDirect3DVertexDeclaration9(ppDecl)
    }

    /**
     * The IDirect3DDevice9::SetFVF method (d3d9.h) sets the current vertex stream declaration.
     * @remarks
     * Here are the steps necessary to initialize and use vertices that have a position, diffuse and specular color, and texture coordinates:
     * 
     * <ol>
     * <li>
     * Define the custom vertex type and FVF code.
     * 
     * 
     * ```
     * 
     * struct LVertex
     * {
     *     FLOAT    x, y, z;
     *     D3DCOLOR specular, diffuse;
     *     FLOAT    tu, tv;
     * };
     *     
     * const DWORD VertexFVF = (D3DFVF_XYZ | D3DFVF_DIFFUSE |
     *                          D3DFVF_SPECULAR | D3DFVF_TEX1 );
     * 
     * ```
     * 
     * 
     * </li>
     * <li>
     * Create a vertex buffer with enough room for four vertices using <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createvertexbuffer">IDirect3DDevice9::CreateVertexBuffer</a>.
     *     
     * 
     * 
     * 
     * ```
     * 
     * g_d3dDevice->CreateVertexBuffer( 4*sizeof(LVertex),  
     *     D3DUSAGE_WRITEONLY, VertexFVF, D3DPOOL_DEFAULT, &pBigSquareVB, NULL );
     * 
     * ```
     * 
     * 
     * </li>
     * <li>
     * Set the values for each vertex.
     *     
     *     
     *     
     * 
     * 
     * 
     * ```
     * 
     * LVertex * v;
     * pBigSquareVB->Lock( 0, 0, (BYTE**)&v, 0 );
     *     
     * v[0].x  = 0.0f;  v[0].y  = 10.0;  v[0].z  = 10.0f;
     * v[0].diffuse  = 0xffff0000;
     * v[0].specular = 0xff00ff00;
     * v[0].tu = 0.0f;  v[0].tv = 0.0f;
     *     
     * v[1].x  = 0.0f;  v[1].y  = 0.0f;  v[1].z  = 10.0f;
     * v[1].diffuse  = 0xff00ff00;
     * v[1].specular = 0xff00ffff;
     * v[1].tu = 0.0f;  v[1].tv = 0.0f;
     *     
     * v[2].x  = 10.0f; v[2].y  = 10.0f; v[2].z  = 10.0f;
     * v[2].diffuse  = 0xffff00ff;
     * v[2].specular = 0xff000000;
     * v[2].tu = 0.0f;  v[2].tv = 0.0f;
     *     
     * v[3].x  = 0.0f; v[3].y  = 10.0f;  v[3].z = 10.0f;
     * v[3].diffuse  = 0xffffff00;
     * v[3].specular = 0xffff0000;
     * v[3].tu = 0.0f; v[3].tv = 0.0f;
     *     
     * pBigSquareVB->Unlock();
     * 
     * ```
     * 
     * 
     * </li>
     * <li>
     * The vertex buffer has been initialized and is ready to render. The following code example shows how to use the legacy FVF to draw a square.
     *     
     *     
     *     
     * 
     * 
     * 
     * ```
     * 
     * g_d3dDevice->SetFVF(VertexFVF);
     * g_d3dDevice->SetStreamSource(0, pBigSquareVB, 0, sizeof(LVertex));
     * g_d3dDevice->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0 ,2);
     * 
     * ```
     * 
     * 
     * </li>
     * </ol>
     * Here are the steps necessary to initialize and use vertices that have a position, a normal, and texture coordinates:
     * 
     * <ol>
     * <li>
     * Define the custom vertex type and FVF code.
     * 
     * 
     * ```
     * 
     * struct Vertex
     * {
     *     FLOAT x, y, z;
     *     FLOAT nx, ny, nz;
     *     FLOAT tu, tv;
     * };
     *     
     * const DWORD VertexFVF = ( D3DFVF_XYZ | D3DFVF_NORMAL | D3DFVF_TEX1 );
     * 
     * ```
     * 
     * 
     * </li>
     * <li>
     * Create a vertex buffer with enough room for four vertices using <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createvertexbuffer">IDirect3DDevice9::CreateVertexBuffer</a> (similar to the example above).
     * 
     * </li>
     * <li>
     * Set the values for each vertex.
     *     
     *     
     *     
     * 
     * 
     * 
     * ```
     * 
     * Vertex * v;
     * pBigSquareVB->Lock(0, 0, (BYTE**)&v, 0);
     *     
     * v[0].x  = 0.0f;  v[0].y  = 10.0;  v[0].z  = 10.0f;
     * v[0].nx = 0.0f;  v[0].ny = 1.0f;  v[0].nz = 0.0f;
     * v[0].tu = 0.0f;  v[0].tv = 0.0f;
     * 
     * v[1].x  = 0.0f;  v[1].y  = 0.0f;  v[1].z  = 10.0f;
     * v[1].nx = 0.0f;  v[1].ny = 1.0f;  v[1].nz = 0.0f;
     * v[1].tu = 0.0f;  v[1].tv = 0.0f;
     *     
     * v[2].x  = 10.0f; v[2].y  = 10.0f; v[2].z  = 10.0f;
     * v[2].nx = 0.0f;  v[2].ny = 1.0f;  v[2].nz = 0.0f;
     * v[2].tu = 0.0f;  v[2].tv = 0.0f;
     *     
     * v[3].x  = 0.0f; v[3].y  = 10.0f;  v[3].z = 10.0f;
     * v[3].nx = 0.0f; v[3].ny = 1.0f;   v[3].nz = 0.0f;
     * v[3].tu = 0.0f; v[3].tv = 0.0f;
     *     
     * pBigSquareVB->Unlock();
     * 
     * ```
     * 
     * 
     * </li>
     * <li>Draw the object (similar to the example above).</li>
     * </ol>
     * @param {Integer} FVF Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * DWORD containing the fixed function vertex type. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dfvf">D3DFVF</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be:
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setfvf
     */
    SetFVF(FVF) {
        result := ComCall(89, this, "uint", FVF, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetFVF method (d3d9.h) gets the fixed vertex function declaration.
     * @remarks
     * The fixed vertex function declaration is a set of FVF flags that determine how vertices processed by the fixed function pipeline will be used.
     * @param {Pointer<Integer>} pFVF Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * A DWORD pointer to the fixed function vertex type. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dfvf">D3DFVF</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getfvf
     */
    GetFVF(pFVF) {
        pFVFMarshal := pFVF is VarRef ? "uint*" : "ptr"

        result := ComCall(90, this, pFVFMarshal, pFVF, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::CreateVertexShader method (d3d9.h) creates a vertex shader.
     * @remarks
     * When a device is created, <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">IDirect3D9::CreateDevice</a> uses the behavior flag to determine whether to process vertices in hardware or software. There are three possibilities:
     * 
     * <ul>
     * <li>Process vertices in hardware by setting D3DCREATE_HARDWARE_VERTEXPROCESSING.</li>
     * <li>Process vertices in software by setting D3DCREATE_SOFTWARE_VERTEXPROCESSING.</li>
     * <li>Process vertices in either hardware or software by setting D3DCREATE_MIXED_VERTEXPROCESSING. To switch a mixed-mode device between software and hardware processing, use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setsoftwarevertexprocessing">IDirect3DDevice9::SetSoftwareVertexProcessing</a>.</li>
     * </ul>
     * For an example using <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dxcompileshader">D3DXCompileShader</a>, see <a href="https://msdn.microsoft.com/library/Ee417786(v=VS.85).aspx">HLSLwithoutEffects Sample</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createvertexshader
     */
    CreateVertexShader(pFunction) {
        pFunctionMarshal := pFunction is VarRef ? "uint*" : "ptr"

        result := ComCall(91, this, pFunctionMarshal, pFunction, "ptr*", &ppShader := 0, "HRESULT")
        return IDirect3DVertexShader9(ppShader)
    }

    /**
     * The IDirect3DDevice9::SetVertexShader method (d3d9helper.h) sets the vertex shader.
     * @remarks
     * To set a fixed-function vertex shader (after having set a programmable vertex shader), call <b>IDirect3DDevice9::SetVertexShader</b>(NULL) to release the programmable shader, and then call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-setfvf">IDirect3DDevice9::SetFVF</a> with the fixed-function vertex format.
     * @param {IDirect3DVertexShader9} pShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexshader9">IDirect3DVertexShader9</a>*</b>
     * 
     * Vertex shader interface. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexshader9">IDirect3DVertexShader9</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setvertexshader
     */
    SetVertexShader(pShader) {
        result := ComCall(92, this, "ptr", pShader, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetVertexShader method (d3d9.h) retrieves the currently set vertex shader.
     * @remarks
     * Typically, methods that return state will not work on a device that is created using D3DCREATE_PUREDEVICE. This method however, will work even on a pure device because it returns an interface.
     * @returns {IDirect3DVertexShader9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexshader9">IDirect3DVertexShader9</a>**</b>
     * 
     * Pointer to a vertex shader interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getvertexshader
     */
    GetVertexShader() {
        result := ComCall(93, this, "ptr*", &ppShader := 0, "HRESULT")
        return IDirect3DVertexShader9(ppShader)
    }

    /**
     * The IDirect3DDevice9::SetVertexShaderConstantF method (d3d9helper.h) sets a floating-point vertex shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Float>} pConstantData Type: <b>const float*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4fCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four float vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setvertexshaderconstantf
     */
    SetVertexShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "float*" : "ptr"

        result := ComCall(94, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4fCount, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetVertexShaderConstantF method (d3d9.h) gets a floating-point vertex shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Float>} pConstantData Type: <b>float*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4fCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four float vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getvertexshaderconstantf
     */
    GetVertexShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "float*" : "ptr"

        result := ComCall(95, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4fCount, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetVertexShaderConstantI method (d3d9helper.h) sets an integer vertex shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Integer>} pConstantData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4iCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four integer vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setvertexshaderconstanti
     */
    SetVertexShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(96, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4iCount, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetVertexShaderConstantI method (d3d9.h) gets an integer vertex shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Integer>} pConstantData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4iCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four integer vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getvertexshaderconstanti
     */
    GetVertexShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(97, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4iCount, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetVertexShaderConstantB method (d3d9helper.h) sets a Boolean vertex shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<BOOL>} pConstantData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} BoolCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of boolean values in the array of constants.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setvertexshaderconstantb
     */
    SetVertexShaderConstantB(StartRegister, pConstantData, BoolCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(98, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", BoolCount, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetVertexShaderConstantB method (d3d9.h) gets a Boolean vertex shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<BOOL>} pConstantData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} BoolCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of Boolean values in the array of constants.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getvertexshaderconstantb
     */
    GetVertexShaderConstantB(StartRegister, pConstantData, BoolCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(99, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", BoolCount, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetStreamSource method (d3d9helper.h) binds a vertex buffer to a device data stream.
     * @remarks
     * When a FVF vertex shader is used, the stride of the vertex stream must match the vertex size, computed from the FVF. When a declaration is used, the stride should be greater than or equal to the stream size computed from the declaration.
     * 
     * When calling SetStreamSource, the stride is normally required to be equal to the vertex size. However, there are times when you may want to draw multiple instances of the same or similar geometry (such as when using instancing to draw). For this case, use a zero stride to tell the runtime not to increment the vertex buffer offset (ie: use the same vertex data for all instances). For more information about instancing, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/efficiently-drawing-multiple-instances-of-geometry">Efficiently Drawing Multiple Instances of Geometry (Direct3D 9)</a>.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setstreamsource
     */
    SetStreamSource(StreamNumber, pStreamData, OffsetInBytes, Stride) {
        result := ComCall(100, this, "uint", StreamNumber, "ptr", pStreamData, "uint", OffsetInBytes, "uint", Stride, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetStreamSource method (d3d9.h) retrieves a vertex buffer bound to the specified data stream.
     * @remarks
     * A stream is defined as a uniform array of component data, where each component consists of one or more elements representing a single entity such as position, normal, color, and so on.
     * 
     * When a FVF vertex shader is used, the stride of the vertex stream must match the vertex size, computed from the FVF. When a declaration is used, the stride should be greater than or equal to the stream size computed from the declaration.
     * 
     * Calling this method increases the internal reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a> interface. Failure to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when finished using this <b>IDirect3DVertexBuffer9</b> interface results in a memory leak.
     * @param {Integer} StreamNumber Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the data stream, in the range from 0 to the maximum number of streams minus one.
     * @param {Pointer<Integer>} pOffsetInBytes Type:  [out]<b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer containing the offset from the beginning of the stream to the beginning of the vertex data. The offset is measured in bytes. See Remarks.
     * @param {Pointer<Integer>} pStride Type: [out] <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Pointer to a returned stride of the component, in bytes. See Remarks.
     * @returns {IDirect3DVertexBuffer9} Type: [in, out] <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvertexbuffer9">IDirect3DVertexBuffer9</a> interface, representing the returned vertex buffer bound to the specified data stream.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getstreamsource
     */
    GetStreamSource(StreamNumber, pOffsetInBytes, pStride) {
        pOffsetInBytesMarshal := pOffsetInBytes is VarRef ? "uint*" : "ptr"
        pStrideMarshal := pStride is VarRef ? "uint*" : "ptr"

        result := ComCall(101, this, "uint", StreamNumber, "ptr*", &ppStreamData := 0, pOffsetInBytesMarshal, pOffsetInBytes, pStrideMarshal, pStride, "HRESULT")
        return IDirect3DVertexBuffer9(ppStreamData)
    }

    /**
     * The IDirect3DDevice9::SetStreamSourceFreq method (d3d9helper.h) sets the stream source frequency divider value.
     * @remarks
     * There are two constants defined in d3d9types.h that are designed to use with SetStreamSourceFreq: D3DSTREAMSOURCE_INDEXEDDATA and D3DSTREAMSOURCE_INSTANCEDATA. To see how to use the constants, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/efficiently-drawing-multiple-instances-of-geometry">Efficiently Drawing Multiple Instances of Geometry (Direct3D 9)</a>.
     * @param {Integer} StreamNumber Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Stream source number.
     * @param {Integer} Setting 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setstreamsourcefreq
     */
    SetStreamSourceFreq(StreamNumber, Setting) {
        result := ComCall(102, this, "uint", StreamNumber, "uint", Setting, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetStreamSourceFreq method (d3d9.h) gets the stream source frequency divider value.
     * @remarks
     * Vertex shaders can now be invoked more than once per vertex. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/efficiently-drawing-multiple-instances-of-geometry">Drawing Non-Indexed Geometry</a>.
     * @param {Integer} StreamNumber Type: [in] <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Stream source number.
     * @param {Pointer<Integer>} pSetting 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getstreamsourcefreq
     */
    GetStreamSourceFreq(StreamNumber, pSetting) {
        pSettingMarshal := pSetting is VarRef ? "uint*" : "ptr"

        result := ComCall(103, this, "uint", StreamNumber, pSettingMarshal, pSetting, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetIndices method (d3d9.h) sets index data.
     * @remarks
     * When an application no longer holds a references to this interface, the interface will automatically be freed.
     * 
     * The <b>IDirect3DDevice9::SetIndices</b> method sets the current index array to an index buffer. The single set of indices is used to index all streams.
     * @param {IDirect3DIndexBuffer9} pIndexData Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dindexbuffer9">IDirect3DIndexBuffer9</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dindexbuffer9">IDirect3DIndexBuffer9</a> interface, representing the index data to be set.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be: D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setindices
     */
    SetIndices(pIndexData) {
        result := ComCall(104, this, "ptr", pIndexData, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetIndices method (d3d9.h) retrieves index data.
     * @remarks
     * Calling this method increases the internal reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dindexbuffer9">IDirect3DIndexBuffer9</a> interface. Failure to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when finished using this <b>IDirect3DIndexBuffer9</b> interface results in a memory leak.
     * @returns {IDirect3DIndexBuffer9} Type: [out] <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dindexbuffer9">IDirect3DIndexBuffer9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dindexbuffer9">IDirect3DIndexBuffer9</a> interface, representing the returned index data.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getindices
     */
    GetIndices() {
        result := ComCall(105, this, "ptr*", &ppIndexData := 0, "HRESULT")
        return IDirect3DIndexBuffer9(ppIndexData)
    }

    /**
     * The IDirect3DDevice9::CreatePixelShader method (d3d9.h) creates a pixel shader.
     * @param {Pointer<Integer>} pFunction Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to the pixel shader function token array, specifying the blending operations. This value cannot be <b>NULL</b>.
     * @returns {IDirect3DPixelShader9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dpixelshader9">IDirect3DPixelShader9</a>**</b>
     * 
     * Pointer to the returned pixel shader interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dpixelshader9">IDirect3DPixelShader9</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createpixelshader
     */
    CreatePixelShader(pFunction) {
        pFunctionMarshal := pFunction is VarRef ? "uint*" : "ptr"

        result := ComCall(106, this, pFunctionMarshal, pFunction, "ptr*", &ppShader := 0, "HRESULT")
        return IDirect3DPixelShader9(ppShader)
    }

    /**
     * The IDirect3DDevice9::SetPixelShader method (d3d9.h) sets the current pixel shader to a previously created pixel shader.
     * @param {IDirect3DPixelShader9} pShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dpixelshader9">IDirect3DPixelShader9</a>*</b>
     * 
     * Pixel shader interface.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setpixelshader
     */
    SetPixelShader(pShader) {
        result := ComCall(107, this, "ptr", pShader, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetPixelShader method (d3d9.h) retrieves the currently set pixel shader.
     * @remarks
     * This method will not work on a device that is created using D3DCREATE_PUREDEVICE.
     * @returns {IDirect3DPixelShader9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dpixelshader9">IDirect3DPixelShader9</a>**</b>
     * 
     * Pointer to a pixel shader interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getpixelshader
     */
    GetPixelShader() {
        result := ComCall(108, this, "ptr*", &ppShader := 0, "HRESULT")
        return IDirect3DPixelShader9(ppShader)
    }

    /**
     * The IDirect3DDevice9::SetPixelShaderConstantF method (d3d9helper.h) sets a floating-point shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Float>} pConstantData Type: <b>const float*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4fCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four float vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setpixelshaderconstantf
     */
    SetPixelShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "float*" : "ptr"

        result := ComCall(109, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4fCount, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetPixelShaderConstantF method (d3d9.h) gets a floating-point shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Float>} pConstantData Type: <b>float*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4fCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four float vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getpixelshaderconstantf
     */
    GetPixelShaderConstantF(StartRegister, pConstantData, Vector4fCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "float*" : "ptr"

        result := ComCall(110, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4fCount, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetPixelShaderConstantI method (d3d9helper.h) sets an integer shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Integer>} pConstantData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4iCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four integer vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setpixelshaderconstanti
     */
    SetPixelShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(111, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4iCount, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetPixelShaderConstantI method (d3d9.h) gets an integer shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<Integer>} pConstantData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">int</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} Vector4iCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of four integer vectors in the array of constants.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getpixelshaderconstanti
     */
    GetPixelShaderConstantI(StartRegister, pConstantData, Vector4iCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(112, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", Vector4iCount, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::SetPixelShaderConstantB method (d3d9.h) sets a Boolean shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<BOOL>} pConstantData Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} BoolCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of boolean values in the array of constants.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-setpixelshaderconstantb
     */
    SetPixelShaderConstantB(StartRegister, pConstantData, BoolCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(113, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", BoolCount, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::GetPixelShaderConstantB method (d3d9.h) gets a Boolean shader constant.
     * @param {Integer} StartRegister Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Register number that will contain the first constant value.
     * @param {Pointer<BOOL>} pConstantData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Pointer to an array of constants.
     * @param {Integer} BoolCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of Boolean values in the array of constants.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-getpixelshaderconstantb
     */
    GetPixelShaderConstantB(StartRegister, pConstantData, BoolCount) {
        pConstantDataMarshal := pConstantData is VarRef ? "int*" : "ptr"

        result := ComCall(114, this, "uint", StartRegister, pConstantDataMarshal, pConstantData, "uint", BoolCount, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::DrawRectPatch method (d3d9.h) draws a rectangular patch using the currently set streams.
     * @remarks
     * For static patches: Set the vertex shader, set the appropriate streams, supply patch information in the pRectPatchInfo parameter, and specify a handle so that Direct3D can capture and cache information. Call <b>IDirect3DDevice9::DrawRectPatch</b> subsequently with pRectPatchInfo set to <b>NULL</b> to efficiently draw the patch. When drawing a cached patch, the currently set streams are ignored. Override the cached pNumSegs by specifying a new value for pNumSegs. When rendering a cached patch, you must set the same vertex shader that was set when it was captured.
     * 
     * Calling <b>IDirect3DDevice9::DrawRectPatch</b> with a handle invalidates the same handle cached by a previous <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-drawtripatch">IDirect3DDevice9::DrawTriPatch</a> call.
     * 
     * For dynamic patches, the patch data changes for every rendering of the patch, so it is not efficient to cache information. The application can convey this to Direct3D by setting Handle to 0. In this case, Direct3D draws the patch using the currently set streams and the pNumSegs values, and does not cache any information. It is not valid to simultaneously set Handle to 0 and pRectPatchInfo to <b>NULL</b>.
     * @param {Integer} _Handle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Handle to the rectangular patch to draw.
     * @param {Pointer<Float>} pNumSegs Type: <b>const float*</b>
     * 
     * Pointer to an array of four floating-point values that identify the number of segments each edge of the rectangle patch should be divided into when tessellated. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drectpatch-info">D3DRECTPATCH_INFO</a>.
     * @param {Pointer<D3DRECTPATCH_INFO>} pRectPatchInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drectpatch-info">D3DRECTPATCH_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drectpatch-info">D3DRECTPATCH_INFO</a> structure, describing the rectangular patch to draw.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be 
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-drawrectpatch
     */
    DrawRectPatch(_Handle, pNumSegs, pRectPatchInfo) {
        pNumSegsMarshal := pNumSegs is VarRef ? "float*" : "ptr"

        result := ComCall(115, this, "uint", _Handle, pNumSegsMarshal, pNumSegs, D3DRECTPATCH_INFO.Ptr, pRectPatchInfo, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::DrawTriPatch method (d3d9.h) draws a triangular patch using the currently set streams.
     * @remarks
     * For static patches: Set the vertex shader, set the appropriate streams, supply patch information in the pTriPatchInfo parameter, and specify a handle so that Direct3D can capture and cache information. To efficiently draw the patch, call <b>IDirect3DDevice9::DrawTriPatch</b> with pTriPatchInfo set to <b>NULL</b>. When drawing a cached patch, the currently set streams are ignored. Override the cached pNumSegs by specifying a new value for pNumSegs. When rendering a cached patch, you must set the same vertex shader that was set when it was captured.
     * 
     * Calling <b>IDirect3DDevice9::DrawTriPatch</b> with a handle invalidates the same handle cached by a previous <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-drawrectpatch">IDirect3DDevice9::DrawRectPatch</a> call.
     * 
     * For dynamic patches, the patch data changes for every rendering of the patch so it is not efficient to cache information. The application can convey this to Direct3D by setting Handle to 0. In this case, Direct3D draws the patch using the currently set streams and the pNumSegs values, and does not cache any information. It is not valid to simultaneously set Handle to 0 and pTriPatchInfo to <b>NULL</b>.
     * @param {Integer} _Handle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Handle to the triangular patch to draw.
     * @param {Pointer<Float>} pNumSegs Type: <b>const float*</b>
     * 
     * Pointer to an array of three floating-point values that identify the number of segments each edge of the triangle patch should be divided into when tessellated. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtripatch-info">D3DTRIPATCH_INFO</a>.
     * @param {Pointer<D3DTRIPATCH_INFO>} pTriPatchInfo Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtripatch-info">D3DTRIPATCH_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtripatch-info">D3DTRIPATCH_INFO</a> structure, describing the triangular high-order patch to draw.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be 
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-drawtripatch
     */
    DrawTriPatch(_Handle, pNumSegs, pTriPatchInfo) {
        pNumSegsMarshal := pNumSegs is VarRef ? "float*" : "ptr"

        result := ComCall(116, this, "uint", _Handle, pNumSegsMarshal, pNumSegs, D3DTRIPATCH_INFO.Ptr, pTriPatchInfo, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::DeletePatch method (d3d9.h) frees a cached high-order patch.
     * @param {Integer} _Handle Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Handle of the cached high-order patch to delete.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be 
     *      D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-deletepatch
     */
    DeletePatch(_Handle) {
        result := ComCall(117, this, "uint", _Handle, "HRESULT")
        return result
    }

    /**
     * The IDirect3DDevice9::CreateQuery method (d3d9.h) creates a status query.
     * @remarks
     * This method is provided for both synchronous and asynchronous queries. It takes the place of GetInfo, which is no longer supported in Direct3D 9.
     * 
     * Synchronous and asynchronous queries are created with <b>IDirect3DDevice9::CreateQuery</b> with <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dquerytype">D3DQUERYTYPE</a>. When a query has been created and the API calls have been made that are being queried, use <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dquery9-issue">IDirect3DQuery9::Issue</a> to issue a query and  <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dquery9-getdata">IDirect3DQuery9::GetData</a> to get the results of the query.
     * @param {D3DQUERYTYPE} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dquerytype">D3DQUERYTYPE</a></b>
     * 
     * Identifies the query type. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dquerytype">D3DQUERYTYPE</a>.
     * @returns {IDirect3DQuery9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dquery9">IDirect3DQuery9</a>**</b>
     * 
     * Returns a pointer to the query interface that manages the query object. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dquery9">IDirect3DQuery9</a>. 
     * 
     * This parameter can be set to <b>NULL</b> to see if a query is supported. If the query is not supported, the method returns D3DERR_NOTAVAILABLE.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3ddevice9-createquery
     */
    CreateQuery(Type) {
        result := ComCall(118, this, D3DQUERYTYPE, Type, "ptr*", &ppQuery := 0, "HRESULT")
        return IDirect3DQuery9(ppQuery)
    }

    Query(iid) {
        if (IDirect3DDevice9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TestCooperativeLevel := CallbackCreate(GetMethod(implObj, "TestCooperativeLevel"), flags, 1)
        this.vtbl.GetAvailableTextureMem := CallbackCreate(GetMethod(implObj, "GetAvailableTextureMem"), flags, 1)
        this.vtbl.EvictManagedResources := CallbackCreate(GetMethod(implObj, "EvictManagedResources"), flags, 1)
        this.vtbl.GetDirect3D := CallbackCreate(GetMethod(implObj, "GetDirect3D"), flags, 2)
        this.vtbl.GetDeviceCaps := CallbackCreate(GetMethod(implObj, "GetDeviceCaps"), flags, 2)
        this.vtbl.GetDisplayMode := CallbackCreate(GetMethod(implObj, "GetDisplayMode"), flags, 3)
        this.vtbl.GetCreationParameters := CallbackCreate(GetMethod(implObj, "GetCreationParameters"), flags, 2)
        this.vtbl.SetCursorProperties := CallbackCreate(GetMethod(implObj, "SetCursorProperties"), flags, 4)
        this.vtbl.SetCursorPosition := CallbackCreate(GetMethod(implObj, "SetCursorPosition"), flags, 4)
        this.vtbl.ShowCursor := CallbackCreate(GetMethod(implObj, "ShowCursor"), flags, 2)
        this.vtbl.CreateAdditionalSwapChain := CallbackCreate(GetMethod(implObj, "CreateAdditionalSwapChain"), flags, 3)
        this.vtbl.GetSwapChain := CallbackCreate(GetMethod(implObj, "GetSwapChain"), flags, 3)
        this.vtbl.GetNumberOfSwapChains := CallbackCreate(GetMethod(implObj, "GetNumberOfSwapChains"), flags, 1)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 2)
        this.vtbl.Present := CallbackCreate(GetMethod(implObj, "Present"), flags, 5)
        this.vtbl.GetBackBuffer := CallbackCreate(GetMethod(implObj, "GetBackBuffer"), flags, 5)
        this.vtbl.GetRasterStatus := CallbackCreate(GetMethod(implObj, "GetRasterStatus"), flags, 3)
        this.vtbl.SetDialogBoxMode := CallbackCreate(GetMethod(implObj, "SetDialogBoxMode"), flags, 2)
        this.vtbl.SetGammaRamp := CallbackCreate(GetMethod(implObj, "SetGammaRamp"), flags, 4)
        this.vtbl.GetGammaRamp := CallbackCreate(GetMethod(implObj, "GetGammaRamp"), flags, 3)
        this.vtbl.CreateTexture := CallbackCreate(GetMethod(implObj, "CreateTexture"), flags, 9)
        this.vtbl.CreateVolumeTexture := CallbackCreate(GetMethod(implObj, "CreateVolumeTexture"), flags, 10)
        this.vtbl.CreateCubeTexture := CallbackCreate(GetMethod(implObj, "CreateCubeTexture"), flags, 8)
        this.vtbl.CreateVertexBuffer := CallbackCreate(GetMethod(implObj, "CreateVertexBuffer"), flags, 7)
        this.vtbl.CreateIndexBuffer := CallbackCreate(GetMethod(implObj, "CreateIndexBuffer"), flags, 7)
        this.vtbl.CreateRenderTarget := CallbackCreate(GetMethod(implObj, "CreateRenderTarget"), flags, 9)
        this.vtbl.CreateDepthStencilSurface := CallbackCreate(GetMethod(implObj, "CreateDepthStencilSurface"), flags, 9)
        this.vtbl.UpdateSurface := CallbackCreate(GetMethod(implObj, "UpdateSurface"), flags, 5)
        this.vtbl.UpdateTexture := CallbackCreate(GetMethod(implObj, "UpdateTexture"), flags, 3)
        this.vtbl.GetRenderTargetData := CallbackCreate(GetMethod(implObj, "GetRenderTargetData"), flags, 3)
        this.vtbl.GetFrontBufferData := CallbackCreate(GetMethod(implObj, "GetFrontBufferData"), flags, 3)
        this.vtbl.StretchRect := CallbackCreate(GetMethod(implObj, "StretchRect"), flags, 6)
        this.vtbl.ColorFill := CallbackCreate(GetMethod(implObj, "ColorFill"), flags, 4)
        this.vtbl.CreateOffscreenPlainSurface := CallbackCreate(GetMethod(implObj, "CreateOffscreenPlainSurface"), flags, 7)
        this.vtbl.SetRenderTarget := CallbackCreate(GetMethod(implObj, "SetRenderTarget"), flags, 3)
        this.vtbl.GetRenderTarget := CallbackCreate(GetMethod(implObj, "GetRenderTarget"), flags, 3)
        this.vtbl.SetDepthStencilSurface := CallbackCreate(GetMethod(implObj, "SetDepthStencilSurface"), flags, 2)
        this.vtbl.GetDepthStencilSurface := CallbackCreate(GetMethod(implObj, "GetDepthStencilSurface"), flags, 2)
        this.vtbl.BeginScene := CallbackCreate(GetMethod(implObj, "BeginScene"), flags, 1)
        this.vtbl.EndScene := CallbackCreate(GetMethod(implObj, "EndScene"), flags, 1)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 7)
        this.vtbl.SetTransform := CallbackCreate(GetMethod(implObj, "SetTransform"), flags, 3)
        this.vtbl.GetTransform := CallbackCreate(GetMethod(implObj, "GetTransform"), flags, 3)
        this.vtbl.MultiplyTransform := CallbackCreate(GetMethod(implObj, "MultiplyTransform"), flags, 3)
        this.vtbl.SetViewport := CallbackCreate(GetMethod(implObj, "SetViewport"), flags, 2)
        this.vtbl.GetViewport := CallbackCreate(GetMethod(implObj, "GetViewport"), flags, 2)
        this.vtbl.SetMaterial := CallbackCreate(GetMethod(implObj, "SetMaterial"), flags, 2)
        this.vtbl.GetMaterial := CallbackCreate(GetMethod(implObj, "GetMaterial"), flags, 2)
        this.vtbl.SetLight := CallbackCreate(GetMethod(implObj, "SetLight"), flags, 3)
        this.vtbl.GetLight := CallbackCreate(GetMethod(implObj, "GetLight"), flags, 3)
        this.vtbl.LightEnable := CallbackCreate(GetMethod(implObj, "LightEnable"), flags, 3)
        this.vtbl.GetLightEnable := CallbackCreate(GetMethod(implObj, "GetLightEnable"), flags, 3)
        this.vtbl.SetClipPlane := CallbackCreate(GetMethod(implObj, "SetClipPlane"), flags, 3)
        this.vtbl.GetClipPlane := CallbackCreate(GetMethod(implObj, "GetClipPlane"), flags, 3)
        this.vtbl.SetRenderState := CallbackCreate(GetMethod(implObj, "SetRenderState"), flags, 3)
        this.vtbl.GetRenderState := CallbackCreate(GetMethod(implObj, "GetRenderState"), flags, 3)
        this.vtbl.CreateStateBlock := CallbackCreate(GetMethod(implObj, "CreateStateBlock"), flags, 3)
        this.vtbl.BeginStateBlock := CallbackCreate(GetMethod(implObj, "BeginStateBlock"), flags, 1)
        this.vtbl.EndStateBlock := CallbackCreate(GetMethod(implObj, "EndStateBlock"), flags, 2)
        this.vtbl.SetClipStatus := CallbackCreate(GetMethod(implObj, "SetClipStatus"), flags, 2)
        this.vtbl.GetClipStatus := CallbackCreate(GetMethod(implObj, "GetClipStatus"), flags, 2)
        this.vtbl.GetTexture := CallbackCreate(GetMethod(implObj, "GetTexture"), flags, 3)
        this.vtbl.SetTexture := CallbackCreate(GetMethod(implObj, "SetTexture"), flags, 3)
        this.vtbl.GetTextureStageState := CallbackCreate(GetMethod(implObj, "GetTextureStageState"), flags, 4)
        this.vtbl.SetTextureStageState := CallbackCreate(GetMethod(implObj, "SetTextureStageState"), flags, 4)
        this.vtbl.GetSamplerState := CallbackCreate(GetMethod(implObj, "GetSamplerState"), flags, 4)
        this.vtbl.SetSamplerState := CallbackCreate(GetMethod(implObj, "SetSamplerState"), flags, 4)
        this.vtbl.ValidateDevice := CallbackCreate(GetMethod(implObj, "ValidateDevice"), flags, 2)
        this.vtbl.SetPaletteEntries := CallbackCreate(GetMethod(implObj, "SetPaletteEntries"), flags, 3)
        this.vtbl.GetPaletteEntries := CallbackCreate(GetMethod(implObj, "GetPaletteEntries"), flags, 3)
        this.vtbl.SetCurrentTexturePalette := CallbackCreate(GetMethod(implObj, "SetCurrentTexturePalette"), flags, 2)
        this.vtbl.GetCurrentTexturePalette := CallbackCreate(GetMethod(implObj, "GetCurrentTexturePalette"), flags, 2)
        this.vtbl.SetScissorRect := CallbackCreate(GetMethod(implObj, "SetScissorRect"), flags, 2)
        this.vtbl.GetScissorRect := CallbackCreate(GetMethod(implObj, "GetScissorRect"), flags, 2)
        this.vtbl.SetSoftwareVertexProcessing := CallbackCreate(GetMethod(implObj, "SetSoftwareVertexProcessing"), flags, 2)
        this.vtbl.GetSoftwareVertexProcessing := CallbackCreate(GetMethod(implObj, "GetSoftwareVertexProcessing"), flags, 1)
        this.vtbl.SetNPatchMode := CallbackCreate(GetMethod(implObj, "SetNPatchMode"), flags, 2)
        this.vtbl.GetNPatchMode := CallbackCreate(GetMethod(implObj, "GetNPatchMode"), flags, 1)
        this.vtbl.DrawPrimitive := CallbackCreate(GetMethod(implObj, "DrawPrimitive"), flags, 4)
        this.vtbl.DrawIndexedPrimitive := CallbackCreate(GetMethod(implObj, "DrawIndexedPrimitive"), flags, 7)
        this.vtbl.DrawPrimitiveUP := CallbackCreate(GetMethod(implObj, "DrawPrimitiveUP"), flags, 5)
        this.vtbl.DrawIndexedPrimitiveUP := CallbackCreate(GetMethod(implObj, "DrawIndexedPrimitiveUP"), flags, 9)
        this.vtbl.ProcessVertices := CallbackCreate(GetMethod(implObj, "ProcessVertices"), flags, 7)
        this.vtbl.CreateVertexDeclaration := CallbackCreate(GetMethod(implObj, "CreateVertexDeclaration"), flags, 3)
        this.vtbl.SetVertexDeclaration := CallbackCreate(GetMethod(implObj, "SetVertexDeclaration"), flags, 2)
        this.vtbl.GetVertexDeclaration := CallbackCreate(GetMethod(implObj, "GetVertexDeclaration"), flags, 2)
        this.vtbl.SetFVF := CallbackCreate(GetMethod(implObj, "SetFVF"), flags, 2)
        this.vtbl.GetFVF := CallbackCreate(GetMethod(implObj, "GetFVF"), flags, 2)
        this.vtbl.CreateVertexShader := CallbackCreate(GetMethod(implObj, "CreateVertexShader"), flags, 3)
        this.vtbl.SetVertexShader := CallbackCreate(GetMethod(implObj, "SetVertexShader"), flags, 2)
        this.vtbl.GetVertexShader := CallbackCreate(GetMethod(implObj, "GetVertexShader"), flags, 2)
        this.vtbl.SetVertexShaderConstantF := CallbackCreate(GetMethod(implObj, "SetVertexShaderConstantF"), flags, 4)
        this.vtbl.GetVertexShaderConstantF := CallbackCreate(GetMethod(implObj, "GetVertexShaderConstantF"), flags, 4)
        this.vtbl.SetVertexShaderConstantI := CallbackCreate(GetMethod(implObj, "SetVertexShaderConstantI"), flags, 4)
        this.vtbl.GetVertexShaderConstantI := CallbackCreate(GetMethod(implObj, "GetVertexShaderConstantI"), flags, 4)
        this.vtbl.SetVertexShaderConstantB := CallbackCreate(GetMethod(implObj, "SetVertexShaderConstantB"), flags, 4)
        this.vtbl.GetVertexShaderConstantB := CallbackCreate(GetMethod(implObj, "GetVertexShaderConstantB"), flags, 4)
        this.vtbl.SetStreamSource := CallbackCreate(GetMethod(implObj, "SetStreamSource"), flags, 5)
        this.vtbl.GetStreamSource := CallbackCreate(GetMethod(implObj, "GetStreamSource"), flags, 5)
        this.vtbl.SetStreamSourceFreq := CallbackCreate(GetMethod(implObj, "SetStreamSourceFreq"), flags, 3)
        this.vtbl.GetStreamSourceFreq := CallbackCreate(GetMethod(implObj, "GetStreamSourceFreq"), flags, 3)
        this.vtbl.SetIndices := CallbackCreate(GetMethod(implObj, "SetIndices"), flags, 2)
        this.vtbl.GetIndices := CallbackCreate(GetMethod(implObj, "GetIndices"), flags, 2)
        this.vtbl.CreatePixelShader := CallbackCreate(GetMethod(implObj, "CreatePixelShader"), flags, 3)
        this.vtbl.SetPixelShader := CallbackCreate(GetMethod(implObj, "SetPixelShader"), flags, 2)
        this.vtbl.GetPixelShader := CallbackCreate(GetMethod(implObj, "GetPixelShader"), flags, 2)
        this.vtbl.SetPixelShaderConstantF := CallbackCreate(GetMethod(implObj, "SetPixelShaderConstantF"), flags, 4)
        this.vtbl.GetPixelShaderConstantF := CallbackCreate(GetMethod(implObj, "GetPixelShaderConstantF"), flags, 4)
        this.vtbl.SetPixelShaderConstantI := CallbackCreate(GetMethod(implObj, "SetPixelShaderConstantI"), flags, 4)
        this.vtbl.GetPixelShaderConstantI := CallbackCreate(GetMethod(implObj, "GetPixelShaderConstantI"), flags, 4)
        this.vtbl.SetPixelShaderConstantB := CallbackCreate(GetMethod(implObj, "SetPixelShaderConstantB"), flags, 4)
        this.vtbl.GetPixelShaderConstantB := CallbackCreate(GetMethod(implObj, "GetPixelShaderConstantB"), flags, 4)
        this.vtbl.DrawRectPatch := CallbackCreate(GetMethod(implObj, "DrawRectPatch"), flags, 4)
        this.vtbl.DrawTriPatch := CallbackCreate(GetMethod(implObj, "DrawTriPatch"), flags, 4)
        this.vtbl.DeletePatch := CallbackCreate(GetMethod(implObj, "DeletePatch"), flags, 2)
        this.vtbl.CreateQuery := CallbackCreate(GetMethod(implObj, "CreateQuery"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TestCooperativeLevel)
        CallbackFree(this.vtbl.GetAvailableTextureMem)
        CallbackFree(this.vtbl.EvictManagedResources)
        CallbackFree(this.vtbl.GetDirect3D)
        CallbackFree(this.vtbl.GetDeviceCaps)
        CallbackFree(this.vtbl.GetDisplayMode)
        CallbackFree(this.vtbl.GetCreationParameters)
        CallbackFree(this.vtbl.SetCursorProperties)
        CallbackFree(this.vtbl.SetCursorPosition)
        CallbackFree(this.vtbl.ShowCursor)
        CallbackFree(this.vtbl.CreateAdditionalSwapChain)
        CallbackFree(this.vtbl.GetSwapChain)
        CallbackFree(this.vtbl.GetNumberOfSwapChains)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Present)
        CallbackFree(this.vtbl.GetBackBuffer)
        CallbackFree(this.vtbl.GetRasterStatus)
        CallbackFree(this.vtbl.SetDialogBoxMode)
        CallbackFree(this.vtbl.SetGammaRamp)
        CallbackFree(this.vtbl.GetGammaRamp)
        CallbackFree(this.vtbl.CreateTexture)
        CallbackFree(this.vtbl.CreateVolumeTexture)
        CallbackFree(this.vtbl.CreateCubeTexture)
        CallbackFree(this.vtbl.CreateVertexBuffer)
        CallbackFree(this.vtbl.CreateIndexBuffer)
        CallbackFree(this.vtbl.CreateRenderTarget)
        CallbackFree(this.vtbl.CreateDepthStencilSurface)
        CallbackFree(this.vtbl.UpdateSurface)
        CallbackFree(this.vtbl.UpdateTexture)
        CallbackFree(this.vtbl.GetRenderTargetData)
        CallbackFree(this.vtbl.GetFrontBufferData)
        CallbackFree(this.vtbl.StretchRect)
        CallbackFree(this.vtbl.ColorFill)
        CallbackFree(this.vtbl.CreateOffscreenPlainSurface)
        CallbackFree(this.vtbl.SetRenderTarget)
        CallbackFree(this.vtbl.GetRenderTarget)
        CallbackFree(this.vtbl.SetDepthStencilSurface)
        CallbackFree(this.vtbl.GetDepthStencilSurface)
        CallbackFree(this.vtbl.BeginScene)
        CallbackFree(this.vtbl.EndScene)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.SetTransform)
        CallbackFree(this.vtbl.GetTransform)
        CallbackFree(this.vtbl.MultiplyTransform)
        CallbackFree(this.vtbl.SetViewport)
        CallbackFree(this.vtbl.GetViewport)
        CallbackFree(this.vtbl.SetMaterial)
        CallbackFree(this.vtbl.GetMaterial)
        CallbackFree(this.vtbl.SetLight)
        CallbackFree(this.vtbl.GetLight)
        CallbackFree(this.vtbl.LightEnable)
        CallbackFree(this.vtbl.GetLightEnable)
        CallbackFree(this.vtbl.SetClipPlane)
        CallbackFree(this.vtbl.GetClipPlane)
        CallbackFree(this.vtbl.SetRenderState)
        CallbackFree(this.vtbl.GetRenderState)
        CallbackFree(this.vtbl.CreateStateBlock)
        CallbackFree(this.vtbl.BeginStateBlock)
        CallbackFree(this.vtbl.EndStateBlock)
        CallbackFree(this.vtbl.SetClipStatus)
        CallbackFree(this.vtbl.GetClipStatus)
        CallbackFree(this.vtbl.GetTexture)
        CallbackFree(this.vtbl.SetTexture)
        CallbackFree(this.vtbl.GetTextureStageState)
        CallbackFree(this.vtbl.SetTextureStageState)
        CallbackFree(this.vtbl.GetSamplerState)
        CallbackFree(this.vtbl.SetSamplerState)
        CallbackFree(this.vtbl.ValidateDevice)
        CallbackFree(this.vtbl.SetPaletteEntries)
        CallbackFree(this.vtbl.GetPaletteEntries)
        CallbackFree(this.vtbl.SetCurrentTexturePalette)
        CallbackFree(this.vtbl.GetCurrentTexturePalette)
        CallbackFree(this.vtbl.SetScissorRect)
        CallbackFree(this.vtbl.GetScissorRect)
        CallbackFree(this.vtbl.SetSoftwareVertexProcessing)
        CallbackFree(this.vtbl.GetSoftwareVertexProcessing)
        CallbackFree(this.vtbl.SetNPatchMode)
        CallbackFree(this.vtbl.GetNPatchMode)
        CallbackFree(this.vtbl.DrawPrimitive)
        CallbackFree(this.vtbl.DrawIndexedPrimitive)
        CallbackFree(this.vtbl.DrawPrimitiveUP)
        CallbackFree(this.vtbl.DrawIndexedPrimitiveUP)
        CallbackFree(this.vtbl.ProcessVertices)
        CallbackFree(this.vtbl.CreateVertexDeclaration)
        CallbackFree(this.vtbl.SetVertexDeclaration)
        CallbackFree(this.vtbl.GetVertexDeclaration)
        CallbackFree(this.vtbl.SetFVF)
        CallbackFree(this.vtbl.GetFVF)
        CallbackFree(this.vtbl.CreateVertexShader)
        CallbackFree(this.vtbl.SetVertexShader)
        CallbackFree(this.vtbl.GetVertexShader)
        CallbackFree(this.vtbl.SetVertexShaderConstantF)
        CallbackFree(this.vtbl.GetVertexShaderConstantF)
        CallbackFree(this.vtbl.SetVertexShaderConstantI)
        CallbackFree(this.vtbl.GetVertexShaderConstantI)
        CallbackFree(this.vtbl.SetVertexShaderConstantB)
        CallbackFree(this.vtbl.GetVertexShaderConstantB)
        CallbackFree(this.vtbl.SetStreamSource)
        CallbackFree(this.vtbl.GetStreamSource)
        CallbackFree(this.vtbl.SetStreamSourceFreq)
        CallbackFree(this.vtbl.GetStreamSourceFreq)
        CallbackFree(this.vtbl.SetIndices)
        CallbackFree(this.vtbl.GetIndices)
        CallbackFree(this.vtbl.CreatePixelShader)
        CallbackFree(this.vtbl.SetPixelShader)
        CallbackFree(this.vtbl.GetPixelShader)
        CallbackFree(this.vtbl.SetPixelShaderConstantF)
        CallbackFree(this.vtbl.GetPixelShaderConstantF)
        CallbackFree(this.vtbl.SetPixelShaderConstantI)
        CallbackFree(this.vtbl.GetPixelShaderConstantI)
        CallbackFree(this.vtbl.SetPixelShaderConstantB)
        CallbackFree(this.vtbl.GetPixelShaderConstantB)
        CallbackFree(this.vtbl.DrawRectPatch)
        CallbackFree(this.vtbl.DrawTriPatch)
        CallbackFree(this.vtbl.DeletePatch)
        CallbackFree(this.vtbl.CreateQuery)
    }
}
